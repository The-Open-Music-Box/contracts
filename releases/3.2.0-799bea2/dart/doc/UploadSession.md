# tomb_contracts.model.UploadSession

## Load the model package
```dart
import 'package:tomb_contracts/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** |  | 
**playlistId** | **String** |  | 
**filename** | **String** |  | 
**fileSize** | **int** | Total file size in bytes | 
**chunkSize** | **int** | Size of each chunk in bytes | 
**totalChunks** | **int** | Total number of chunks | 
**fileHash** | **String** | Optional file hash for verification | [optional] 
**createdAt** | [**DateTime**](DateTime.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


