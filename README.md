# Telestream Cloud API client

## Getting Started
### Obtain address for TCS api
In order to use TCS api client first you need to get `ApiKey`. Login to [website](https://cloud.telestream.net/console), go to *Flip* service and open *API Access* tab.
You account will be identified by unique *Api Key*, if it is unavailable click *Reset* button.

### Install

Add the following line to Gemfile:

```
gem 'telestream_cloud'
```

and run bundle install from your shell.

To install the gem manually from your shell, run:

```
gem install telestream_cloud
```

## Services
Api client is divided into parts corresponding to services provided. Currently supported services include:
- [Flip](flip/README.md) - high-volume media transcoding to multiple formats
- [Timed Text Speech](tts/README.md) - automated captions and subtitles creation
- [Quality Control](qc/README.md) - automated quality control for file base media
