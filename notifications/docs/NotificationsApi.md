# TelestreamCloud::Notifications::NotificationsApi

All URIs are relative to *https://api.cloud.telestream.net/notifications/v1.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_subscription**](NotificationsApi.md#create_subscription) | **POST** /subscriptions | Create a new subscription
[**delete_subscription**](NotificationsApi.md#delete_subscription) | **DELETE** /subscriptions/{id} | 
[**list_subscriptions**](NotificationsApi.md#list_subscriptions) | **GET** /subscriptions | 


# **create_subscription**
> create_subscription(opts)

Create a new subscription



### Example
```ruby
# load the gem
require 'telestream_cloud_notifications'
# setup authorization
TelestreamCloud::Notifications.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Notifications::NotificationsApi.new

opts = { 
  subscription: TelestreamCloud::Notifications::Subscription.new # Subscription | 
}

begin
  #Create a new subscription
  api_instance.create_subscription(opts)
rescue TelestreamCloud::Notifications::ApiError => e
  puts "Exception when calling NotificationsApi->create_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription** | [**Subscription**](Subscription.md)|  | [optional] 

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_subscription**
> delete_subscription(id)



### Example
```ruby
# load the gem
require 'telestream_cloud_notifications'
# setup authorization
TelestreamCloud::Notifications.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Notifications::NotificationsApi.new

id = "id_example" # String | 


begin
  api_instance.delete_subscription(id)
rescue TelestreamCloud::Notifications::ApiError => e
  puts "Exception when calling NotificationsApi->delete_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_subscriptions**
> Array&lt;Subscription&gt; list_subscriptions



### Example
```ruby
# load the gem
require 'telestream_cloud_notifications'
# setup authorization
TelestreamCloud::Notifications.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['X-Api-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-Api-Key'] = 'Bearer'
end

api_instance = TelestreamCloud::Notifications::NotificationsApi.new

begin
  result = api_instance.list_subscriptions
  p result
rescue TelestreamCloud::Notifications::ApiError => e
  puts "Exception when calling NotificationsApi->list_subscriptions: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Array&lt;Subscription&gt;**](Subscription.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



