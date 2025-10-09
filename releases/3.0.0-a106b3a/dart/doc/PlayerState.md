# tomb_contracts.model.PlayerState

## Load the model package
```dart
import 'package:tomb_contracts/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**isPlaying** | **bool** |  | 
**activePlaylistId** | **String** |  | [optional] 
**activePlaylistTitle** | **String** |  | [optional] 
**activeTrackId** | **String** |  | [optional] 
**activeTrack** | [**Track**](Track.md) |  | [optional] 
**trackIndex** | **int** | 0-based track index in playlist | [optional] 
**trackCount** | **int** | Total number of tracks in playlist | [optional] 
**positionMs** | **int** | Current playback position in milliseconds | 
**durationMs** | **int** | Track duration in milliseconds | [optional] 
**canPrev** | **bool** |  | 
**canNext** | **bool** |  | 
**volume** | **int** |  | [optional] 
**serverSeq** | **num** |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


