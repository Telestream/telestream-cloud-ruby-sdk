require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe TelestreamCloud::Profile do
  before(:each) do
    cloud_json = "{\"s3_videos_bucket\":\"my_bucket\",\"id\":\"my_cloud_id\"}"
    stub_http_request(:get, /api.example.com:85\/v3.0\/factories\/my_cloud_id.json/).
      to_return(:body => cloud_json)

    TelestreamCloud.configure do
      access_key "my_access_key"
      secret_key "my_secret_key"
      api_host "api.example.com"
      factory_id 'my_cloud_id'
      api_port 85
    end

  end

  it "should create a profile" do
    profile_json = "{\"title\":\"my_profile\",\"id\":\"123\"}"
    stub_http_request(:post, /api.example.com:85\/v3.0\/profiles.json/).
      with(:body => /title=my_profile/).
        to_return(:body => profile_json)

    profile = TelestreamCloud::Profile.new(:title => "my_profile")

    profile.new?.should == true
    profile.changed?.should == true
    profile.save.should == true
    profile.changed?.should == false
    profile.id.should == "123"
    profile.new?.should == false

    profile.changed?.should == false

    profile.title = "new_last_title"
    profile.changed?.should == true
  end


  it "should update a profile and sending the changed attributes" do
    profile_json = "{\"title\":\"my_profile\",\"id\":\"123\"}"
    stub_http_request(:put, /api.example.com:85\/v3.0\/profiles\/999.json/).
      with{|r| !(r.body =~ /title=my_new_profile_title/) && r.body =~ /width=80/}.
        to_return(:body => profile_json)

    profile = TelestreamCloud::Profile.new(:id => "999", :title => "my_profile_title")

    profile.width=80
    profile.new?.should == false
    profile.save.should == true
  end


  it "should not call update a profile" do
    profile_json = "{\"title\":\"my_profile\",\"id\":\"123\"}"
    stub_http_request(:put, /api.example.com:85\/v3.0\/profiles\/123.json/).
      with(:body => /title=my_profile/).
        to_return(:body => profile_json)

    profile = TelestreamCloud::Profile.new(:id => "123")
    profile.title = "my_profile"

    profile.new?.should == false
    profile.save.should == true
  end


  it "should have a many relation on encodings" do
    encoding_json = "[{\"abc\":\"efg\",\"id\":456}]"
    profile_json = "{\"title\":\"my_profile\",\"id\":\"901\"}"
    stub_http_request(:get, /api.example.com:85\/v3.0\/profiles\/901\/encodings.json/).
      to_return(:body => encoding_json)

    profile = TelestreamCloud::Profile.new(:title => "my_source_url", :id => "901")
    profile.encodings.first.id.should ==  456
  end

  it "should reload the object" do
    profile_json = "{\"title\":\"my_profile\",\"id\":\"123\"}"
    stub_http_request(:get, /api.example.com:85\/v3.0\/profiles\/123.json/).
        to_return(:body => profile_json)

    profile = TelestreamCloud::Profile.new(:id => "123", :title => "my_new_profile_title")
    profile.title.should == "my_new_profile_title"
    profile.reload
    profile.id.should == "123"
    profile.title.should == "my_profile"
  end

  it "shoud raise an exeception if it's a new object" do
    profile = TelestreamCloud::Profile.new(:title => "my_new_profile_title")
    lambda {
      profile.reload
    }.should raise_error("RecordNotFound")
  end

  it "shoud raise an exeception if it's a new object" do
    profile_json = "{\"title\":\"my_profile\",\"id\":\"123\"}"
    stub_http_request(:get, /api.example.com:85\/v3.0\/profiles\/123.json/).
        to_return(:body => profile_json)

    profile = TelestreamCloud::Profile.find(123)
    profile.reload.should == profile
  end

  it "should not delegate scope if the method do not really exist in the scope" do
    lambda {TelestreamCloud::Profile.reload}.should raise_error(NoMethodError)
    lambda {TelestreamCloud::Profile.each}.should raise_error(NoMethodError)
    lambda {TelestreamCloud::Profile.size}.should raise_error(NoMethodError)
  end

  it "should tell if profile is using a preset" do
    TelestreamCloud::Profile.new(:title => "abc").preset?.should be_truthy
    TelestreamCloud::Profile.new(:preset_name => "abc").preset?.should be_falsey
  end
end
