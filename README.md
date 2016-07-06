# TelestreamCloud

TelestreamCloud gem provides an interface to access the [TelestreamCloud](http://cloud.telestream.net) API from Ruby.


## Installation

    gem install telestream_cloud

## How to use it

    require 'rubygems'
    require 'telestream_cloud'

## Faraday Adapter
    The gem automatically detects http libraries and sets the default adapter
    You can just set the default Panda adapter if you are not happy with the current one.

    TelestreamCloud.default_adapter = :excon

    For rails 4, try the net_http adapter. This fixes disable_ssl_peer_verification related errors caused by the default adapter.

    TelestreamCloud.default_adapter = :net_http

### Creating an instance of the client
```ruby
TelestreamCloud.configure do
  access_key "your_access_key"
  secret_key "your_secret_key"
  # api_host "api.cloud.telestream.net" # this will be set by default
end
```
or
```ruby
TelestreamCloud.configure({:access_key => ....})
```

If your account uses a different region, set your `api_host` accordingly:

| Region  | api_host |
|---|---|
| gce-us | api.cloud.pandastream.net |
| us |  api-us-east.cloud.telestream.net|
| eu | api-eu-west.cloud.telestream.net |

### Inside a Rails app with a main account or using Heroku Addon

Heroku will store your credentials as an environment variable called PANDASTREAM_URL. You can find more information on [Heroku config variable docs](http://docs.heroku.com/config-vars)

If you use a config file like `config/panda.yml` to support multiple environments, do the following in your `config/initializers/panda.rb` :

    TelestreamCloud.configure((ENV['PANDASTREAM_URL'] || YAML::load_file(File.join(File.dirname(__FILE__),"..", "panda.yml"))[Rails.env]))

See the [Rails How-to](https://cloud.telestream.net/docs#rails) for more details.

### Creating an instance using ONLY with Heroku Addon

If you don't use a config file and want to simply be setup, do the following (works only on heroku):

    TelestreamCloud.configure_heroku

### Typical usage
After initializing your client, you can now select resouce that you want to use. Currently supported resources are:
* `:flip`
* additional resources will be available soon, stay tuned ;)

```ruby
flip = TelestreamCloud.resources :flip
```

### Factories

```ruby
# Accessing Factories
factories = flip.factories.all

factories.each do |f|
  puts "Id: #{f.id}, name: #{f.name}"
end

# Accessing specific Factory
f1 = flip.factories.all[0]
# or
f2 = flip.factories.find('factory_id')
```

### Videos

```ruby
# Retrieving videos
videos = factory.videos.all
videos.first.id
=> "abcde"

videos = factory.videos.all(:page => 2, :per_page => 20)
# or
videos = factory.videos.page(1).per_page(20)
videos.size
=> 20

# Note: maximum :per_page is 100. That's also the default value

# Get attributes
video.attributes
=> {
  "id"=>"1234",
  "original_filename"=>"panda.mp4",
  "source_url"=>"http://www.example.com/original_video.mp4",
  "extname"=>".mp4",
  "duration"=>14010,
  "audio_codec"=>"aac",
  "video_codec"=>"h264",
  "file_size" => "44000",
  "width"=>300,
  "height"=>240,
  "fps"=>29,
  "status"=>"success",
  "created_at"=>"2010/01/13 16:45:29 +0000",
  "updated_at"=>"2010/01/13 16:45:35 +0000"
}

# Creating videos from source_url
video = factory.videos.create(:source_url => "http://mywebsite.com/myvideo.mp4")

# Creating videos from local file
video = factory.videos.create(:file => File.new("/path/to/my/movie.mp4"))

# Encode video with selected profiles only
video = factory.videos.create(:file => File.new("/path/to/my/movie.mp4"),
                              :profiles => "h264,webm")

# Deleting videos
video = factory.videos.find('video-id')
video.delete
=> true
```

### Parallel and fail-safe upload

```ruby
# Create video unsing parallel uploader

video = TelestreamCloud::ParallelUploader.upload(
          file: File.new('movie.mp4'),
          concurrency: 8,
          profiles: 'webm'
        )

# Create video standard parallel uploader
video = TelestreamCloud::Uploader.upload(
          file: File.new("/path/to/my/movie.mp4"),
          profiles: "h264,webm",
          retries: 3
        )

# You can also upload video manually
uploader = TelestreamCloud::Uploader.new(
             file: File.new("/path/to/my/movie.mp4"),
             profiles: "h264,webm",
           )

uploader.upload(3)
uploader.status # => :success
video = uploader.video
```

### Encodings

```ruby
# Find one encoding
encoding = factory.encodings.find('encoding-id')

# Find all encodings for one video
video = factory.videos.find('video-id')
encodings = video.encodings.all

# Find all encodings in one Factory
encodings = factory.encodings.all

# Using page/per_page
encodings = factory.encodings.page(1).per_page(5)

# Get only successful encodings
encodings = factory.encodings.all(:status => "success")

# Access encoding attributes
encoding.attributes
=> { ... }

encoding.encoding_progress
=> 60

encoding.success?
=> true

encoding.processing?
=> false

encoding.fail?
=> false

# Get screenshot url
encoding.screenshots[0]
=> http://s3.amazonaws.com/bucket/abcde.jpg

# Create new encoding for a video that already exists
encoding = factory.encodings.create(:video_id => 1234, :profile_id => 6789)
# or
video.encodings.create(:profile_id => 6789)

# Delete encoding
encoding = factory.encodings.find('encoding-id')
encoding.delete
=> true
```
### Profiles

```ruby
# Find a profile
profile = factory.profiles.find("profile-id")

# Get all profiles
profiles = factory.profiles.all

# Create new profile
profile = factory.profiles.create(:preset_name => "h264")
profile = factory.profiles.create(:command => "ffmpeg -i $input_file$ -y $output_file$", ....)

# Update a profile
profile = factory.profiles.find("profile-id")
profile.width = 800
profile.height = 600
profile.save
=> true

# Delete a profile
profile = factory.profiles.find("profile-id")
profile.delete
=> true
```

## Binding the client to one Factory only

You can also initialize the client with a specific factory_id. This way you can work with Videos, Encodings and Profiles directly (within the Factory you selected)

```ruby
TelestreamCloud.configure do
  access_key "your_access_key"
  secret_key "your_secret_key"
  factory_id "factory_id"
end

# Get all videos in your factory
videos = TelestreamCloud::Video.all

# Find Video by id
factory = TelestreamCloud::Video.find('video-id')

# Create new Video
video = TelestreamCloud::Video.create(:source_url => "http://mywebsite.com/myvideo.mp4")

# Create new encoding
encoding = TelestreamCloud::Encoding.create(:video_id => 1234, :profile_id => 6789)

# Delete Profile (the same can be done for Videos and Encodings)
TelestreamCloud::Profile.delete('profile-id')

```


## Generating signatures

  All requests to TelestreamCloud are signed using HMAC-SHA256, based on a timestamp and your secret key. This is handled transparently. However, sometimes you will want to generate only this signature, in order to make a request by means other than this library. This is the case when using the [JavaScript panda_uploader](http://github.com/pandastream/panda_uploader).

  To do this, a method `signed_params()` is supported:
```ruby
TelestreamCloud.signed_params('POST', '/videos.json')
# => {'access_key' => '8df50af4-074f-11df-b278-1231350015b1',
# 'factory_id' => 'your-factory-id',
# 'signature' => 'yRUZhcsYgnG+8jV5yrnWjLoRwzeJShdcdUoejjaRp6I=',
# 'timestamp' => '2016-01-28T11:42:46.262935Z'}

TelestreamCloud.signed_params('GET', '/videos.json', {'some_params' => 'some_value'})
# => {'access_key' => '8df50af4-074f-11df-b278-1231350015b1',
#  'factory_id' => 'your-factory-id',
#  'signature' => '7glFUWlcSgvBm5BmOLghRNeqLNbof20jYCRgk9cJOi8=',
#  'some_param' => 'some_value',
#  'timestamp' => '2016-01-28T11:43:20.066141Z'}
```
## Low level API calls

You can also make direct calls to TelestreamCloud REST API.

For calls to endpoints other than `/factories.json`, you need to provide `factory_id` when initializing the client.



```ruby
# Posting a video
TelestreamCloud.post('/videos.json', {:file => File.new("/path/to/your/movie.mp4")})

TelestreamCloud.post('/videos.json', {:source_url => 'http://www.example.com/original_video.mp4'})
=>{"duration"=>nil,
 "created_at"=>"2010/01/15 14:48:42 +0000",
 "original_filename"=>"panda.mp4",
 "updated_at"=>"2010/01/15 14:48:42 +0000",
 "source_url"=>"http://www.example.com/original_video.mp4",
 "id"=>"12fce296-01e5-11df-ae37-12313902cc92",
 "extname"=>".mp4",
 "audio_codec"=>nil,
 "height"=>nil,
 "upload_redirect_url"=>nil,
 "fps"=>nil,
 "video_codec"=>nil,
 "status"=>"processing",
 "width"=>nil}

# Getting all videos
TelestreamCloud.get('/videos.json')
=> [{"duration"=>14010,
  "created_at"=>"2010/01/13 16:45:29 +0000",
  "original_filename"=>"panda.mp4",
  "updated_at"=>"2010/01/13 16:45:35 +0000",
  "source_url"=>"http://www.example.com/original_video.mp4",
  "id"=>"0ee6b656-0063-11df-a433-1231390041c1",
  "extname"=>".mp4",
  "audio_codec"=>"aac",
  "height"=>240,
  "upload_redirect_url"=>nil,
  "fps"=>29,
  "video_codec"=>"h264",
  "status"=>"success",
  "width"=>300}]

# Getting video encodings
TelestreamCloud.get('/videos/0ee6b656-0063-11df-a433-1231390041c1/encodings.json')
=> [{"encoder_id"=>nil,
  "created_at"=>"2010/01/13 16:45:30 +0000",
  "video_id"=>"0ee6b656-0063-11df-a433-1231390041c1",
  "video_url"=>
      "http://s3.amazonaws.com/panda-videos/0f815986-0063-11df-a433-1231390041c1.flv",
  "started_encoding_at"=>"2010/01/13 16:47:35 +0000",
  "updated_at"=>"2010/01/13 16:47:40 +0000",
  "extname"=>".flv",
  "encoding_progress"=>87,
  "encoding_time"=>3,
  "id"=>"0f815986-0063-11df-a433-1231390041c1",
  "height"=>240,
  "status"=>"success",
  "profile_id"=>"00182830-0063-11df-8c8a-1231390041c1",
  "width"=>300}]

# Deleting an encoding
TelestreamCloud.delete('/encodings/0f815986-0063-11df-a433-1231390041c1.json')

# Deleting a video
TelestreamCloud.delete('/videos/0ee6b656-0063-11df-a433-1231390041c1.json')
```
## Use bundler to setup the test environment
```ruby
bundler install
rake spec
```


Copyright (c) 2016 Telestream Cloud. See LICENSE for details.
