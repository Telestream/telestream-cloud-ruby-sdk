# TelestreamCloud::Flip::ProfileBody

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**preset_name** | **String** | a name of a preset that a profile will use. | 
**advanced_fps_conversion** | **String** | todo | [optional] 
**aspect_mode** | **String** | Default is \&quot;letterbox\&quot;. | [optional] 
**aspect_ratio** | **String** | Sets the desired display aspect ratio. By default it is not set. | [optional] 
**audio_bitrate** | **Integer** | audio bitrate (in bits/s) | [optional] 
**audio_channels** | **Integer** | Sets the number of audio channels. By default it is not set. | [optional] 
**audio_channels_layout** | **String** | A channel layout specifies the spatial disposition of the channels in a multi-channel audio stream. | [optional] 
**audio_channels_per_track** | **String** | Sets the number of audio channels per track. | [optional] 
**audio_codec** | **String** | Audio codec that will be used by the profile. | [optional] 
**audio_format** | **String** | Specifies an audio container. | [optional] 
**audio_pid** | **String** | Packet identifier used by MPEG formats. | [optional] 
**audio_profile** | **String** | Sets an audio profile. | [optional] 
**audio_sample_rate** | **Integer** | The number of samples of audio carried per second. | [optional] 
**audio_streams** | **Integer** | Sets the number of audio streams. | [optional] 
**avcintra_class** | **String** | class of the AVC-Intra video coding. | [optional] 
**buffer_size** | **String** | Sets the buffer size, and can be 1-2 seconds for most gaming screencasts, and up to 5 seconds for more static content. You will have to experiment to see what looks best for your content. | [optional] 
**buffer_size_in_packets** | **String** | todo | [optional] 
**clip_length** | **String** | Sets the clip’s duration. | [optional] 
**clip_offset** | **String** | Clip starts at a specific offset. | [optional] 
**closed_captions** | **String** | One of add (adds captions as a separate streams) or burn (burns captions on video stream using the first subtitle file). By default it is not set. | [optional] 
**dash_profile** | **String** |  | [optional] 
**deinterlace** | **String** | One of &#x60;keep_fps&#x60; or &#x60;double_fps&#x60;. By default it is not set. | [optional] 
**deinterlace_frames** | **String** |  | [optional] 
**dnxhd_type** | **String** |  | [optional] 
**encryption** | **BOOLEAN** |  | [optional] 
**extname** | **String** | File extension. | [optional] 
**fps** | **Float** | Null value copy the original fps. By default it is not set. | [optional] 
**frame_offsets** | **String** | Array of offsets (Frames or seconds). | [optional] 
**frame_interval** | **String** | Thumbnail interval (Frames or seconds). | [optional] 
**frame_count** | **Integer** | Evenly spaced number of generated screenshots. By default it is not set. | [optional] 
**h264_level** | **String** | A specified set of constraints that indicate a degree of required decoder performance for a profile. | [optional] 
**h264_profile** | **String** | Profiles represent a sub-set of the encoding techniques available in H.264. | [optional] 
**h264_tune** | **String** | Use this option to change settings based upon the specifics of your input | [optional] 
**height** | **Integer** | Height in pixels. | [optional] 
**imx_type** | **String** |  | [optional] 
**interlace** | **String** |  | [optional] 
**keyframe_interval** | **Integer** | Adds a key frame every N frames. Default is 250, adds a key frame every 250 frames. | [optional] 
**keyframe_rate** | **Float** | todo | [optional] 
**max_rate** | **Integer** | Set max bitrate tolerance (in bits/s). By default this is not set | [optional] 
**merge_audio_streams** | **String** |  | [optional] 
**name** | **String** | Unique machine-readable name that will identify the profile. Helpful later on for filtering encodings by profile. | [optional] 
**outputs_path_format** | **String** | Specify the directory where the output files should be stored. By default it is not set. More information about this [here](https://cloud.telestream.net/docs#path-format---know-how). | [optional] 
**pmt_pid** | **String** |  | [optional] 
**prores_format** | **String** |  | [optional] 
**segment_time** | **String** |  | [optional] 
**size** | **String** |  | [optional] 
**tar** | **BOOLEAN** |  | [optional] 
**transport_rate** | **String** |  | [optional] 
**ts_pids** | **String** |  | [optional] 
**upscale** | **BOOLEAN** | Upscale the video resolution to match your profile. Default is &#x60;true&#x60;. | [optional] 
**variants** | **String** | Pattern utilised to match HLS.Variant presets by name. Default is hls.*. | [optional] 
**video_bitrate** | **Integer** |  | [optional] 
**video_pid** | **String** |  | [optional] 
**watermark_bottom** | **String** | Distance from the bottom of the video frame in pixels or percentage of video frame height. Works like CSS. Default is &#x60;0&#x60;. | [optional] 
**watermark_height** | **String** | Height of the watermark image in pixels or percentage of video frame height. Default is no resizing | [optional] 
**watermark_left** | **String** | Distance from the left of the video frame in pixels or percentage of video frame width. Works like CSS. Default is &#x60;0&#x60;. | [optional] 
**watermark_right** | **String** | Distance from the right of the video frame in pixels or percentage of video frame width. Works like CSS. Default is &#x60;0&#x60;. | [optional] 
**watermark_top** | **String** | Distance from the top of the video frame in pixels or percentage of video frame height. Works like CSS. Default is &#x60;0&#x60;. | [optional] 
**watermark_url** | **String** | Url of a watermark image. | [optional] 
**watermark_width** | **String** | Width of the watermark image in pixels or percentage of video frame width. Default is &#x60;no resizing&#x60;. | [optional] 
**width** | **Integer** | Width in pixels. | [optional] 
**x264_options** | **String** |  | [optional] 
**x265_options** | **String** |  | [optional] 
**xdcam_format** | **String** |  | [optional] 
**mute_audio_tracks** | **BOOLEAN** | Remove audio from input video file. By default it is set to &#x60;false&#x60;. | [optional] 
**byte_range_requests** | **String** |  | [optional] 
**lang** | **String** |  | [optional] 
**use_editlist** | **String** |  | [optional] 
**audio_map** | **String** |  | [optional] 
**audio_stream_id** | **String** |  | [optional] 
**bumpers** | **String** |  | [optional] 
**codec_preset** | **String** | Determines a preset that is used by encoders. | [optional] 
**color_metadata** | **String** |  | [optional] 
**crop_input_bottom** | **String** | Distance (in pixels) from the bottom edge of the screen from which you want your crop to be done. | [optional] 
**crop_input_height** | **String** | Width of the cropped image in pixels. | [optional] 
**crop_input_left** | **String** | Distance (in pixels) from the left edge of the screen from which you want your crop to be done. | [optional] 
**crop_input_right** | **String** | Distance (in pixels) from the right edge of the screen from which you want your crop to be done. | [optional] 
**crop_input_top** | **String** | Distance (in pixels) from the top edge of the screen from which you want your crop to be done. | [optional] 
**crop_input_width** | **String** | Height of the cropped image in pixels. | [optional] 
**dynamic_recipe** | **String** |  | [optional] 
**playlist_type** | **String** |  | [optional] 
**preset_version** | **String** |  | [optional] 
**segment_delimiter** | **String** |  | [optional] 
**sws_flags** | **String** |  | [optional] 
**telestream_block_size** | **String** |  | [optional] 
**telestream_blur_scaler** | **String** | Minimum value is 0, maximum is 4. | [optional] 
**telestream_cost_scaler** | **String** | Minimum value is 0, maximum is 4. | [optional] 
**telestream_search_length_scaler** | **String** | Minimum value is 0, maximum is 2. | [optional] 
**telestream_subpel_mode** | **String** |  | [optional] 
**trailers** | **String** |  | [optional] 
**vantage_group_id** | **String** |  | [optional] 
**watermark_bumpers** | **String** |  | [optional] 
**watermark_trailers** | **String** |  | [optional] 
**workorder_criteria** | **Object** |  | [optional] 
**tachyon_allow_remove_pulldown** | **BOOLEAN** | Enable more sensitive pulldown removal algorithm. | [optional] 
**tachyon_enable_post_pulldown_filter** | **BOOLEAN** | If the images you are converting are composited 29.976, but the pulldown pattern was not adhered to when performing the composite, this setting is required to remove combing artifacts. It will also remove combing artifacts related to very poor 3:2 cadence. | [optional] 
**tachyon_media_hint_is_cartoon** | **BOOLEAN** |  | [optional] 
**tachyon_media_hint_has_chroma_noise** | **BOOLEAN** | Remove chroma noise during the analysis of a video. | [optional] 
**tachyon_more_sensitive_remove_pulldown** | **BOOLEAN** | When pulldown is not achieved due to extremely broken cadence, or other factors like highly mixed content or if chroma noise masks motion, the pulldown engine may fall back to de-interlacing rather than removing telecine. If that&#39;s a case, a more sensitive pulldown pattern can be used. This algorithm favors inverse telecine and with lower thresholds for triggering pulldown identification, will maximize the number of progressive frames created from the video. | [optional] 
**tachyon_allow_add_standard_pd** | **BOOLEAN** |  | [optional] 
**tachyon_allow_add_2_2pd** | **BOOLEAN** | Allows 2:2 (PSF) Insertion. Creates a new series of frames which are based on duplicating the field an interlacing it into top/bottom field. Maintains a film-look. | [optional] 
**tachyon_allow_add_4_4pd** | **BOOLEAN** | Allows 4:4 Insertion. Repeats each progressive frame twice on output (motion rate is halved). This setting is used when you want to convert to high progressive frame rates (i.e. 50p/59.94p/60p) but want to preserve film qualities (low motion rate, such as 24p). | [optional] 
**tachyon_allow_add_4_6pd** | **BOOLEAN** | 2:3 Insertion. inserts a standard 2:3 telecine pattern to 23.976p video stream to achieve a 29.97i frame rate | [optional] 
**tachyon_allow_add_euro_pd** | **BOOLEAN** | Allows Euro Insertion. For field based interpolation rather than pixel-based. This is designed for interlaced or progressive integer frame rate conversions that are being converted to interlaced outputs. This method is valid for 24p to 50i conversions only. | [optional] 
**tachyon_allow_add_adaptive_pd** | **BOOLEAN** | Allows Adaptive Insertion. For field-based interpolation rather than using pixel-based interpolation. This algorithm is designed for both integer and non-integer frame rate conversion targets - as long as one of them is a non-integer rate (23.976, 29.97, 59.94, etc). This creates NTSC-PAL conversions clean of motion artifacts at the expense of potential slight stutter. Stutter is most noticeable with material that has smooth and uniform motion. | [optional] 
**tachyon_motion_amount** | **String** | This setting determines how much Tachyon will trust motion vectors in the creation of new images | [optional] 
**tachyon_fallback_size** | **String** | This option specifies the transition region size between fallback areas and motion compensated areas. A larger fallback size allows more blending (feathering) to occur between the regions. | [optional] 
**tachyon_mblock_size** | **String** | This option specifies the size of a motion block. | [optional] 
**tachyon_cut_detection_sensitivity** | **Float** |  | [optional] 
**eac3_evolution_enable** | **BOOLEAN** | Enables the trusted metadata framework. | [optional] 
**eac3_bitstream_mode** | **String** | Selects the type of audio service. **For 1/0 Voiceover will be used when Voiceover/Karaoke is selected. For 2/0 and above Karaoke will be used. | [optional] 
**eac3_ninety_degree_phase_shift** | **BOOLEAN** | Applies a 90-degree phase shift to the surround channels; necessary if the output file is being decoded by a Dolby Surround Pro Logic or Pro Logic II decoder. | [optional] 
**eac3_three_decibel_attenuation** | **BOOLEAN** | Attenuates the surround channels by 3 dB before encoding. | [optional] 
**eac3_enable_lfe_low_pass_filter** | **BOOLEAN** | Applies a 120 Hz eighth order lowpass filter to the LFE input prior to encoding. | [optional] 
**eac3_analog_to_digital_converter_type** | **String** | Allows audio that has passed through an A/D conversion stage to be marked as such. | [optional] 
**eac3_stereo_downmix_preference** | **String** |  | [optional] 
**eac3_lt_rt_center_mix_level** | **String** | Indicates the level shift applied to the center channel when adding to the left and right outputs during a downmix to a Lt/Rt output. | [optional] 
**eac3_lt_rt_surround_mix_level** | **String** | Indicates the level shift applied to the surround channel when adding to the left and right outputs during a downmix to a Lt/Rt output. | [optional] 
**eac3_lo_ro_center_mix_level** | **String** | Indicates the level shift applied to the center channel when adding to the left and right outputs during a downmix to a Lo/Ro output. | [optional] 
**eac3_lo_ro_surround_mix_level** | **String** | Indicates the level shift applied to the surround channel when adding to the left and right outputs during a downmix to a Lo/Ro output. | [optional] 
**eac3_surround_ex_mode** | **String** | Indicates whether the audio stream was encoded using Dolby EX. | [optional] 
**eac3_drc_line_mode_profile** | **String** | Dynamic Range Control for Line Mode. | [optional] 
**eac3_drc_rf_mode_profile** | **String** | Dynamic Range Control for RF Mode. | [optional] 
**eac3_dialog_normalization** | **Integer** | Represents the volume level of dialog in the audio stream which can be used by a Dolby Digital decoder. This aids the decoder in matching volume between program sources. Minimum value is 1, maximum is 31. | [optional] 
**eac3_room_type** | **String** |  | [optional] 
**eac3_mixing_level** | **Integer** | Minimum value is 80, maximum is 111. | [optional] 
**eac3_copyright_protected** | **BOOLEAN** | Indicates whether the encoded bitstream is copyright protected. | [optional] 
**eac3_original_bitstream** | **BOOLEAN** | Indicates whether the encoded bitstream is the master version, or a copy. | [optional] 
**title** | **String** | Human-readable name. | [optional] 
**time_code** | **BOOLEAN** | If set, timestamps will be added to your videos. By default this is not set. | [optional] 


