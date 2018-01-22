# TelestreamCloud::Flip::FlipApi

All URIs are relative to *https://api.cloud.telestream.net/flip/3.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cancel_encoding**](FlipApi.md#cancel_encoding) | **POST** /encodings/{id}/cancel.json | Cancels an Encoding.
[**copy_profile**](FlipApi.md#copy_profile) | **POST** /profiles/{id}/copy.json | Copies a given Profile
[**create_encoding**](FlipApi.md#create_encoding) | **POST** /encodings.json | Creates an Encoding
[**create_factory**](FlipApi.md#create_factory) | **POST** /factories.json | Creates a new factory
[**create_profile**](FlipApi.md#create_profile) | **POST** /profiles.json | Creates a Profile
[**create_video**](FlipApi.md#create_video) | **POST** /videos.json | Creates a Video from a provided source_url.
[**create_workorder**](FlipApi.md#create_workorder) | **POST** /workorders.json | Creates a Workorder.
[**delete_encoding**](FlipApi.md#delete_encoding) | **DELETE** /encodings/{id}.json | Deletes an Encoding from both Telestream Cloud and your storage. Returns an information whether the operation was successful.
[**delete_profile**](FlipApi.md#delete_profile) | **DELETE** /profiles/{id}.json | Deletes a given Profile
[**delete_video**](FlipApi.md#delete_video) | **DELETE** /videos/{id}.json | Deletes a Video object.
[**delete_video_source**](FlipApi.md#delete_video_source) | **DELETE** /videos/{id}/source.json | Delete a video&#39;s source file.
[**encoding**](FlipApi.md#encoding) | **GET** /encodings/{id}.json | Returns an Encoding object.
[**encodings**](FlipApi.md#encodings) | **GET** /encodings.json | Returns a list of Encoding objects
[**encodings_count**](FlipApi.md#encodings_count) | **GET** /encodings/count.json | Returns a number of Encoding objects created using a given factory.
[**factories**](FlipApi.md#factories) | **GET** /factories.json | Returns a collection of Factory objects.
[**factory**](FlipApi.md#factory) | **GET** /factories/{id}.json | Returns a Factory object.
[**notifications**](FlipApi.md#notifications) | **GET** /notifications.json | Returns a Factory&#39;s notification settings.
[**profile**](FlipApi.md#profile) | **GET** /profiles/{id_or_name}.json | Returns a Profile object.
[**profile_encodings**](FlipApi.md#profile_encodings) | **GET** /profiles/{id_or_name}/encodings.json | Returns a list of Encodings that belong to a Profile.
[**profiles**](FlipApi.md#profiles) | **GET** /profiles.json | Returns a collection of Profile objects.
[**queued_videos**](FlipApi.md#queued_videos) | **GET** /videos/queued.json | Returns a collection of Video objects queued for encoding.
[**resubmit_video**](FlipApi.md#resubmit_video) | **POST** /videos/resubmit.json | Resubmits a video to encode.
[**retry_encoding**](FlipApi.md#retry_encoding) | **POST** /encodings/{id}/retry.json | Retries a failed encoding.
[**signed_encoding_url**](FlipApi.md#signed_encoding_url) | **GET** /encodings/{id}/signed-url.json | Returns a signed url pointing to an Encoding.
[**signed_encoding_urls**](FlipApi.md#signed_encoding_urls) | **GET** /encodings/{id}/signed-urls.json | Returns a list of signed urls pointing to an Encoding&#39;s outputs.
[**signed_video_url**](FlipApi.md#signed_video_url) | **GET** /videos/{id}/signed-url.json | Returns a signed url pointing to a Video.
[**toggle_factory_sync**](FlipApi.md#toggle_factory_sync) | **POST** /factories/{id}/sync.json | Toggles synchronisation settings.
[**update_encoding**](FlipApi.md#update_encoding) | **PUT** /encodings/{id}.json | Updates an Encoding
[**update_factory**](FlipApi.md#update_factory) | **PATCH** /factories/{id}.json | Updates a Factory&#39;s settings. Returns a Factory object.
[**update_notifications**](FlipApi.md#update_notifications) | **PUT** /notifications.json | Updates a Factory&#39;s notification settings.
[**update_profile**](FlipApi.md#update_profile) | **PUT** /profiles/{id}.json | Updates a given Profile
[**upload_video**](FlipApi.md#upload_video) | **POST** /videos/upload.json | Creates an upload session.
[**video**](FlipApi.md#video) | **GET** /videos/{id}.json | Returns a Video object.
[**video_encodings**](FlipApi.md#video_encodings) | **GET** /videos/{id}/encodings.json | Returns a list of Encodings that belong to a Video.
[**video_metadata**](FlipApi.md#video_metadata) | **GET** /videos/{id}/metadata.json | Returns a Video&#39;s metadata
[**videos**](FlipApi.md#videos) | **GET** /videos.json | Returns a collection of Video objects.
[**workflows**](FlipApi.md#workflows) | **GET** /workflows.json | Returns a collection of Workflows that belong to a Factory.


# **cancel_encoding**
> CanceledResponse cancel_encoding(id, factory_id)

Cancels an Encoding.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | Id of an Encoding.

factory_id = "factory_id_example" # String | Id of a Factory.


begin
  #Cancels an Encoding.
  result = api_instance.cancel_encoding(id, factory_id)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->cancel_encoding: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Id of an Encoding. | 
 **factory_id** | **String**| Id of a Factory. | 

### Return type

[**CanceledResponse**](CanceledResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **copy_profile**
> Profile copy_profile(id, factory_id, copy_profile_body, opts)

Copies a given Profile

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | Id of a Profile.

factory_id = "factory_id_example" # String | Id of a Factory.

copy_profile_body = TelestreamCloud::Flip::CopyProfileBody.new # CopyProfileBody | 

opts = { 
  expand: true # BOOLEAN | If expand option is set Profile objects will contain all command parameters, even if their value is default. By default this is not set.
}

begin
  #Copies a given Profile
  result = api_instance.copy_profile(id, factory_id, copy_profile_body, opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->copy_profile: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Id of a Profile. | 
 **factory_id** | **String**| Id of a Factory. | 
 **copy_profile_body** | [**CopyProfileBody**](CopyProfileBody.md)|  | 
 **expand** | **BOOLEAN**| If expand option is set Profile objects will contain all command parameters, even if their value is default. By default this is not set. | [optional] 

### Return type

[**Profile**](Profile.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_encoding**
> Encoding create_encoding(factory_id, create_encoding_body, opts)

Creates an Encoding

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

factory_id = "factory_id_example" # String | Id of a Factory.

create_encoding_body = TelestreamCloud::Flip::CreateEncodingBody.new # CreateEncodingBody | 

opts = { 
  screenshots: true, # BOOLEAN | Determines whether the response will include screenshots. By default this is not set.
  precise_status: true # BOOLEAN | Determines whether the response will include a precise status. By default this is not set.
}

begin
  #Creates an Encoding
  result = api_instance.create_encoding(factory_id, create_encoding_body, opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->create_encoding: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **factory_id** | **String**| Id of a Factory. | 
 **create_encoding_body** | [**CreateEncodingBody**](CreateEncodingBody.md)|  | 
 **screenshots** | **BOOLEAN**| Determines whether the response will include screenshots. By default this is not set. | [optional] 
 **precise_status** | **BOOLEAN**| Determines whether the response will include a precise status. By default this is not set. | [optional] 

### Return type

[**Encoding**](Encoding.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_factory**
> Factory create_factory(create_factory_body, opts)

Creates a new factory

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

create_factory_body = TelestreamCloud::Flip::FactoryBody.new # FactoryBody | 

opts = { 
  with_storage_provider: true # BOOLEAN | if set to `true`, results will include a storage provider's id
}

begin
  #Creates a new factory
  result = api_instance.create_factory(create_factory_body, opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->create_factory: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_factory_body** | [**FactoryBody**](FactoryBody.md)|  | 
 **with_storage_provider** | **BOOLEAN**| if set to &#x60;true&#x60;, results will include a storage provider&#39;s id | [optional] 

### Return type

[**Factory**](Factory.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_profile**
> Profile create_profile(factory_id, create_profile_body, opts)

Creates a Profile

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

factory_id = "factory_id_example" # String | Id of a Factory.

create_profile_body = TelestreamCloud::Flip::ProfileBody.new # ProfileBody | 

opts = { 
  exclude_advanced_services: true, # BOOLEAN | 
  expand: true # BOOLEAN | If expand option is set Profile objects will contain all command parameters, even if their value is default. By default it is not set.
}

begin
  #Creates a Profile
  result = api_instance.create_profile(factory_id, create_profile_body, opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->create_profile: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **factory_id** | **String**| Id of a Factory. | 
 **create_profile_body** | [**ProfileBody**](ProfileBody.md)|  | 
 **exclude_advanced_services** | **BOOLEAN**|  | [optional] 
 **expand** | **BOOLEAN**| If expand option is set Profile objects will contain all command parameters, even if their value is default. By default it is not set. | [optional] 

### Return type

[**Profile**](Profile.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_video**
> Video create_video(factory_id, create_video_body)

Creates a Video from a provided source_url.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

factory_id = "factory_id_example" # String | Id of a Factory.

create_video_body = TelestreamCloud::Flip::CreateVideoBody.new # CreateVideoBody | 


begin
  #Creates a Video from a provided source_url.
  result = api_instance.create_video(factory_id, create_video_body)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->create_video: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **factory_id** | **String**| Id of a Factory. | 
 **create_video_body** | [**CreateVideoBody**](CreateVideoBody.md)|  | 

### Return type

[**Video**](Video.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_workorder**
> create_workorder(factory_id, opts)

Creates a Workorder.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

factory_id = "factory_id_example" # String | Id of a Factory.

opts = { 
  profile_id: "profile_id_example", # String | Id of a Profile.
  file: File.new("/path/to/file.txt"), # File | Input file.
  source_url: "source_url_example" # String | URL pointing to an input file.
}

begin
  #Creates a Workorder.
  api_instance.create_workorder(factory_id, opts)
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->create_workorder: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **factory_id** | **String**| Id of a Factory. | 
 **profile_id** | **String**| Id of a Profile. | [optional] 
 **file** | **File**| Input file. | [optional] 
 **source_url** | **String**| URL pointing to an input file. | [optional] 

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json



# **delete_encoding**
> DeletedResponse delete_encoding(id, factory_id)

Deletes an Encoding from both Telestream Cloud and your storage. Returns an information whether the operation was successful.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | Id of an Encoding.

factory_id = "factory_id_example" # String | Id of a Factory.


begin
  #Deletes an Encoding from both Telestream Cloud and your storage. Returns an information whether the operation was successful.
  result = api_instance.delete_encoding(id, factory_id)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->delete_encoding: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Id of an Encoding. | 
 **factory_id** | **String**| Id of a Factory. | 

### Return type

[**DeletedResponse**](DeletedResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_profile**
> DeletedResponse delete_profile(id, factory_id)

Deletes a given Profile

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | Id of a Profile

factory_id = "factory_id_example" # String | Id of a Factory.


begin
  #Deletes a given Profile
  result = api_instance.delete_profile(id, factory_id)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->delete_profile: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Id of a Profile | 
 **factory_id** | **String**| Id of a Factory. | 

### Return type

[**DeletedResponse**](DeletedResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_video**
> DeletedResponse delete_video(id, factory_id)

Deletes a Video object.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | Id of a Video.

factory_id = "factory_id_example" # String | Id of a Factory.


begin
  #Deletes a Video object.
  result = api_instance.delete_video(id, factory_id)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->delete_video: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Id of a Video. | 
 **factory_id** | **String**| Id of a Factory. | 

### Return type

[**DeletedResponse**](DeletedResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_video_source**
> DeletedResponse delete_video_source(id, factory_id)

Delete a video's source file.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | Id of a Video.

factory_id = "factory_id_example" # String | Id of a Factory.


begin
  #Delete a video's source file.
  result = api_instance.delete_video_source(id, factory_id)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->delete_video_source: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Id of a Video. | 
 **factory_id** | **String**| Id of a Factory. | 

### Return type

[**DeletedResponse**](DeletedResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **encoding**
> Encoding encoding(id, factory_id, opts)

Returns an Encoding object.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | Id of an Encoding.

factory_id = "factory_id_example" # String | Id of a Factory.

opts = { 
  screenshots: true, # BOOLEAN | Determines whether the response will include screenshots. By default this is not set.
  precise_status: true # BOOLEAN | Determines whether the response will include a precise status. By default this is not set.
}

begin
  #Returns an Encoding object.
  result = api_instance.encoding(id, factory_id, opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->encoding: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Id of an Encoding. | 
 **factory_id** | **String**| Id of a Factory. | 
 **screenshots** | **BOOLEAN**| Determines whether the response will include screenshots. By default this is not set. | [optional] 
 **precise_status** | **BOOLEAN**| Determines whether the response will include a precise status. By default this is not set. | [optional] 

### Return type

[**Encoding**](Encoding.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **encodings**
> PaginatedEncodingsCollection encodings(factory_id, opts)

Returns a list of Encoding objects

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

factory_id = "factory_id_example" # String | Id of a Factory.

opts = { 
  video_id: "video_id_example", # String | Id of a Video. When specified, the resulting list will contain videos that belong to the Video.
  status: "status_example", # String | One of `success`, `fail`, `processing`. When specified, the resulting list will contain ecodings filtered by status.
  profile_id: "profile_id_example", # String | Filter by profile_id.
  profile_name: "profile_name_example", # String | Filter by profile_name.
  page: 56, # Integer | A page to be fetched. Default is `1`.
  per_page: 56, # Integer | A number of results per page. Default is `100`.
  screenshots: true, # BOOLEAN | Determines whether the response will include screenshots. By default this is not set.
  precise_status: true # BOOLEAN | Determines whether the response will include a precise status. By default this is not set.
}

begin
  #Returns a list of Encoding objects
  result = api_instance.encodings(factory_id, opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->encodings: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **factory_id** | **String**| Id of a Factory. | 
 **video_id** | **String**| Id of a Video. When specified, the resulting list will contain videos that belong to the Video. | [optional] 
 **status** | **String**| One of &#x60;success&#x60;, &#x60;fail&#x60;, &#x60;processing&#x60;. When specified, the resulting list will contain ecodings filtered by status. | [optional] 
 **profile_id** | **String**| Filter by profile_id. | [optional] 
 **profile_name** | **String**| Filter by profile_name. | [optional] 
 **page** | **Integer**| A page to be fetched. Default is &#x60;1&#x60;. | [optional] 
 **per_page** | **Integer**| A number of results per page. Default is &#x60;100&#x60;. | [optional] 
 **screenshots** | **BOOLEAN**| Determines whether the response will include screenshots. By default this is not set. | [optional] 
 **precise_status** | **BOOLEAN**| Determines whether the response will include a precise status. By default this is not set. | [optional] 

### Return type

[**PaginatedEncodingsCollection**](PaginatedEncodingsCollection.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **encodings_count**
> CountResponse encodings_count(factory_id)

Returns a number of Encoding objects created using a given factory.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

factory_id = "factory_id_example" # String | Id of a Factory.


begin
  #Returns a number of Encoding objects created using a given factory.
  result = api_instance.encodings_count(factory_id)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->encodings_count: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **factory_id** | **String**| Id of a Factory. | 

### Return type

[**CountResponse**](CountResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **factories**
> PaginatedFactoryCollection factories(opts)

Returns a collection of Factory objects.

Returns a collection of Factory objects.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

opts = { 
  page: 56, # Integer | A page to be fetched. Default is `1`.
  per_page: 56, # Integer | A number of results per page. Default is `100`.
  with_storage_provider: true # BOOLEAN | if set to `true`, results will include a storage provider's id
}

begin
  #Returns a collection of Factory objects.
  result = api_instance.factories(opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->factories: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **Integer**| A page to be fetched. Default is &#x60;1&#x60;. | [optional] 
 **per_page** | **Integer**| A number of results per page. Default is &#x60;100&#x60;. | [optional] 
 **with_storage_provider** | **BOOLEAN**| if set to &#x60;true&#x60;, results will include a storage provider&#39;s id | [optional] 

### Return type

[**PaginatedFactoryCollection**](PaginatedFactoryCollection.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **factory**
> Factory factory(id, opts)

Returns a Factory object.

Returns a Factory object.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | id of a factory

opts = { 
  with_storage_provider: true # BOOLEAN | if set to `true`, results will include a storage provider's id
}

begin
  #Returns a Factory object.
  result = api_instance.factory(id, opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->factory: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| id of a factory | 
 **with_storage_provider** | **BOOLEAN**| if set to &#x60;true&#x60;, results will include a storage provider&#39;s id | [optional] 

### Return type

[**Factory**](Factory.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **notifications**
> CloudNotificationSettings notifications(factory_id)

Returns a Factory's notification settings.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

factory_id = "factory_id_example" # String | Id of a Factory.


begin
  #Returns a Factory's notification settings.
  result = api_instance.notifications(factory_id)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->notifications: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **factory_id** | **String**| Id of a Factory. | 

### Return type

[**CloudNotificationSettings**](CloudNotificationSettings.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **profile**
> Profile profile(id_or_name, factory_id, opts)

Returns a Profile object.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id_or_name = "id_or_name_example" # String | A name or an id of a Profile.

factory_id = "factory_id_example" # String | Id of a Factory.

opts = { 
  expand: true # BOOLEAN | If expand option is set Profile objects will contain all command parameters, even if their value is default. By default this is not set.
}

begin
  #Returns a Profile object.
  result = api_instance.profile(id_or_name, factory_id, opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->profile: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id_or_name** | **String**| A name or an id of a Profile. | 
 **factory_id** | **String**| Id of a Factory. | 
 **expand** | **BOOLEAN**| If expand option is set Profile objects will contain all command parameters, even if their value is default. By default this is not set. | [optional] 

### Return type

[**Profile**](Profile.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **profile_encodings**
> PaginatedEncodingsCollection profile_encodings(id_or_name, factory_id)

Returns a list of Encodings that belong to a Profile.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id_or_name = "id_or_name_example" # String | Id or name of a Profile.

factory_id = "factory_id_example" # String | Id of a Factory.


begin
  #Returns a list of Encodings that belong to a Profile.
  result = api_instance.profile_encodings(id_or_name, factory_id)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->profile_encodings: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id_or_name** | **String**| Id or name of a Profile. | 
 **factory_id** | **String**| Id of a Factory. | 

### Return type

[**PaginatedEncodingsCollection**](PaginatedEncodingsCollection.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **profiles**
> PaginatedProfilesCollection profiles(factory_id, opts)

Returns a collection of Profile objects.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

factory_id = "factory_id_example" # String | Id of a Factory.

opts = { 
  exclude_advanced_services: true, # BOOLEAN | Determine whether exclude Advanced Services profiles from the results. By default this is not set.
  expand: true, # BOOLEAN | If expand option is set Profile objects will contain all command parameters, even if their value is default. By default this is not set.
  page: 56, # Integer | A page to be fetched. Default is `1`.
  per_page: 56 # Integer | A number of results per page. Default is `100`.
}

begin
  #Returns a collection of Profile objects.
  result = api_instance.profiles(factory_id, opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->profiles: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **factory_id** | **String**| Id of a Factory. | 
 **exclude_advanced_services** | **BOOLEAN**| Determine whether exclude Advanced Services profiles from the results. By default this is not set. | [optional] 
 **expand** | **BOOLEAN**| If expand option is set Profile objects will contain all command parameters, even if their value is default. By default this is not set. | [optional] 
 **page** | **Integer**| A page to be fetched. Default is &#x60;1&#x60;. | [optional] 
 **per_page** | **Integer**| A number of results per page. Default is &#x60;100&#x60;. | [optional] 

### Return type

[**PaginatedProfilesCollection**](PaginatedProfilesCollection.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **queued_videos**
> PaginatedVideoCollection queued_videos(factory_id, opts)

Returns a collection of Video objects queued for encoding.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

factory_id = "factory_id_example" # String | Id of a Factory.

opts = { 
  page: 56, # Integer | A page to be fetched. Default is `1`.
  per_page: 56 # Integer | A number of results per page. Default is `100`.
}

begin
  #Returns a collection of Video objects queued for encoding.
  result = api_instance.queued_videos(factory_id, opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->queued_videos: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **factory_id** | **String**| Id of a Factory. | 
 **page** | **Integer**| A page to be fetched. Default is &#x60;1&#x60;. | [optional] 
 **per_page** | **Integer**| A number of results per page. Default is &#x60;100&#x60;. | [optional] 

### Return type

[**PaginatedVideoCollection**](PaginatedVideoCollection.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **resubmit_video**
> resubmit_video(factory_id, resubmit_video_body)

Resubmits a video to encode.

Resubmits the video to encode. Please note that this option will work only for videos in `success` status.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

factory_id = "factory_id_example" # String | Id of a Factory.

resubmit_video_body = TelestreamCloud::Flip::ResubmitVideoBody.new # ResubmitVideoBody | 


begin
  #Resubmits a video to encode.
  api_instance.resubmit_video(factory_id, resubmit_video_body)
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->resubmit_video: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **factory_id** | **String**| Id of a Factory. | 
 **resubmit_video_body** | [**ResubmitVideoBody**](ResubmitVideoBody.md)|  | 

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **retry_encoding**
> RetriedResponse retry_encoding(id, factory_id)

Retries a failed encoding.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | Id of an Encoding.

factory_id = "factory_id_example" # String | Id of a Factory.


begin
  #Retries a failed encoding.
  result = api_instance.retry_encoding(id, factory_id)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->retry_encoding: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Id of an Encoding. | 
 **factory_id** | **String**| Id of a Factory. | 

### Return type

[**RetriedResponse**](RetriedResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **signed_encoding_url**
> EncodingSignedUrl signed_encoding_url(id, factory_id)

Returns a signed url pointing to an Encoding.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | Id of an Encoding.

factory_id = "factory_id_example" # String | Id of a Factory.


begin
  #Returns a signed url pointing to an Encoding.
  result = api_instance.signed_encoding_url(id, factory_id)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->signed_encoding_url: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Id of an Encoding. | 
 **factory_id** | **String**| Id of a Factory. | 

### Return type

[**EncodingSignedUrl**](EncodingSignedUrl.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **signed_encoding_urls**
> EncodingSignedUrls signed_encoding_urls(id, factory_id)

Returns a list of signed urls pointing to an Encoding's outputs.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | Id of an Encoding.

factory_id = "factory_id_example" # String | Id of a Factory.


begin
  #Returns a list of signed urls pointing to an Encoding's outputs.
  result = api_instance.signed_encoding_urls(id, factory_id)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->signed_encoding_urls: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Id of an Encoding. | 
 **factory_id** | **String**| Id of a Factory. | 

### Return type

[**EncodingSignedUrls**](EncodingSignedUrls.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **signed_video_url**
> SignedVideoUrl signed_video_url(id, factory_id)

Returns a signed url pointing to a Video.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | Id of a Video.

factory_id = "factory_id_example" # String | Id of a Factory.


begin
  #Returns a signed url pointing to a Video.
  result = api_instance.signed_video_url(id, factory_id)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->signed_video_url: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Id of a Video. | 
 **factory_id** | **String**| Id of a Factory. | 

### Return type

[**SignedVideoUrl**](SignedVideoUrl.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **toggle_factory_sync**
> FactorySync toggle_factory_sync(id, factory_sync_body)

Toggles synchronisation settings.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | id of the factory

factory_sync_body = TelestreamCloud::Flip::FactorySyncBody.new # FactorySyncBody | 


begin
  #Toggles synchronisation settings.
  result = api_instance.toggle_factory_sync(id, factory_sync_body)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->toggle_factory_sync: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| id of the factory | 
 **factory_sync_body** | [**FactorySyncBody**](FactorySyncBody.md)|  | 

### Return type

[**FactorySync**](FactorySync.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_encoding**
> Encoding update_encoding(id, factory_id, update_encoding_body, opts)

Updates an Encoding

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | Id of an Encoding.

factory_id = "factory_id_example" # String | Id of a Factory.

update_encoding_body = TelestreamCloud::Flip::UpdateEncodingBody.new # UpdateEncodingBody | 

opts = { 
  screenshots: true, # BOOLEAN | Determines whether the response will include screenshots. By default this is not set.
  precise_status: true # BOOLEAN | Determines whether the response will include a precise status. By default this is not set.
}

begin
  #Updates an Encoding
  result = api_instance.update_encoding(id, factory_id, update_encoding_body, opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->update_encoding: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Id of an Encoding. | 
 **factory_id** | **String**| Id of a Factory. | 
 **update_encoding_body** | [**UpdateEncodingBody**](UpdateEncodingBody.md)|  | 
 **screenshots** | **BOOLEAN**| Determines whether the response will include screenshots. By default this is not set. | [optional] 
 **precise_status** | **BOOLEAN**| Determines whether the response will include a precise status. By default this is not set. | [optional] 

### Return type

[**Encoding**](Encoding.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_factory**
> Factory update_factory(id, update_factory_body, opts)

Updates a Factory's settings. Returns a Factory object.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | id of the factory

update_factory_body = TelestreamCloud::Flip::FactoryBody.new # FactoryBody | 

opts = { 
  with_storage_provider: true # BOOLEAN | if set to `true`, results will include a storage provider's id
}

begin
  #Updates a Factory's settings. Returns a Factory object.
  result = api_instance.update_factory(id, update_factory_body, opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->update_factory: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| id of the factory | 
 **update_factory_body** | [**FactoryBody**](FactoryBody.md)|  | 
 **with_storage_provider** | **BOOLEAN**| if set to &#x60;true&#x60;, results will include a storage provider&#39;s id | [optional] 

### Return type

[**Factory**](Factory.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_notifications**
> CloudNotificationSettings update_notifications(factory_id, cloud_notification_settings_body)

Updates a Factory's notification settings.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

factory_id = "factory_id_example" # String | Id of a Factory.

cloud_notification_settings_body = TelestreamCloud::Flip::CloudNotificationSettings.new # CloudNotificationSettings | 


begin
  #Updates a Factory's notification settings.
  result = api_instance.update_notifications(factory_id, cloud_notification_settings_body)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->update_notifications: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **factory_id** | **String**| Id of a Factory. | 
 **cloud_notification_settings_body** | [**CloudNotificationSettings**](CloudNotificationSettings.md)|  | 

### Return type

[**CloudNotificationSettings**](CloudNotificationSettings.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_profile**
> Profile update_profile(id, factory_id, update_profile_body, opts)

Updates a given Profile

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | 

factory_id = "factory_id_example" # String | Id of a Factory.

update_profile_body = TelestreamCloud::Flip::ProfileBody.new # ProfileBody | 

opts = { 
  exclude_advanced_services: true, # BOOLEAN | 
  expand: true # BOOLEAN | If expand option is set Profile objects will contain all command parameters, even if their value is default. By default this is not set.
}

begin
  #Updates a given Profile
  result = api_instance.update_profile(id, factory_id, update_profile_body, opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->update_profile: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **factory_id** | **String**| Id of a Factory. | 
 **update_profile_body** | [**ProfileBody**](ProfileBody.md)|  | 
 **exclude_advanced_services** | **BOOLEAN**|  | [optional] 
 **expand** | **BOOLEAN**| If expand option is set Profile objects will contain all command parameters, even if their value is default. By default this is not set. | [optional] 

### Return type

[**Profile**](Profile.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **upload_video**
> UploadSession upload_video(factory_id, video_upload_body)

Creates an upload session.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

factory_id = "factory_id_example" # String | Id of a Factory.

video_upload_body = TelestreamCloud::Flip::VideoUploadBody.new # VideoUploadBody | 


begin
  #Creates an upload session.
  result = api_instance.upload_video(factory_id, video_upload_body)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->upload_video: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **factory_id** | **String**| Id of a Factory. | 
 **video_upload_body** | [**VideoUploadBody**](VideoUploadBody.md)|  | 

### Return type

[**UploadSession**](UploadSession.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **video**
> Video video(id, factory_id)

Returns a Video object.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | Id of a Video.

factory_id = "factory_id_example" # String | Id of a Factory.


begin
  #Returns a Video object.
  result = api_instance.video(id, factory_id)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->video: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Id of a Video. | 
 **factory_id** | **String**| Id of a Factory. | 

### Return type

[**Video**](Video.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **video_encodings**
> PaginatedEncodingsCollection video_encodings(id, factory_id, opts)

Returns a list of Encodings that belong to a Video.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | Id of a Video.

factory_id = "factory_id_example" # String | Id of a Factory.

opts = { 
  page: 56, # Integer | A page to be fetched. Default is `1`.
  per_page: 56, # Integer | A number of results per page. Default is `100`.
  screenshots: true, # BOOLEAN | Determines whether the response will include screenshots. By default this is not set.
  precise_status: true # BOOLEAN | Determines whether the response will include a precise status. By default this is not set.
}

begin
  #Returns a list of Encodings that belong to a Video.
  result = api_instance.video_encodings(id, factory_id, opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->video_encodings: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Id of a Video. | 
 **factory_id** | **String**| Id of a Factory. | 
 **page** | **Integer**| A page to be fetched. Default is &#x60;1&#x60;. | [optional] 
 **per_page** | **Integer**| A number of results per page. Default is &#x60;100&#x60;. | [optional] 
 **screenshots** | **BOOLEAN**| Determines whether the response will include screenshots. By default this is not set. | [optional] 
 **precise_status** | **BOOLEAN**| Determines whether the response will include a precise status. By default this is not set. | [optional] 

### Return type

[**PaginatedEncodingsCollection**](PaginatedEncodingsCollection.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **video_metadata**
> VideoMetadata video_metadata(id, factory_id)

Returns a Video's metadata

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

id = "id_example" # String | Id of a Video.

factory_id = "factory_id_example" # String | Id of a Factory.


begin
  #Returns a Video's metadata
  result = api_instance.video_metadata(id, factory_id)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->video_metadata: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Id of a Video. | 
 **factory_id** | **String**| Id of a Factory. | 

### Return type

[**VideoMetadata**](VideoMetadata.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **videos**
> PaginatedVideoCollection videos(factory_id, opts)

Returns a collection of Video objects.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

factory_id = "factory_id_example" # String | Id of a Factory.

opts = { 
  page: 56, # Integer | A page to be fetched. Default is `1`.
  per_page: 56 # Integer | A number of results per page. Default is `100`.
}

begin
  #Returns a collection of Video objects.
  result = api_instance.videos(factory_id, opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->videos: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **factory_id** | **String**| Id of a Factory. | 
 **page** | **Integer**| A page to be fetched. Default is &#x60;1&#x60;. | [optional] 
 **per_page** | **Integer**| A number of results per page. Default is &#x60;100&#x60;. | [optional] 

### Return type

[**PaginatedVideoCollection**](PaginatedVideoCollection.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **workflows**
> PaginatedWorkflowsCollection workflows(factory_id, opts)

Returns a collection of Workflows that belong to a Factory.

### Example
```ruby
# load the gem
require 'telestream_cloud_flip'
# setup authorization
TelestreamCloud::Flip.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Flip::FlipApi.new

factory_id = "factory_id_example" # String | Id of a Factory.

opts = { 
  page: 56, # Integer | A page to be fetched. Default is `1`.
  per_page: 56 # Integer | A number of results per page. Default is `100`.
}

begin
  #Returns a collection of Workflows that belong to a Factory.
  result = api_instance.workflows(factory_id, opts)
  p result
rescue TelestreamCloud::Flip::ApiError => e
  puts "Exception when calling FlipApi->workflows: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **factory_id** | **String**| Id of a Factory. | 
 **page** | **Integer**| A page to be fetched. Default is &#x60;1&#x60;. | [optional] 
 **per_page** | **Integer**| A number of results per page. Default is &#x60;100&#x60;. | [optional] 

### Return type

[**PaginatedWorkflowsCollection**](PaginatedWorkflowsCollection.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



