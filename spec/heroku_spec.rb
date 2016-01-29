require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe TelestreamCloud::Video do
  before(:each) do
    cloud_json = "{\"s3_videos_bucket\":\"my_bucket\",\"id\":\"my_cloud_id\"}"
    stub_http_request(:get, /api.example.com:443\/v2\/factories\/my_cloud_id.json/).
      to_return(:body => cloud_json)

    my_heroku_url = "http://access_key:secret_key@api.example.com:443/my_cloud_id"
    ENV['PANDASTREAM_URL']= my_heroku_url
  end

  it "should get all videos" do
    TelestreamCloud.configure_heroku

    videos_json = "[]"
    stub_http_request(:get, /api.example.com:443\/v3.0\/videos.json/).to_return(:body => videos_json)

    TelestreamCloud::Video.all.should be_empty
  end

  it "should get all videos" do
    TelestreamCloud.configure ENV['PANDASTREAM_URL']

    videos_json = "[]"
    stub_http_request(:get, /api.example.com:443\/v3.0\/videos.json/).to_return(:body => videos_json)

    TelestreamCloud::Video.all.should be_empty
  end


end
