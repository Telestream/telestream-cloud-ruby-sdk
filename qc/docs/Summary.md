# TelestreamCloud::Qc::Summary

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**num_sync_events** | **Integer** | Total number of synchronization detection events considered for summary. | [optional] 
**avsync_analysis** | **String** |  | [optional] 
**avsync_inference** | **String** |  | [optional] 
**confidence** | **Float** | Confidence of avsync_inference and avsync_analysis. &#39;confidence&#39; is a value between 0 and 100. confidence &gt;&#x3D; 90  - Very high confidence. 80 &lt;&#x3D; confidence &lt; 90   - High confidence. 70 &lt;&#x3D; confidence &lt; 80   - Should be reviewed by human.  | [optional] 
**skew** | **Integer** | Skew estimate in #frames; Skew is the number of frames that audio is delayed to the video | [optional] 
**total_length** | **Float** |  | [optional] 


