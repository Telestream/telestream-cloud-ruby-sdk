# TelestreamCloud::Tts::TtsApi

All URIs are relative to *https://api.cloud.telestream.net/tts/v1.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**corpora**](TtsApi.md#corpora) | **GET** /projects/{projectID}/corpora | Returns a collection of Corpora
[**corpus**](TtsApi.md#corpus) | **GET** /projects/{projectID}/corpora/{name} | Returns the Corpus
[**create_corpus**](TtsApi.md#create_corpus) | **POST** /projects/{projectID}/corpora/{name} | Creates a new Corpus
[**create_job**](TtsApi.md#create_job) | **POST** /projects/{projectID}/jobs | Creates a new Job
[**create_project**](TtsApi.md#create_project) | **POST** /projects | Creates a new Project
[**delete_corpus**](TtsApi.md#delete_corpus) | **DELETE** /projects/{projectID}/corpora/{name} | Creates a new Corpus
[**delete_job**](TtsApi.md#delete_job) | **DELETE** /projects/{projectID}/jobs/{jobID} | Deletes the Job
[**delete_project**](TtsApi.md#delete_project) | **DELETE** /projects/{projectID} | Deletes the Project
[**job**](TtsApi.md#job) | **GET** /projects/{projectID}/jobs/{jobID} | Returns the Job
[**job_result**](TtsApi.md#job_result) | **GET** /projects/{projectID}/jobs/{jobID}/result | Returns the Job Result
[**jobs**](TtsApi.md#jobs) | **GET** /projects/{projectID}/jobs | Returns a collection of Jobs
[**project**](TtsApi.md#project) | **GET** /projects/{projectID} | Returns the Project
[**projects**](TtsApi.md#projects) | **GET** /projects | Returns a collection of Projects
[**train_project**](TtsApi.md#train_project) | **POST** /projects/{projectID}/train | Queues training
[**update_project**](TtsApi.md#update_project) | **PUT** /projects/{projectID} | Updates an existing Project
[**upload_video**](TtsApi.md#upload_video) | **POST** /projects/{projectID}/jobs/upload | Creates an upload session


# **corpora**
> CorporaCollection corpora(project_id)

Returns a collection of Corpora

Returns a collection of Corpora

### Example
```ruby
# load the gem
require 'telestream_cloud_tts'
# setup authorization
TelestreamCloud::Tts.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Tts::TtsApi.new

project_id = "project_id_example" # String | ID of the Project


begin
  #Returns a collection of Corpora
  result = api_instance.corpora(project_id)
  p result
rescue TelestreamCloud::Tts::ApiError => e
  puts "Exception when calling TtsApi->corpora: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| ID of the Project | 

### Return type

[**CorporaCollection**](CorporaCollection.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **corpus**
> Corpus corpus(project_id, name)

Returns the Corpus

Returns the Corpus

### Example
```ruby
# load the gem
require 'telestream_cloud_tts'
# setup authorization
TelestreamCloud::Tts.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Tts::TtsApi.new

project_id = "project_id_example" # String | ID of the Project

name = "name_example" # String | Corpus name


begin
  #Returns the Corpus
  result = api_instance.corpus(project_id, name)
  p result
rescue TelestreamCloud::Tts::ApiError => e
  puts "Exception when calling TtsApi->corpus: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| ID of the Project | 
 **name** | **String**| Corpus name | 

### Return type

[**Corpus**](Corpus.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_corpus**
> create_corpus(project_id, name, body)

Creates a new Corpus

Creates a new Corpus

### Example
```ruby
# load the gem
require 'telestream_cloud_tts'
# setup authorization
TelestreamCloud::Tts.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Tts::TtsApi.new

project_id = "project_id_example" # String | ID of the Project

name = "name_example" # String | Corpus name

body = "body_example" # String | 


begin
  #Creates a new Corpus
  api_instance.create_corpus(project_id, name, body)
rescue TelestreamCloud::Tts::ApiError => e
  puts "Exception when calling TtsApi->create_corpus: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| ID of the Project | 
 **name** | **String**| Corpus name | 
 **body** | **String**|  | 

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: text/plain
 - **Accept**: application/json



# **create_job**
> Job create_job(project_id, job)

Creates a new Job

Creates a new Job

### Example
```ruby
# load the gem
require 'telestream_cloud_tts'
# setup authorization
TelestreamCloud::Tts.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Tts::TtsApi.new

project_id = "project_id_example" # String | ID of the Project

job = TelestreamCloud::Tts::Job.new # Job | 


begin
  #Creates a new Job
  result = api_instance.create_job(project_id, job)
  p result
rescue TelestreamCloud::Tts::ApiError => e
  puts "Exception when calling TtsApi->create_job: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| ID of the Project | 
 **job** | [**Job**](Job.md)|  | 

### Return type

[**Job**](Job.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_project**
> Project create_project(project)

Creates a new Project

Creates a new Project

### Example
```ruby
# load the gem
require 'telestream_cloud_tts'
# setup authorization
TelestreamCloud::Tts.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Tts::TtsApi.new

project = TelestreamCloud::Tts::Project.new # Project | 


begin
  #Creates a new Project
  result = api_instance.create_project(project)
  p result
rescue TelestreamCloud::Tts::ApiError => e
  puts "Exception when calling TtsApi->create_project: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project** | [**Project**](Project.md)|  | 

### Return type

[**Project**](Project.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_corpus**
> delete_corpus(project_id, name)

Creates a new Corpus

Creates a new Corpus

### Example
```ruby
# load the gem
require 'telestream_cloud_tts'
# setup authorization
TelestreamCloud::Tts.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Tts::TtsApi.new

project_id = "project_id_example" # String | ID of the Project

name = "name_example" # String | Corpus name


begin
  #Creates a new Corpus
  api_instance.delete_corpus(project_id, name)
rescue TelestreamCloud::Tts::ApiError => e
  puts "Exception when calling TtsApi->delete_corpus: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| ID of the Project | 
 **name** | **String**| Corpus name | 

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_job**
> delete_job(project_id, job_id)

Deletes the Job

Deletes the Job

### Example
```ruby
# load the gem
require 'telestream_cloud_tts'
# setup authorization
TelestreamCloud::Tts.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Tts::TtsApi.new

project_id = "project_id_example" # String | ID of the Project

job_id = "job_id_example" # String | 


begin
  #Deletes the Job
  api_instance.delete_job(project_id, job_id)
rescue TelestreamCloud::Tts::ApiError => e
  puts "Exception when calling TtsApi->delete_job: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| ID of the Project | 
 **job_id** | **String**|  | 

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_project**
> delete_project

Deletes the Project

Deletes the Project

### Example
```ruby
# load the gem
require 'telestream_cloud_tts'
# setup authorization
TelestreamCloud::Tts.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Tts::TtsApi.new

begin
  #Deletes the Project
  api_instance.delete_project
rescue TelestreamCloud::Tts::ApiError => e
  puts "Exception when calling TtsApi->delete_project: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **job**
> Job job(project_id, job_id)

Returns the Job

Returns the Job

### Example
```ruby
# load the gem
require 'telestream_cloud_tts'
# setup authorization
TelestreamCloud::Tts.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Tts::TtsApi.new

project_id = "project_id_example" # String | ID of the Project

job_id = "job_id_example" # String | 


begin
  #Returns the Job
  result = api_instance.job(project_id, job_id)
  p result
rescue TelestreamCloud::Tts::ApiError => e
  puts "Exception when calling TtsApi->job: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| ID of the Project | 
 **job_id** | **String**|  | 

### Return type

[**Job**](Job.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **job_result**
> JobResult job_result(project_id, job_id)

Returns the Job Result

Returns the Job Result

### Example
```ruby
# load the gem
require 'telestream_cloud_tts'
# setup authorization
TelestreamCloud::Tts.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Tts::TtsApi.new

project_id = "project_id_example" # String | ID of the Project

job_id = "job_id_example" # String | 


begin
  #Returns the Job Result
  result = api_instance.job_result(project_id, job_id)
  p result
rescue TelestreamCloud::Tts::ApiError => e
  puts "Exception when calling TtsApi->job_result: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| ID of the Project | 
 **job_id** | **String**|  | 

### Return type

[**JobResult**](JobResult.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **jobs**
> JobsCollection jobs(project_id, opts)

Returns a collection of Jobs

Returns a collection of Jobs

### Example
```ruby
# load the gem
require 'telestream_cloud_tts'
# setup authorization
TelestreamCloud::Tts.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Tts::TtsApi.new

project_id = "project_id_example" # String | ID of the Project

opts = { 
  page: 56, # Integer | page number
  per_page: 56 # Integer | number of records per page
}

begin
  #Returns a collection of Jobs
  result = api_instance.jobs(project_id, opts)
  p result
rescue TelestreamCloud::Tts::ApiError => e
  puts "Exception when calling TtsApi->jobs: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| ID of the Project | 
 **page** | **Integer**| page number | [optional] 
 **per_page** | **Integer**| number of records per page | [optional] 

### Return type

[**JobsCollection**](JobsCollection.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **project**
> Project project(project_id)

Returns the Project

Returns the Project

### Example
```ruby
# load the gem
require 'telestream_cloud_tts'
# setup authorization
TelestreamCloud::Tts.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Tts::TtsApi.new

project_id = "project_id_example" # String | ID of the Project


begin
  #Returns the Project
  result = api_instance.project(project_id)
  p result
rescue TelestreamCloud::Tts::ApiError => e
  puts "Exception when calling TtsApi->project: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| ID of the Project | 

### Return type

[**Project**](Project.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **projects**
> ProjectsCollection projects

Returns a collection of Projects

Returns a collection of Projects

### Example
```ruby
# load the gem
require 'telestream_cloud_tts'
# setup authorization
TelestreamCloud::Tts.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Tts::TtsApi.new

begin
  #Returns a collection of Projects
  result = api_instance.projects
  p result
rescue TelestreamCloud::Tts::ApiError => e
  puts "Exception when calling TtsApi->projects: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ProjectsCollection**](ProjectsCollection.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **train_project**
> train_project(project_id)

Queues training

Queues training

### Example
```ruby
# load the gem
require 'telestream_cloud_tts'
# setup authorization
TelestreamCloud::Tts.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Tts::TtsApi.new

project_id = "project_id_example" # String | ID of the Project


begin
  #Queues training
  api_instance.train_project(project_id)
rescue TelestreamCloud::Tts::ApiError => e
  puts "Exception when calling TtsApi->train_project: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| ID of the Project | 

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_project**
> Project update_project(project)

Updates an existing Project

Updates an existing Project

### Example
```ruby
# load the gem
require 'telestream_cloud_tts'
# setup authorization
TelestreamCloud::Tts.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Tts::TtsApi.new

project = TelestreamCloud::Tts::Project.new # Project | 


begin
  #Updates an existing Project
  result = api_instance.update_project(project)
  p result
rescue TelestreamCloud::Tts::ApiError => e
  puts "Exception when calling TtsApi->update_project: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project** | [**Project**](Project.md)|  | 

### Return type

[**Project**](Project.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **upload_video**
> UploadSession upload_video(project_id, video_upload_body)

Creates an upload session

### Example
```ruby
# load the gem
require 'telestream_cloud_tts'
# setup authorization
TelestreamCloud::Tts.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Tts::TtsApi.new

project_id = "project_id_example" # String | ID of the Project

video_upload_body = TelestreamCloud::Tts::VideoUploadBody.new # VideoUploadBody | 


begin
  #Creates an upload session
  result = api_instance.upload_video(project_id, video_upload_body)
  p result
rescue TelestreamCloud::Tts::ApiError => e
  puts "Exception when calling TtsApi->upload_video: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| ID of the Project | 
 **video_upload_body** | [**VideoUploadBody**](VideoUploadBody.md)|  | 

### Return type

[**UploadSession**](UploadSession.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



