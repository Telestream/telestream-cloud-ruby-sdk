# TelestreamCloud::Qc::QcApi

All URIs are relative to *https://api.cloud.telestream.net/qc/v1.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cancel_job**](QcApi.md#cancel_job) | **PUT** /projects/{project_id}/jobs/{job_id}/cancel.json | 
[**create_job**](QcApi.md#create_job) | **POST** /projects/{project_id}/jobs.json | Create a new job
[**create_project**](QcApi.md#create_project) | **POST** /projects.json | Create a new project
[**get_job**](QcApi.md#get_job) | **GET** /projects/{project_id}/jobs/{job_id}.json | Get QC job
[**get_project**](QcApi.md#get_project) | **GET** /projects/{project_id}.json | Get project by Id
[**list_jobs**](QcApi.md#list_jobs) | **GET** /projects/{project_id}/jobs.json | Get jobs form projects
[**list_projects**](QcApi.md#list_projects) | **GET** /projects.json | List all projects for an account
[**modify_project**](QcApi.md#modify_project) | **PUT** /projects/{project_id}.json | Modify project
[**proxy**](QcApi.md#proxy) | **GET** /projects/{project_id}/jobs/{job_id}/proxy.json | 
[**remove_job**](QcApi.md#remove_job) | **DELETE** /projects/{project_id}/jobs/{job_id}.json | 
[**remove_project**](QcApi.md#remove_project) | **DELETE** /projects/{project_id}.json | 
[**signed_urls**](QcApi.md#signed_urls) | **GET** /projects/{project_id}/jobs/{job_id}/signed-urls.json | 
[**upload_video**](QcApi.md#upload_video) | **POST** /projects/{project_id}/upload.json | Creates an upload session


# **cancel_job**
> cancel_job(project_id, job_id)



### Example
```ruby
# load the gem
require 'telestream_cloud_qc'
# setup authorization
TelestreamCloud::Qc.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Qc::QcApi.new

project_id = "project_id_example" # String | A unique identifier of a Project.

job_id = "job_id_example" # String | A unique identifier of a Job.


begin
  api_instance.cancel_job(project_id, job_id)
rescue TelestreamCloud::Qc::ApiError => e
  puts "Exception when calling QcApi->cancel_job: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| A unique identifier of a Project. | 
 **job_id** | **String**| A unique identifier of a Job. | 

### Return type

nil (empty response body)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_job**
> Job create_job(project_id, data)

Create a new job

### Example
```ruby
# load the gem
require 'telestream_cloud_qc'
# setup authorization
TelestreamCloud::Qc.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Qc::QcApi.new

project_id = "project_id_example" # String | A unique identifier of a Project.

data = TelestreamCloud::Qc::JobData.new # JobData | 


begin
  #Create a new job
  result = api_instance.create_job(project_id, data)
  p result
rescue TelestreamCloud::Qc::ApiError => e
  puts "Exception when calling QcApi->create_job: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| A unique identifier of a Project. | 
 **data** | [**JobData**](JobData.md)|  | 

### Return type

[**Job**](Job.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_project**
> Project create_project(opts)

Create a new project

### Example
```ruby
# load the gem
require 'telestream_cloud_qc'
# setup authorization
TelestreamCloud::Qc.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Qc::QcApi.new

opts = { 
  data: TelestreamCloud::Qc::Data.new # Data | 
}

begin
  #Create a new project
  result = api_instance.create_project(opts)
  p result
rescue TelestreamCloud::Qc::ApiError => e
  puts "Exception when calling QcApi->create_project: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data** | [**Data**](Data.md)|  | [optional] 

### Return type

[**Project**](Project.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_job**
> Job get_job(project_id, job_id)

Get QC job

### Example
```ruby
# load the gem
require 'telestream_cloud_qc'
# setup authorization
TelestreamCloud::Qc.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Qc::QcApi.new

project_id = "project_id_example" # String | A unique identifier of a Project.

job_id = "job_id_example" # String | A unique identifier of a Job.


begin
  #Get QC job
  result = api_instance.get_job(project_id, job_id)
  p result
rescue TelestreamCloud::Qc::ApiError => e
  puts "Exception when calling QcApi->get_job: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| A unique identifier of a Project. | 
 **job_id** | **String**| A unique identifier of a Job. | 

### Return type

[**Job**](Job.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_project**
> Project get_project(project_id)

Get project by Id

### Example
```ruby
# load the gem
require 'telestream_cloud_qc'
# setup authorization
TelestreamCloud::Qc.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Qc::QcApi.new

project_id = "project_id_example" # String | A unique identifier of a Project.


begin
  #Get project by Id
  result = api_instance.get_project(project_id)
  p result
rescue TelestreamCloud::Qc::ApiError => e
  puts "Exception when calling QcApi->get_project: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| A unique identifier of a Project. | 

### Return type

[**Project**](Project.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_jobs**
> JobsCollection list_jobs(project_id, opts)

Get jobs form projects

### Example
```ruby
# load the gem
require 'telestream_cloud_qc'
# setup authorization
TelestreamCloud::Qc.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Qc::QcApi.new

project_id = "project_id_example" # String | A unique identifier of a Project.

opts = { 
  expand: true, # BOOLEAN | Expand details of job
  status: "status_example", # String | Filter jobs by status
  per_page: 30, # Integer | Limit number of listed jobs
  page: 56 # Integer | Index of jobs page to be listed
}

begin
  #Get jobs form projects
  result = api_instance.list_jobs(project_id, opts)
  p result
rescue TelestreamCloud::Qc::ApiError => e
  puts "Exception when calling QcApi->list_jobs: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| A unique identifier of a Project. | 
 **expand** | **BOOLEAN**| Expand details of job | [optional] 
 **status** | **String**| Filter jobs by status | [optional] 
 **per_page** | **Integer**| Limit number of listed jobs | [optional] [default to 30]
 **page** | **Integer**| Index of jobs page to be listed | [optional] 

### Return type

[**JobsCollection**](JobsCollection.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_projects**
> Array&lt;Project&gt; list_projects

List all projects for an account

### Example
```ruby
# load the gem
require 'telestream_cloud_qc'
# setup authorization
TelestreamCloud::Qc.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Qc::QcApi.new

begin
  #List all projects for an account
  result = api_instance.list_projects
  p result
rescue TelestreamCloud::Qc::ApiError => e
  puts "Exception when calling QcApi->list_projects: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Array&lt;Project&gt;**](Project.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **modify_project**
> Project modify_project(project_id, opts)

Modify project

### Example
```ruby
# load the gem
require 'telestream_cloud_qc'
# setup authorization
TelestreamCloud::Qc.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Qc::QcApi.new

project_id = "project_id_example" # String | 

opts = { 
  data: TelestreamCloud::Qc::Data1.new # Data1 | 
}

begin
  #Modify project
  result = api_instance.modify_project(project_id, opts)
  p result
rescue TelestreamCloud::Qc::ApiError => e
  puts "Exception when calling QcApi->modify_project: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**|  | 
 **data** | [**Data1**](Data1.md)|  | [optional] 

### Return type

[**Project**](Project.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **proxy**
> Proxy proxy(project_id, job_id)



### Example
```ruby
# load the gem
require 'telestream_cloud_qc'
# setup authorization
TelestreamCloud::Qc.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Qc::QcApi.new

project_id = "project_id_example" # String | A unique identifier of a Project.

job_id = "job_id_example" # String | A unique identifier of a Job.


begin
  result = api_instance.proxy(project_id, job_id)
  p result
rescue TelestreamCloud::Qc::ApiError => e
  puts "Exception when calling QcApi->proxy: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| A unique identifier of a Project. | 
 **job_id** | **String**| A unique identifier of a Job. | 

### Return type

[**Proxy**](Proxy.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **remove_job**
> remove_job(project_id, job_id)



### Example
```ruby
# load the gem
require 'telestream_cloud_qc'
# setup authorization
TelestreamCloud::Qc.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Qc::QcApi.new

project_id = "project_id_example" # String | A unique identifier of a Project.

job_id = "job_id_example" # String | A unique identifier of a Job.


begin
  api_instance.remove_job(project_id, job_id)
rescue TelestreamCloud::Qc::ApiError => e
  puts "Exception when calling QcApi->remove_job: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| A unique identifier of a Project. | 
 **job_id** | **String**| A unique identifier of a Job. | 

### Return type

nil (empty response body)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **remove_project**
> remove_project(project_id)



### Example
```ruby
# load the gem
require 'telestream_cloud_qc'
# setup authorization
TelestreamCloud::Qc.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Qc::QcApi.new

project_id = "project_id_example" # String | 


begin
  api_instance.remove_project(project_id)
rescue TelestreamCloud::Qc::ApiError => e
  puts "Exception when calling QcApi->remove_project: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**|  | 

### Return type

nil (empty response body)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **signed_urls**
> Hash&lt;String, String&gt; signed_urls(project_id, job_id)



### Example
```ruby
# load the gem
require 'telestream_cloud_qc'
# setup authorization
TelestreamCloud::Qc.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Qc::QcApi.new

project_id = "project_id_example" # String | A unique identifier of a Project.

job_id = "job_id_example" # String | A unique identifier of a Job.


begin
  result = api_instance.signed_urls(project_id, job_id)
  p result
rescue TelestreamCloud::Qc::ApiError => e
  puts "Exception when calling QcApi->signed_urls: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| A unique identifier of a Project. | 
 **job_id** | **String**| A unique identifier of a Job. | 

### Return type

**Hash&lt;String, String&gt;**

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **upload_video**
> UploadSession upload_video(project_id, video_upload_body)

Creates an upload session

### Example
```ruby
# load the gem
require 'telestream_cloud_qc'
# setup authorization
TelestreamCloud::Qc.configure do |config|
  # Configure API key authorization: apiKey
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Qc::QcApi.new

project_id = "project_id_example" # String | A unique identifier of a Project.

video_upload_body = TelestreamCloud::Qc::VideoUploadBody.new # VideoUploadBody | 


begin
  #Creates an upload session
  result = api_instance.upload_video(project_id, video_upload_body)
  p result
rescue TelestreamCloud::Qc::ApiError => e
  puts "Exception when calling QcApi->upload_video: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **String**| A unique identifier of a Project. | 
 **video_upload_body** | [**VideoUploadBody**](VideoUploadBody.md)|  | 

### Return type

[**UploadSession**](UploadSession.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



