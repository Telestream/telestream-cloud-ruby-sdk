require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe TelestreamCloud::Uploader do
  let(:file_size) { 45_000_000 }
  let(:file) do
    double(:file,
           path: '/foo/bar.mp4',
           size: file_size
          )
  end

  before(:each) do
    TelestreamCloud.configure do
      access_key "my_access_key"
      secret_key "my_secret_key"
      api_host "api.example.com"
      factory_id 'my_cloud_id'
      api_port 85
    end
  end

  subject do
    TelestreamCloud::Uploader.new(file)
  end

  describe '#upload' do
    let(:part_size) { 10_000_000 }
    let(:session_url) { 'http://api.example.com:1234/upload/session?id=1234' }

    let(:video_json) do
      "{\"id\":\"12345\"}"
    end

    context 'with valid session' do
      let(:session_json) do
        "{\"id\":\"1234\",\"location\":\"#{session_url}\",\"parts\":\"5\",\"part_size\":\"#{part_size}\",\"max_connections\":\"16\"}"
      end

      before do
        stub_request(:post, "http://api.example.com:85/v3.0/videos/upload.json")
          .to_return(body: session_json)

        expect(file).to receive(:read).with(part_size).and_return("chunk").exactly(4).times
        expect(file).to receive(:read).with(file_size % part_size).and_return("chunk").once

        5.times do |i|
          expect(file).to receive(:seek).with(i * part_size)
        end
      end

      it 'uploads file' do
        stub_request(:put, session_url).with(headers: { "X-Part" => /[0-3]/ })

        stub_request(:put, session_url)
        .with(headers: { "X-Part" => 4 }, body: "chunk")
        .to_return(body: "{\"id\":\"12345\"}")


        subject.upload
        expect(subject).to be_success
        expect(subject.video).not_to be_nil
        expect(subject.video.id).to eq("12345")
      end

      it 'retries missing chunks' do
        stub_request(:put, session_url)
        stub_request(:put, session_url).with(headers: { "X-Part" => 3 })
          .to_return({body: ""}).then.to_return({body: video_json})

        stub_request(:get, session_url).to_return(body: JSON.generate(missing_parts: [3]))

        expect(file).to receive(:read).with(part_size).and_return("chunk")
        expect(file).to receive(:seek).with(3 * part_size)

        subject.upload

        expect(subject).to be_success
        expect(subject.video).not_to be_nil
        expect(subject.video.id).to eq("12345")
      end

      it 'fails after few tries' do
        stub_request(:put, session_url)
        stub_request(:get, session_url).to_return(body: JSON.generate(missing_parts: [3]))

        expect(file).to receive(:read).with(part_size).and_return("chunk").exactly(4).times
        expect(file).to receive(:seek).with(3 * part_size).exactly(4).times

        subject.upload

        expect(subject.status).to eq(:failed)
        expect(subject.video).to be_nil
        expect(subject.error).to be_a(TelestreamCloud::Uploader::MissingPartError)
      end
    end

    context 'with invalid session' do
      let(:session_json) do
        "{\"error\":\"NotAuthorized\",\"message\":\"Message\"}"
      end

      it 'fails' do
        stub_request(:post, "http://api.example.com:85/v3.0/videos/upload.json")
          .to_return(body: session_json)

        subject.upload

        expect(subject.status).to eq(:failed)
        expect(subject.error).to be_a(TelestreamCloud::Uploader::UploadError)
      end
    end
  end
end
