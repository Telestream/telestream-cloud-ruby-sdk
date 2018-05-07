# TelestreamCloud::Flip::CreateVideoBody

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**source_url** | **String** | An URL pointing to a source file. | [optional] 
**profiles** | **String** | Comma-separated list of profile names or IDs to be used during encoding. Alternatively, specify none so no encodings are created yet. | [optional] 
**payload** | **String** | Arbitrary string stored along the Video object. | [optional] 
**pipeline** | **String** | String-encoded JSON describing profiles pipeline. | [optional] 
**subtitle_files** | **Array&lt;String&gt;** | A list of urls pointing to remote subtitle files. | [optional] 
**extra_files** | **Hash&lt;String, Array&lt;String&gt;&gt;** |  | [optional] 
**extra_variables** | **Hash&lt;String, String&gt;** |  | [optional] 
**path_format** | **String** |  | [optional] 
**clip_end** | **String** | Clip ends at a specific time. | [optional] 
**clip_length** | **String** | A clip’s duration. | [optional] 
**clip_offset** | **String** | Clip starts at a specific offset. | [optional] 


