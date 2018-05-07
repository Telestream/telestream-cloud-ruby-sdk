# TelestreamCloud::Notifications::Params

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**addresses** | **Array&lt;String&gt;** | [required] #email;  E-mail addresses  | [optional] 
**url** | **String** | [required] #webhook;  Webhook URL  | [optional] 
**method** | **String** | [optional] #webhook;  HTTP method; default: POST (GET, POST)  | [optional] 
**retries** | **Integer** | [optional] #webhook;  Number of retries before forgetting the notification; default: 0  | [optional] 
**content_type** | **String** | [optional] #webhook; default: application/json (application/json, application/x-www-form-urlencoded)  | [optional] 


