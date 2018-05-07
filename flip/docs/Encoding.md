# TelestreamCloud::Flip::Encoding

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | A unique identifier of an Encoding. | [optional] 
**audio_bitrate** | **Integer** | Audio bitrate (in bits/s). | [optional] 
**audio_channels** | **Integer** | A number of audio channels. | [optional] 
**audio_codec** | **String** | A codec that is used to encode audio streams. | [optional] 
**audio_sample_rate** | **Integer** | A number of samples of audio carried per second. | [optional] 
**created_at** | **String** | A date and time when the Encoding has been created. | [optional] 
**duration** | **Integer** |  | [optional] 
**encoding_progress** | **Integer** |  | [optional] 
**encoding_time** | **Integer** |  | [optional] 
**error_class** | **String** | A class of an error that has occurred during the encoding process. It is present only if the encoding status is equal to &#x60;fail&#x60;. | [optional] 
**error_message** | **String** | A message that explains why the encoding process has resulted in an error. It is present only if the encoding status is equal to &#x60;fail&#x60;. | [optional] 
**external_id** | **String** |  | [optional] 
**extname** | **String** | Extension of the output file. | [optional] 
**file_size** | **Integer** | A size of the output file. | [optional] 
**files** | **Array&lt;String&gt;** | An array of output file names. | [optional] 
**fps** | **Float** | Number of frames per second. | [optional] 
**height** | **Integer** | Height of the output video. | [optional] 
**width** | **Integer** | Width of the output video. | [optional] 
**logfile_url** | **String** | An URL pointing to a logfile. | [optional] 
**mime_type** | **String** | A mime type of the encoded file. | [optional] 
**parent_encoding_id** | **String** |  | [optional] 
**path** | **String** |  | [optional] 
**profile_id** | **String** | An id of a related Profile. | [optional] 
**profile_name** | **String** | A name of the used Profile. | [optional] 
**screenshots** | **Array&lt;String&gt;** |  | [optional] 
**started_encoding_at** | **String** | A date and time when the encoding process has been started | [optional] 
**status** | **String** | Determines at what stage the encoding process is at the moment. | [optional] 
**updated_at** | **String** | A date and time when a Encoding has been updated last time. | [optional] 
**video_bitrate** | **Integer** | video bitrate (in bits/s) | [optional] 
**video_codec** | **String** | A codec that is used to encode video streams. | [optional] 
**video_id** | **String** | An id of a related Video object | [optional] 


