# TelestreamCloud::Flip::UploadSession

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | An unique identifier of the UploadSession. | 
**location** | **String** | An URL to which chunks of the uploaded file should be sent | 
**parts** | **Integer** | A number of chunks that are expected by the upstream. | [optional] 
**part_size** | **Integer** | An expected size of uploaded chunks. | [optional] 
**max_connections** | **Integer** | A maximum number of concurrent connections. | [optional] 
**extra_files** | **Object** | An object containing additional files uploaded using the session. | [optional] 


