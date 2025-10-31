# tomb_contracts.model.Track

## Load the model package
```dart
import 'package:tomb_contracts/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**number** | **int** | Track number in playlist | 
**title** | **String** |  | 
**filename** | **String** |  | 
**filePath** | **String** |  | [optional] 
**duration** | **int** | DEPRECATED: Use duration_ms instead for millisecond precision. Duration in seconds. Will be removed in v4.0.0.  | [optional] 
**durationMs** | **int** | Duration in milliseconds (preferred over duration) | [optional] 
**artist** | **String** |  | [optional] 
**album** | **String** |  | [optional] 
**fileSize** | **int** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) |  | [optional] 
**updatedAt** | [**DateTime**](DateTime.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


