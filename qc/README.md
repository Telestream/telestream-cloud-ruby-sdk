# Telestream Cloud Quality Control Ruby SDK

This library provides a low-level interface to the REST API of Telestream Cloud, the online video encoding service.

## Getting Started
Configure client, replace `[YOUR API KEY]` with proper `ApiKey`

```ruby
require 'telestream_cloud_qc'

TelestreamCloud::Qc.configure do |config|
  config.api_key['X-Api-Key'] = '[YOUR API KEY]'
end

api = TelestreamCloud::Qc::QcApi.new
```
Create a new project
```ruby

project =  api.create_project({data: {name: "MyProject", template: "amazon"}})
```

Upload file from local store, replace project id `[PROJECT ID]`

```ruby
upload = TelestreamCloud::Qc::Uploader.new(api, {
   file: '/tmp/video.mp4',
   project_id: '[PROJECT ID]',
})

puts upload.upload
```

Get status of job
```ruby
project_id = '[PROJECT ID]'
job_id = '[JOB ID]'

api.get_job(project_id, job_id)
```

Start a new job using URL to file
```ruby
api.create_job(project_id, {url: 'http://example.com/video.mp4'})
```

## Documentation for API Endpoints

All URIs are relative to *https://api.cloud.telestream.net/qc/v1.0*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*TelestreamCloud::Qc::QcApi* | [**cancel_job**](docs/QcApi.md#cancel_job) | **PUT** /projects/{project_id}/jobs/{job_id}/cancel.json | 
*TelestreamCloud::Qc::QcApi* | [**create_job**](docs/QcApi.md#create_job) | **POST** /projects/{project_id}/jobs.json | Create a new job
*TelestreamCloud::Qc::QcApi* | [**create_project**](docs/QcApi.md#create_project) | **POST** /projects.json | Create a new project
*TelestreamCloud::Qc::QcApi* | [**get_job**](docs/QcApi.md#get_job) | **GET** /projects/{project_id}/jobs/{job_id}.json | Get QC job
*TelestreamCloud::Qc::QcApi* | [**get_project**](docs/QcApi.md#get_project) | **GET** /projects/{project_id}.json | Get project by Id
*TelestreamCloud::Qc::QcApi* | [**import_template**](docs/QcApi.md#import_template) | **POST** /projects/import.json | Import Vidchecker template
*TelestreamCloud::Qc::QcApi* | [**list_jobs**](docs/QcApi.md#list_jobs) | **GET** /projects/{project_id}/jobs.json | Get jobs form projects
*TelestreamCloud::Qc::QcApi* | [**list_projects**](docs/QcApi.md#list_projects) | **GET** /projects.json | List all projects for an account
*TelestreamCloud::Qc::QcApi* | [**modify_project**](docs/QcApi.md#modify_project) | **PUT** /projects/{project_id}.json | Modify project
*TelestreamCloud::Qc::QcApi* | [**proxy**](docs/QcApi.md#proxy) | **GET** /projects/{project_id}/jobs/{job_id}/proxy.json | 
*TelestreamCloud::Qc::QcApi* | [**remove_job**](docs/QcApi.md#remove_job) | **DELETE** /projects/{project_id}/jobs/{job_id}.json | 
*TelestreamCloud::Qc::QcApi* | [**remove_project**](docs/QcApi.md#remove_project) | **DELETE** /projects/{project_id}.json | 
*TelestreamCloud::Qc::QcApi* | [**signed_urls**](docs/QcApi.md#signed_urls) | **GET** /projects/{project_id}/jobs/{job_id}/signed-urls.json | 
*TelestreamCloud::Qc::QcApi* | [**templates**](docs/QcApi.md#templates) | **GET** /templates.json | List all templates
*TelestreamCloud::Qc::QcApi* | [**upload_video**](docs/QcApi.md#upload_video) | **POST** /projects/{project_id}/upload.json | Creates an upload session


## Documentation for Models

 - [TelestreamCloud::Qc::Alert](docs/Alert.md)
 - [TelestreamCloud::Qc::AudioStream](docs/AudioStream.md)
 - [TelestreamCloud::Qc::Container](docs/Container.md)
 - [TelestreamCloud::Qc::Data](docs/Data.md)
 - [TelestreamCloud::Qc::Data1](docs/Data1.md)
 - [TelestreamCloud::Qc::ExtraFile](docs/ExtraFile.md)
 - [TelestreamCloud::Qc::InlineResponse200](docs/InlineResponse200.md)
 - [TelestreamCloud::Qc::InlineResponse422](docs/InlineResponse422.md)
 - [TelestreamCloud::Qc::Job](docs/Job.md)
 - [TelestreamCloud::Qc::JobData](docs/JobData.md)
 - [TelestreamCloud::Qc::JobDetails](docs/JobDetails.md)
 - [TelestreamCloud::Qc::JobDetailsResult](docs/JobDetailsResult.md)
 - [TelestreamCloud::Qc::JobsCollection](docs/JobsCollection.md)
 - [TelestreamCloud::Qc::Media](docs/Media.md)
 - [TelestreamCloud::Qc::Options](docs/Options.md)
 - [TelestreamCloud::Qc::Project](docs/Project.md)
 - [TelestreamCloud::Qc::Proxy](docs/Proxy.md)
 - [TelestreamCloud::Qc::Summary](docs/Summary.md)
 - [TelestreamCloud::Qc::SynchronizationEvent](docs/SynchronizationEvent.md)
 - [TelestreamCloud::Qc::Template](docs/Template.md)
 - [TelestreamCloud::Qc::UploadSession](docs/UploadSession.md)
 - [TelestreamCloud::Qc::VideoStream](docs/VideoStream.md)
 - [TelestreamCloud::Qc::VideoUploadBody](docs/VideoUploadBody.md)


## Documentation for Authorization


### api_key

- **Type**: API key
- **API key parameter name**: X-Api-Key
- **Location**: HTTP header

