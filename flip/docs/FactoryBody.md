# TelestreamCloud::Flip::FactoryBody

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**aws_access_key** | **String** | AWS access key. | [optional] 
**aws_secret_key** | **String** | AWS secret key. | [optional] 
**factory_region** | **String** | A region where the factory is located. | [optional] 
**input_bucket_file_pattern** | **String** | A pattern that will be used to locate files in the input bucket. Valid wildcards might be used. | [optional] 
**input_bucket_name** | **String** | A name of an input bucket. | [optional] 
**input_bucket_recursive** | **BOOLEAN** |  | [optional] 
**input_bucket_sync_every_n_min** | **Integer** | Determines how often the input bucket is synchronised. | [optional] 
**input_bucket_watch** | **BOOLEAN** | Determines whether the Factory should be notified about new files added to the input bucket. | [optional] 
**name** | **String** | Name of the Factory. | 
**outputs_path_format** | **String** | Specify the directory where the output files should be stored. By default it is not set. More info [here](https://cloud.telestream.net/docs#path-format---know-how). | [optional] 
**provider_specific_settings** | **Object** |  | [optional] 
**acl** | **String** | Specify if your files are public or private (private files need authorization url to access). By default this is not set. | [optional] 
**output_bucket_name** | **String** | A bucket where processed files will be stored. | [optional] 
**server_side_encryption** | **BOOLEAN** | Specify if you want to use multi-factor server-side 256-bit AES-256 data encryption with Amazon S3-managed encryption keys (SSE-S3). Each object is encrypted using a unique key which as an additional safeguard is encrypted itself with a master key that S3 regularly rotates. By default this is not set. | [optional] 
**storage_credential_attributes** | [**FactoryBodyStorageCredentialAttributes**](FactoryBodyStorageCredentialAttributes.md) |  | [optional] 
**storage_provider** | **Integer** | Specifies which storage provider the factory should use. Available options: S3: 0, Google Cloud Storage: 1, FTP storage: 2, Google Cloud Interoperability Storage: 5, Flip storage: 7, FASP storage: 8, Azure Blob Storage: 9 | [optional] 


