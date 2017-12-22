# TelestreamCloud::Flip::VideoUploadBody

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**file_size** | **Integer** | Size of the file that will be uploaded in &#x60;bytes&#x60;. | 
**file_name** | **String** | Name of the file that will be uploaded. | 
**extra_files** | [**Array&lt;ExtraFile&gt;**](ExtraFile.md) | A list of names of additional files that will be uploaded. | [optional] 
**profiles** | **String** | A comma-separated list of profile names or IDs to be used during encoding. Alternatively, specify none so no encodings will created right away. | [optional] 
**path_format** | **String** |  | [optional] 
**payload** | **Hash&lt;String, String&gt;** |  | [optional] 
**extra_variables** | **Hash&lt;String, String&gt;** |  | [optional] 
**watermark_url** | **String** | URL pointing to an image that will be used asa watermark. | [optional] 
**watermark_left** | **String** | Determines distance between the left edge of a video and the left edge of a watermark image. Can be specified in pixels or percents. This parameter can be set only if watermark_right is not. | [optional] 
**watermark_top** | **String** | Determines distance between the top edge of a video and the top edge of a watermark image. Can be specified in pixels or percents. This parameter can be set only if watermark_bottom is not. | [optional] 
**watermark_right** | **String** | Determines distance between the right edge of a video and the right edge of a watermark image. Can be specified in pixels or percents. This parameter can be set only if watermark_left is not. | [optional] 
**watermark_bottom** | **String** | Determines distance between the bottom edge of a video and the bottom edge of a watermark image. Can be specified in pixels or percents. This parameter can be set only if watermark_top is not. | [optional] 
**watermark_width** | **String** | Determines width of the watermark image. Should be specified in pixels. | [optional] 
**watermark_height** | **String** | Determines width of the watermark image. Should be specified in pixels. | [optional] 
**clip_length** | **String** | Length of the uploaded video. Should be formatted as follows: HH:MM:SS | [optional] 
**clip_offset** | **String** | Clip starts at a specific offset. | [optional] 
**multi_chunk** | **BOOLEAN** |  | [optional] [default to true]


