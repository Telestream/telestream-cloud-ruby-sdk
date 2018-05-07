# Telestream Cloud Timed Text Speech Ruby SDK

This library provides a low-level interface to the REST API of Telestream Cloud, the online video encoding service.

## Getting Started
### Initialize client

```ruby
require 'telestream_cloud/tts'

TelestreamCloud::Tts.configure do |config|
  config.api_key['X-Api-Key'] = '[API KEY]'
end

client = TelestreamCloud::Tts::TtsApi.new
```

### Create a project
```ruby
client.create_project(name: 'Example project name', language: 'en-US')
```

### Create job from local file

```ruby
project_id = '...'
uploader = TelestreamCloud::Flip::Uploader.new(
  client,
  project_id: project_id,
  file: '/path/to/file.mp4',
)

job_id = uploader.upload
```

### Create job from source URL
```ruby
project_id = '...'
client.create_job(project_id, source_url: 'http://url/to/file.mp4')
```

## Documentation for API Endpoints

All URIs are relative to *https://api.cloud.telestream.net/tts/v1.0*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*TelestreamCloud::Tts::TtsApi* | [**corpora**](docs/TtsApi.md#corpora) | **GET** /projects/{projectID}/corpora | Returns a collection of Corpora
*TelestreamCloud::Tts::TtsApi* | [**corpus**](docs/TtsApi.md#corpus) | **GET** /projects/{projectID}/corpora/{name} | Returns the Corpus
*TelestreamCloud::Tts::TtsApi* | [**create_corpus**](docs/TtsApi.md#create_corpus) | **POST** /projects/{projectID}/corpora/{name} | Creates a new Corpus
*TelestreamCloud::Tts::TtsApi* | [**create_job**](docs/TtsApi.md#create_job) | **POST** /projects/{projectID}/jobs | Creates a new Job
*TelestreamCloud::Tts::TtsApi* | [**create_project**](docs/TtsApi.md#create_project) | **POST** /projects | Creates a new Project
*TelestreamCloud::Tts::TtsApi* | [**delete_corpus**](docs/TtsApi.md#delete_corpus) | **DELETE** /projects/{projectID}/corpora/{name} | Creates a new Corpus
*TelestreamCloud::Tts::TtsApi* | [**delete_job**](docs/TtsApi.md#delete_job) | **DELETE** /projects/{projectID}/jobs/{jobID} | Deletes the Job
*TelestreamCloud::Tts::TtsApi* | [**delete_project**](docs/TtsApi.md#delete_project) | **DELETE** /projects/{projectID} | Deletes the Project
*TelestreamCloud::Tts::TtsApi* | [**job**](docs/TtsApi.md#job) | **GET** /projects/{projectID}/jobs/{jobID} | Returns the Job
*TelestreamCloud::Tts::TtsApi* | [**job_result**](docs/TtsApi.md#job_result) | **GET** /projects/{projectID}/jobs/{jobID}/result | Returns the Job Result
*TelestreamCloud::Tts::TtsApi* | [**jobs**](docs/TtsApi.md#jobs) | **GET** /projects/{projectID}/jobs | Returns a collection of Jobs
*TelestreamCloud::Tts::TtsApi* | [**project**](docs/TtsApi.md#project) | **GET** /projects/{projectID} | Returns the Project
*TelestreamCloud::Tts::TtsApi* | [**projects**](docs/TtsApi.md#projects) | **GET** /projects | Returns a collection of Projects
*TelestreamCloud::Tts::TtsApi* | [**train_project**](docs/TtsApi.md#train_project) | **POST** /projects/{projectID}/train | Queues training
*TelestreamCloud::Tts::TtsApi* | [**update_project**](docs/TtsApi.md#update_project) | **PUT** /projects/{projectID} | Updates an existing Project
*TelestreamCloud::Tts::TtsApi* | [**upload_video**](docs/TtsApi.md#upload_video) | **POST** /projects/{projectID}/jobs/upload | Creates an upload session


## Documentation for Models

 - [TelestreamCloud::Tts::CorporaCollection](docs/CorporaCollection.md)
 - [TelestreamCloud::Tts::Corpus](docs/Corpus.md)
 - [TelestreamCloud::Tts::ErrorResponse](docs/ErrorResponse.md)
 - [TelestreamCloud::Tts::ExtraFile](docs/ExtraFile.md)
 - [TelestreamCloud::Tts::Fragment](docs/Fragment.md)
 - [TelestreamCloud::Tts::FragmentVariant](docs/FragmentVariant.md)
 - [TelestreamCloud::Tts::Job](docs/Job.md)
 - [TelestreamCloud::Tts::JobResult](docs/JobResult.md)
 - [TelestreamCloud::Tts::JobsCollection](docs/JobsCollection.md)
 - [TelestreamCloud::Tts::Project](docs/Project.md)
 - [TelestreamCloud::Tts::ProjectsCollection](docs/ProjectsCollection.md)
 - [TelestreamCloud::Tts::Result](docs/Result.md)
 - [TelestreamCloud::Tts::UploadSession](docs/UploadSession.md)
 - [TelestreamCloud::Tts::VideoUploadBody](docs/VideoUploadBody.md)


## Documentation for Authorization


### api_key

- **Type**: API key
- **API key parameter name**: X-Api-Key
- **Location**: HTTP header

