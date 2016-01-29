require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'timecop'

describe TelestreamCloud do
  before(:each) do
    new_time = Time.utc(2010, 1, 12, 1, 0, 0)
    Timecop.freeze(new_time)
  end

  describe "when not connected" do

    ["get", "post", "put", "delete"].each do |method|
      it "should raise error for #{method}" do
        lambda {
          TelestreamCloud.send(method, nil, nil)
        }.should raise_error(TelestreamCloud::ConfigurationError, "Telestream Cloud is not configured!")
      end
    end

  end

  describe "root configuration with hash" do
    it "should not fail is access_key and secret_key are given" do
      proc do
        TelestreamCloud.configure({:access_key => "bar", :secret_key => "baz"})
      end.should_not raise_error(TelestreamCloud::ConfigurationError)
    end

    it "should fail if access_key or secret_key are missing" do
      proc do
        TelestreamCloud.configure({:secret_key => "baz"})
      end.should raise_error(TelestreamCloud::ConfigurationError)
      proc do
        TelestreamCloud.configure({:access_key => "bar"})
      end.should raise_error(TelestreamCloud::ConfigurationError)
      proc do
        TelestreamCloud.configure({})
      end.should raise_error(TelestreamCloud::ConfigurationError)
    end
  end

  describe "root configuration with block" do
    it "should not fail is access_key and secret_key are given" do
      proc do
        TelestreamCloud.configure do
          access_key "bar"
          secret_key "baz"
        end
      end.should_not raise_error(TelestreamCloud::ConfigurationError)
    end

    it "should fail if access_key or secret_key are missing" do
      proc do
        TelestreamCloud.configure do
          secret_key "baz"
        end
      end.should raise_error(TelestreamCloud::ConfigurationError)
      proc do
        TelestreamCloud.configure do
          access_key "bar"
        end
      end.should raise_error(TelestreamCloud::ConfigurationError)
      proc do
        TelestreamCloud.configure do
        end
      end.should raise_error(TelestreamCloud::ConfigurationError)
    end
  end

  shared_examples_for "Connected" do

    it "should make get request with signed request to panda server" do
      stub_http_request(:get, "http://myapihost:85/v3.0/videos?access_key=my_access_key&factory_id=my_cloud_id&signature=ArhKqAFUwLQl9RhSmnOv5L2CMWhr0ZFOxA0B9IKIg8I=&timestamp=2010-01-12T01%3A00%3A00.000000Z").to_return(:body => "{\"abc\":\"d\"}")
      @tc.get("/videos").should == {'abc' => 'd'}
    end

    it "should create a signed version of the parameters" do
      signed_params = @tc.signed_params('POST',
                                           '/videos.json',
                                           {"param1" => 'one', "param2" => 'two'}
                                           )
      signed_params.should == {
        'access_key' => "my_access_key",
        'timestamp' => "2010-01-12T01:00:00.000000Z",
        'factory_id' => 'my_cloud_id',
        'signature' => 'A/7DSazLSnr8wiX2QUKCWE3C1IXAAdIpEcnFF4Qc8Rw=',
        'param1' => 'one',
        'param2' => 'two'
      }
    end

    it "should create a signed version of the parameters without additional arguments" do
      @tc.signed_params('POST', '/videos.json').should == {
        'access_key' => "my_access_key",
        'timestamp' => "2010-01-12T01:00:00.000000Z",
        'factory_id' => 'my_cloud_id',
        'signature' => 'Ne/W+cvZAZ4yE70PcXgLbPieGrwdaCX9WPUCQeJBPhs='
      }
    end


    it "should create a signed version of the parameters and difficult characters" do
      signed_params = @tc.signed_params('POST',
                                           '/videos.json',
                                           {"tilde" => '~', "space" => ' '}
                                           )
      signed_params.should == {
        'access_key' => "my_access_key",
        'timestamp' => "2010-01-12T01:00:00.000000Z",
        'factory_id' => 'my_cloud_id',
        'signature' => 'g3shJBMg/7Kmbj3kl0eb4ziT3zounhFpC5jJIg+3Kts=',
        'tilde' => '~',
        'space' => ' '
      }
    end


    it "should not include file inside the signature" do
      @tc.signed_params('POST', '/videos.json', { "file" => "my_file" }).should == {
        'access_key' => "my_access_key",
        'timestamp' => "2010-01-12T01:00:00.000000Z",
        'factory_id' => 'my_cloud_id',
        'signature' => 'Ne/W+cvZAZ4yE70PcXgLbPieGrwdaCX9WPUCQeJBPhs=',
        'file' => "my_file"
      }
    end

    it "should stringify keys" do
      @tc.signed_params('POST', '/videos.json', { :file => "symbol_key" }).should == {
        'access_key' => "my_access_key",
        'timestamp' => "2010-01-12T01:00:00.000000Z",
        'factory_id' => 'my_cloud_id',
        'signature' => 'Ne/W+cvZAZ4yE70PcXgLbPieGrwdaCX9WPUCQeJBPhs=',
        'file' => "symbol_key"
      }
    end
  end

  describe "TelestreamCloud.connect " do
    before(:each) do
      @tc = TelestreamCloud.connect!({"access_key" => "my_access_key", "secret_key" => "my_secret_key", "api_host" => "myapihost", "api_port" => 85, "factory_id" => 'my_cloud_id'})
    end
   it_should_behave_like "Connected"
  end

  describe "TelestreamCloud.connect with symbols" do
    before(:each) do
      @tc = TelestreamCloud.connect!({:access_key => "my_access_key", :secret_key => "my_secret_key", :api_host => "myapihost", :api_port => 85, :factory_id => 'my_cloud_id'})
    end

   it_should_behave_like "Connected"
  end

  describe "Panda::Connection.new" do
     before(:each) do
       @tc = TelestreamCloud::Connection.new({"access_key" => "my_access_key", "secret_key" => "my_secret_key", "api_host" => "myapihost", "api_port" => 85, "factory_id" => 'my_cloud_id'})
     end
    it_should_behave_like "Connected"
  end

  describe "Using hash as a return format" do

    before(:each) do
      @tc = TelestreamCloud::Connection.new({"access_key" => "my_access_key", "secret_key" => "my_secret_key", "api_host" => "myapihost", "api_port" => 85, "factory_id" => 'my_cloud_id' })
    end

    it "should make get request" do
      stub_http_request(:get, "http://myapihost:85/v3.0/videos?access_key=my_access_key&factory_id=my_cloud_id&signature=ArhKqAFUwLQl9RhSmnOv5L2CMWhr0ZFOxA0B9IKIg8I=&timestamp=2010-01-12T01%3A00%3A00.000000Z").to_return(:body => "{\"key\":\"value\"}")
      @tc.get("/videos").should == {'key' => 'value'}
    end

  end

  # describe "ActiveSupport::JSON parsing" do
  #
  #   it "should use active support if it has been defined and if restclient is used " do
  #     @tc = Panda::Connection.new({"access_key" => "my_access_key", "secret_key" => "my_secret_key", "api_host" => "myapihost", "api_port" => 85, "cloud_id" => 'my_cloud_id' })
  #     Panda.adapter = 'restclient'
  #
  #     stub_http_request(:get, "http://myapihost:85/v2/videos?access_key=my_access_key&cloud_id=my_cloud_id&signature=DYpg2K6d7kGo%2FuWPO%2FaQgtQmY3BPtFEtQgdQhVe8teM%3D&timestamp=2010-01-12T01%3A00%3A00.000000Z").to_return(:body => "abc")
  #
  #
  #     module ActiveSupport
  #       class JSON; end
  #     end
  #
  #     ActiveSupport::JSON.should_receive(:decode).with("abc").and_return("blah")
  #     @tc.get("/videos").should == "blah"
  #
  #     Object.send :remove_const, :ActiveSupport
  #   end
  # end

  describe "parsing" do
    it "should raise an error if the response is not JSON parsable" do
      @connection = TelestreamCloud::Connection.new({"access_key" => "my_access_key", "secret_key" => "my_secret_key", "api_host" => "myapihost", "api_port" => 85, "cloud_id" => 'my_cloud_id' })

      stub_http_request(:get, //).to_return(:body => "blahblah")

      lambda {
        @connection.get("/fake")
      }.should raise_error(TelestreamCloud::ServiceNotAvailable)
    end
  end

end
