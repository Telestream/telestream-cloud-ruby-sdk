# Telestream Cloud Flip Ruby SDK

This library provides a low-level interface to the REST API of Telestream Cloud, the online video encoding service.

## Getting Started
### Initialize client

```ruby
require 'telestream_cloud/flip'

TelestreamCloud::Flip.configure do |config|
  config.api_key['X-Api-Key'] = '[API KEY]'
end

client = TelestreamCloud::Flip::FlipApi.new
```

### Upload video to Flip service

```ruby
factory_id = '...'
uploader = TelestreamCloud::Flip::Uploader.new(
  client,
  factory_id: factory_id,
  file: '/path/to/file.mp4',
  extra_files: {
    subtitles: '/path/to/subtitles'
  }
)

video_id = uploader.upload
```

### Create video from source URL
```ruby
factory_id = '...'
client.create_video(factory_id, source_url: 'http://url/to/file.mp4')
```

## Documentation for API Endpoints

All URIs are relative to *https://api.cloud.telestream.net/flip/3.1*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*TelestreamCloud::Flip::FlipApi* | [**cancel_encoding**](docs/FlipApi.md#cancel_encoding) | **POST** /encodings/{id}/cancel.json | Cancels an Encoding.
*TelestreamCloud::Flip::FlipApi* | [**copy_profile**](docs/FlipApi.md#copy_profile) | **POST** /profiles/{id}/copy.json | Copies a given Profile
*TelestreamCloud::Flip::FlipApi* | [**create_encoding**](docs/FlipApi.md#create_encoding) | **POST** /encodings.json | Creates an Encoding
*TelestreamCloud::Flip::FlipApi* | [**create_factory**](docs/FlipApi.md#create_factory) | **POST** /factories.json | Creates a new factory
*TelestreamCloud::Flip::FlipApi* | [**create_profile**](docs/FlipApi.md#create_profile) | **POST** /profiles.json | Creates a Profile
*TelestreamCloud::Flip::FlipApi* | [**create_video**](docs/FlipApi.md#create_video) | **POST** /videos.json | Creates a Video from a provided source_url.
*TelestreamCloud::Flip::FlipApi* | [**create_workorder**](docs/FlipApi.md#create_workorder) | **POST** /workorders.json | Creates a Workorder.
*TelestreamCloud::Flip::FlipApi* | [**delete_encoding**](docs/FlipApi.md#delete_encoding) | **DELETE** /encodings/{id}.json | Deletes an Encoding from both Telestream Cloud and your storage. Returns an information whether the operation was successful.
*TelestreamCloud::Flip::FlipApi* | [**delete_profile**](docs/FlipApi.md#delete_profile) | **DELETE** /profiles/{id}.json | Deletes a given Profile
*TelestreamCloud::Flip::FlipApi* | [**delete_video**](docs/FlipApi.md#delete_video) | **DELETE** /videos/{id}.json | Deletes a Video object.
*TelestreamCloud::Flip::FlipApi* | [**delete_video_source**](docs/FlipApi.md#delete_video_source) | **DELETE** /videos/{id}/source.json | Delete a video's source file.
*TelestreamCloud::Flip::FlipApi* | [**encoding**](docs/FlipApi.md#encoding) | **GET** /encodings/{id}.json | Returns an Encoding object.
*TelestreamCloud::Flip::FlipApi* | [**encodings**](docs/FlipApi.md#encodings) | **GET** /encodings.json | Returns a list of Encoding objects
*TelestreamCloud::Flip::FlipApi* | [**encodings_count**](docs/FlipApi.md#encodings_count) | **GET** /encodings/count.json | Returns a number of Encoding objects created using a given factory.
*TelestreamCloud::Flip::FlipApi* | [**factories**](docs/FlipApi.md#factories) | **GET** /factories.json | Returns a collection of Factory objects.
*TelestreamCloud::Flip::FlipApi* | [**factory**](docs/FlipApi.md#factory) | **GET** /factories/{id}.json | Returns a Factory object.
*TelestreamCloud::Flip::FlipApi* | [**notifications**](docs/FlipApi.md#notifications) | **GET** /notifications.json | Returns a Factory's notification settings.
*TelestreamCloud::Flip::FlipApi* | [**profile**](docs/FlipApi.md#profile) | **GET** /profiles/{id_or_name}.json | Returns a Profile object.
*TelestreamCloud::Flip::FlipApi* | [**profile_encodings**](docs/FlipApi.md#profile_encodings) | **GET** /profiles/{id_or_name}/encodings.json | Returns a list of Encodings that belong to a Profile.
*TelestreamCloud::Flip::FlipApi* | [**profiles**](docs/FlipApi.md#profiles) | **GET** /profiles.json | Returns a collection of Profile objects.
*TelestreamCloud::Flip::FlipApi* | [**queued_videos**](docs/FlipApi.md#queued_videos) | **GET** /videos/queued.json | Returns a collection of Video objects queued for encoding.
*TelestreamCloud::Flip::FlipApi* | [**resubmit_video**](docs/FlipApi.md#resubmit_video) | **POST** /videos/resubmit.json | Resubmits a video to encode.
*TelestreamCloud::Flip::FlipApi* | [**retry_encoding**](docs/FlipApi.md#retry_encoding) | **POST** /encodings/{id}/retry.json | Retries a failed encoding.
*TelestreamCloud::Flip::FlipApi* | [**signed_encoding_url**](docs/FlipApi.md#signed_encoding_url) | **GET** /encodings/{id}/signed-url.json | Returns a signed url pointing to an Encoding.
*TelestreamCloud::Flip::FlipApi* | [**signed_encoding_urls**](docs/FlipApi.md#signed_encoding_urls) | **GET** /encodings/{id}/signed-urls.json | Returns a list of signed urls pointing to an Encoding's outputs.
*TelestreamCloud::Flip::FlipApi* | [**signed_video_url**](docs/FlipApi.md#signed_video_url) | **GET** /videos/{id}/signed-url.json | Returns a signed url pointing to a Video.
*TelestreamCloud::Flip::FlipApi* | [**toggle_factory_sync**](docs/FlipApi.md#toggle_factory_sync) | **POST** /factories/{id}/sync.json | Toggles synchronisation settings.
*TelestreamCloud::Flip::FlipApi* | [**update_encoding**](docs/FlipApi.md#update_encoding) | **PUT** /encodings/{id}.json | Updates an Encoding
*TelestreamCloud::Flip::FlipApi* | [**update_factory**](docs/FlipApi.md#update_factory) | **PATCH** /factories/{id}.json | Updates a Factory's settings. Returns a Factory object.
*TelestreamCloud::Flip::FlipApi* | [**update_notifications**](docs/FlipApi.md#update_notifications) | **PUT** /notifications.json | Updates a Factory's notification settings.
*TelestreamCloud::Flip::FlipApi* | [**update_profile**](docs/FlipApi.md#update_profile) | **PUT** /profiles/{id}.json | Updates a given Profile
*TelestreamCloud::Flip::FlipApi* | [**upload_video**](docs/FlipApi.md#upload_video) | **POST** /videos/upload.json | Creates an upload session.
*TelestreamCloud::Flip::FlipApi* | [**video**](docs/FlipApi.md#video) | **GET** /videos/{id}.json | Returns a Video object.
*TelestreamCloud::Flip::FlipApi* | [**video_encodings**](docs/FlipApi.md#video_encodings) | **GET** /videos/{id}/encodings.json | Returns a list of Encodings that belong to a Video.
*TelestreamCloud::Flip::FlipApi* | [**video_metadata**](docs/FlipApi.md#video_metadata) | **GET** /videos/{id}/metadata.json | Returns a Video's metadata
*TelestreamCloud::Flip::FlipApi* | [**videos**](docs/FlipApi.md#videos) | **GET** /videos.json | Returns a collection of Video objects.
*TelestreamCloud::Flip::FlipApi* | [**workflows**](docs/FlipApi.md#workflows) | **GET** /workflows.json | Returns a collection of Workflows that belong to a Factory.


## Documentation for Models

 - [TelestreamCloud::Flip::CanceledResponse](docs/CanceledResponse.md)
 - [TelestreamCloud::Flip::CloudNotificationSettings](docs/CloudNotificationSettings.md)
 - [TelestreamCloud::Flip::CloudNotificationSettingsEvents](docs/CloudNotificationSettingsEvents.md)
 - [TelestreamCloud::Flip::CopyProfileBody](docs/CopyProfileBody.md)
 - [TelestreamCloud::Flip::CountResponse](docs/CountResponse.md)
 - [TelestreamCloud::Flip::CreateEncodingBody](docs/CreateEncodingBody.md)
 - [TelestreamCloud::Flip::CreateVideoBody](docs/CreateVideoBody.md)
 - [TelestreamCloud::Flip::DeletedResponse](docs/DeletedResponse.md)
 - [TelestreamCloud::Flip::Encoding](docs/Encoding.md)
 - [TelestreamCloud::Flip::EncodingSignedUrl](docs/EncodingSignedUrl.md)
 - [TelestreamCloud::Flip::EncodingSignedUrls](docs/EncodingSignedUrls.md)
 - [TelestreamCloud::Flip::Error](docs/Error.md)
 - [TelestreamCloud::Flip::ExtraFile](docs/ExtraFile.md)
 - [TelestreamCloud::Flip::Factory](docs/Factory.md)
 - [TelestreamCloud::Flip::FactoryBody](docs/FactoryBody.md)
 - [TelestreamCloud::Flip::FactoryBodyStorageCredentialAttributes](docs/FactoryBodyStorageCredentialAttributes.md)
 - [TelestreamCloud::Flip::FactorySync](docs/FactorySync.md)
 - [TelestreamCloud::Flip::FactorySyncBody](docs/FactorySyncBody.md)
 - [TelestreamCloud::Flip::PaginatedEncodingsCollection](docs/PaginatedEncodingsCollection.md)
 - [TelestreamCloud::Flip::PaginatedFactoryCollection](docs/PaginatedFactoryCollection.md)
 - [TelestreamCloud::Flip::PaginatedProfilesCollection](docs/PaginatedProfilesCollection.md)
 - [TelestreamCloud::Flip::PaginatedVideoCollection](docs/PaginatedVideoCollection.md)
 - [TelestreamCloud::Flip::PaginatedWorkflowsCollection](docs/PaginatedWorkflowsCollection.md)
 - [TelestreamCloud::Flip::Profile](docs/Profile.md)
 - [TelestreamCloud::Flip::ProfileBody](docs/ProfileBody.md)
 - [TelestreamCloud::Flip::ResubmitVideoBody](docs/ResubmitVideoBody.md)
 - [TelestreamCloud::Flip::RetriedResponse](docs/RetriedResponse.md)
 - [TelestreamCloud::Flip::SignedVideoUrl](docs/SignedVideoUrl.md)
 - [TelestreamCloud::Flip::UpdateEncodingBody](docs/UpdateEncodingBody.md)
 - [TelestreamCloud::Flip::UploadSession](docs/UploadSession.md)
 - [TelestreamCloud::Flip::Video](docs/Video.md)
 - [TelestreamCloud::Flip::VideoMetadata](docs/VideoMetadata.md)
 - [TelestreamCloud::Flip::VideoUploadBody](docs/VideoUploadBody.md)


## Documentation for Authorization


### api_key

- **Type**: API key
- **API key parameter name**: X-Api-Key
- **Location**: HTTP header

