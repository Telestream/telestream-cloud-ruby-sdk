# Telestream Cloud API client

## Getting Started
### Obtain address for TCS api
In order to use TCS api client first you need to get `ApiKey`. Login to [website](https://cloud.telestream.net/console), go to *Flip* service and open *API Access* tab.
You account will be identified by unique *Api Key*, if it is unavailable click *Reset* button.

### Usage
This example show uploading media file to flip service. If you want to use other service refer to [services](#services).

    require 'telestream_cloud_flip'

    TelestreamCloud::Flip.configure do |config|
        config.api_key['X-Api-Key'] = 'tcs_xxx'
    end

    client = TelestreamCloud::Flip::FlipApi.new

    options = {
        file: '/video/mp4',
        factory_id: 'tg01xxx',
    }

    upload = TelestreamCloud::Flip::Uploader.new(client, options)

    video = upload.upload

## Services
Api client is divided into parts corresponding to services provided. Currently supported services include:
- [Flip](flip/README.md) - high-volume media transcoding to multiple formats
- [Timed Text Speech](tts/README.md) - automated captions and subtitles creation
- [Quality Control](qc/README.md) - automated quality control for file base media
