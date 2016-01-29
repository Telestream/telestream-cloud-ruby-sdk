require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe TelestreamCloud::Factory do

  describe "region" do
    it "should tell the region" do
      TelestreamCloud.configure do
        access_key "my_access_key"
        secret_key "my_secret_key"
        api_host "api.pandastream.com"
        factory_id 'my_cloud_id'
        api_port 85
      end

      TelestreamCloud.factory.region.should == "us"
      TelestreamCloud.factory.us?.should == true
    end

    it "should tell the region" do
      TelestreamCloud.configure do
        access_key "my_access_key"
        secret_key "my_secret_key"
        api_host "api-eu.pandastream.com"
        factory_id 'my_cloud_id'
        api_port 85
      end

      TelestreamCloud.factory.region.should == "eu"
      TelestreamCloud.factory.eu?.should == true
    end

  end




  describe "Using configure bloc" do
    before(:each) do
      TelestreamCloud.configure do
        access_key "my_access_key"
        secret_key "my_secret_key"
        api_host "api.example.com"
        factory_id 'my_cloud_id'
        api_port 85
      end
    end

    describe "using a cloud" do
      before(:each) do
         cloud_json = "{\"s3_videos_bucket\":\"my_bucket1\",\"id\":\"cloud1\"}"
          stub_http_request(:get, /api.example.com:85\/v3.0\/factories\/cloud1.json/).
            to_return(:body => cloud_json)
          @factory = TelestreamCloud::Factory.find "cloud1"
      end

      it "should find all videos" do
        videos_json = "[{\"source_url\":\"my_source_url\",\"id\":\"123\"}]"
        stub_http_request(:get, /api.example.com:85\/v3.0\/videos.json/).
            with{|r| r.uri.query =~ /factory_id=cloud1/}.
              to_return(:body => videos_json)

        @factory.videos.first.id.should == "123"
      end

      it "should find all videos with params" do
        videos_json = "[{\"source_url\":\"my_source_url\",\"id\":\"134\"}]"
        stub_http_request(:get, /api.example.com:85\/v3.0\/videos.json/).
          with{|r| r.uri.query =~ /status=success/ && r.uri.query =~ /factory_id=cloud1/}.
            to_return(:body => videos_json)
        videos = @factory.videos.all(:status => "success")
        videos.first.id.should == "134"
      end

      it "should find a video by id" do
        video_json = "{\"source_url\":\"my_source_url\",\"id\":\"123\"}"
        stub_http_request(:get, /api.example.com:85\/v3.0\/videos\/123.json/).
          with{|r| r.uri.query =~ /factory_id=cloud1/}.
          to_return(:body => video_json)

        video = @factory.videos.find "123"
        video.id.should == "123"
      end

      it "should create a video using cloud" do
        videos_json = "{\"source_url\":\"my_source_url\",\"id\":\"123\"}"
        stub_http_request(:post, /api.example.com:85\/v3.0\/videos.json/).
          with{|r| r.body =~ /factory_id=cloud1/}.
          to_return(:body => videos_json)
        @factory.videos.create(:source_url => "my_source_url")
      end

      it "should find return all cloud" do
        clouds_json = "[{\"s3_videos_bucket\":\"my_bucket1\",\"id\":\"cloud1\"},{\"s3_videos_bucket\":\"my_bucket2\",\"id\":\"cloud2\"}]"

        stub_http_request(:get, /api.example.com:85\/v3.0\/factories.json/).to_return(:body => clouds_json)

        factory = TelestreamCloud::Factory.all
        factory.first.id.should == 'cloud1'
        factory.first.s3_videos_bucket.should == "my_bucket1"
        factory.size.should == 2
      end
    end


    it "should create a cloud" do
      cloud_json = "{\"s3_videos_bucket\":\"videobucket\",\"id\":\"my_cloud_id\"}"
      stub_http_request(:post, /http:\/\/api.example.com:85\/v3.0\/factories.json/).
        with{|r| r.body =~ /s3_videos_bucket=videobucket/ &&  r.body =~ /user_aws_key=myaccesskey/ &&  r.body =~ /user_aws_secret=mysecretkey/ }.
        to_return(:body => cloud_json)

      @cloud = TelestreamCloud::Factory.create(:s3_videos_bucket => 'videobucket', :user_aws_key => 'myaccesskey', :user_aws_secret => 'mysecretkey')
      @cloud.s3_videos_bucket.should == "videobucket"
    end


    it "should create a cloud and reload" do
      cloud_json = "{\"s3_videos_bucket\":\"videobucket\",\"id\":\"my_new_cloud_id\"}"
      stub_http_request(:post, /http:\/\/api.example.com:85\/v3.0\/factories.json/).
        to_return(:body => cloud_json)

      stub_http_request(:get, /api.example.com:85\/v3.0\/factories\/my_new_cloud_id.json/).
        to_return(:body => cloud_json)

      @cloud = TelestreamCloud::Factory.create(:s3_videos_bucket => 'videobucket', :user_aws_key => 'myaccesskey', :user_aws_secret => 'mysecretkey')
      @cloud.reload.should == @cloud
    end

  end



end
