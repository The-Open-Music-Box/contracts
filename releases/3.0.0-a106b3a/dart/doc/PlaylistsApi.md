# tomb_contracts.api.PlaylistsApi

## Load the API package
```dart
import 'package:tomb_contracts/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPlaylist**](PlaylistsApi.md#createplaylist) | **POST** /api/playlists | Create new playlist
[**deletePlaylist**](PlaylistsApi.md#deleteplaylist) | **DELETE** /api/playlists/{playlist_id} | Delete playlist
[**finalizeUpload**](PlaylistsApi.md#finalizeupload) | **POST** /api/playlists/{playlist_id}/uploads/{session_id}/finalize | Finalize upload and add track to playlist
[**getPlaylist**](PlaylistsApi.md#getplaylist) | **GET** /api/playlists/{playlist_id} | Get specific playlist
[**getUploadStatus**](PlaylistsApi.md#getuploadstatus) | **GET** /api/playlists/{playlist_id}/uploads/{session_id} | Get upload session status
[**initUploadSession**](PlaylistsApi.md#inituploadsession) | **POST** /api/playlists/{playlist_id}/uploads/session | Initialize chunked upload session
[**listPlaylists**](PlaylistsApi.md#listplaylists) | **GET** /api/playlists | List all playlists with pagination
[**moveTrack**](PlaylistsApi.md#movetrack) | **POST** /api/playlists/move-track | Move track between playlists
[**removeTracksFromPlaylist**](PlaylistsApi.md#removetracksfromplaylist) | **DELETE** /api/playlists/{playlist_id}/tracks | Remove tracks from playlist
[**reorderPlaylist**](PlaylistsApi.md#reorderplaylist) | **POST** /api/playlists/{playlist_id}/reorder | Reorder tracks in playlist
[**startPlaylist**](PlaylistsApi.md#startplaylist) | **POST** /api/playlists/{playlist_id}/start | Start playlist playback
[**syncPlaylists**](PlaylistsApi.md#syncplaylists) | **POST** /api/playlists/sync | Sync playlist state
[**updatePlaylist**](PlaylistsApi.md#updateplaylist) | **PUT** /api/playlists/{playlist_id} | Update playlist
[**uploadChunk**](PlaylistsApi.md#uploadchunk) | **PUT** /api/playlists/{playlist_id}/uploads/{session_id}/chunks/{chunk_index} | Upload a file chunk


# **createPlaylist**
> CreatePlaylist201Response createPlaylist(createPlaylistRequest)

Create new playlist

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlaylistsApi();
final CreatePlaylistRequest createPlaylistRequest = ; // CreatePlaylistRequest | 

try {
    final response = api.createPlaylist(createPlaylistRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlaylistsApi->createPlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createPlaylistRequest** | [**CreatePlaylistRequest**](CreatePlaylistRequest.md)|  | 

### Return type

[**CreatePlaylist201Response**](CreatePlaylist201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePlaylist**
> deletePlaylist(playlistId, playerPlayRequest)

Delete playlist

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlaylistsApi();
final String playlistId = playlistId_example; // String | 
final PlayerPlayRequest playerPlayRequest = ; // PlayerPlayRequest | 

try {
    api.deletePlaylist(playlistId, playerPlayRequest);
} catch on DioException (e) {
    print('Exception when calling PlaylistsApi->deletePlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 
 **playerPlayRequest** | [**PlayerPlayRequest**](PlayerPlayRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **finalizeUpload**
> FinalizeUpload200Response finalizeUpload(playlistId, sessionId, finalizeUploadRequest)

Finalize upload and add track to playlist

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlaylistsApi();
final String playlistId = playlistId_example; // String | 
final String sessionId = sessionId_example; // String | 
final FinalizeUploadRequest finalizeUploadRequest = ; // FinalizeUploadRequest | 

try {
    final response = api.finalizeUpload(playlistId, sessionId, finalizeUploadRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlaylistsApi->finalizeUpload: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 
 **sessionId** | **String**|  | 
 **finalizeUploadRequest** | [**FinalizeUploadRequest**](FinalizeUploadRequest.md)|  | [optional] 

### Return type

[**FinalizeUpload200Response**](FinalizeUpload200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlaylist**
> CreatePlaylist201Response getPlaylist(playlistId)

Get specific playlist

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlaylistsApi();
final String playlistId = playlistId_example; // String | 

try {
    final response = api.getPlaylist(playlistId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlaylistsApi->getPlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 

### Return type

[**CreatePlaylist201Response**](CreatePlaylist201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUploadStatus**
> GetUploadStatus200Response getUploadStatus(playlistId, sessionId)

Get upload session status

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlaylistsApi();
final String playlistId = playlistId_example; // String | 
final String sessionId = sessionId_example; // String | 

try {
    final response = api.getUploadStatus(playlistId, sessionId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlaylistsApi->getUploadStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 
 **sessionId** | **String**|  | 

### Return type

[**GetUploadStatus200Response**](GetUploadStatus200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **initUploadSession**
> InitUploadSession201Response initUploadSession(playlistId, initUploadSessionRequest)

Initialize chunked upload session

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlaylistsApi();
final String playlistId = playlistId_example; // String | 
final InitUploadSessionRequest initUploadSessionRequest = ; // InitUploadSessionRequest | 

try {
    final response = api.initUploadSession(playlistId, initUploadSessionRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlaylistsApi->initUploadSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 
 **initUploadSessionRequest** | [**InitUploadSessionRequest**](InitUploadSessionRequest.md)|  | 

### Return type

[**InitUploadSession201Response**](InitUploadSession201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPlaylists**
> ListPlaylists200Response listPlaylists(page, limit)

List all playlists with pagination

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlaylistsApi();
final int page = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.listPlaylists(page, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlaylistsApi->listPlaylists: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **limit** | **int**|  | [optional] [default to 50]

### Return type

[**ListPlaylists200Response**](ListPlaylists200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **moveTrack**
> UnifiedResponse moveTrack(moveTrackRequest)

Move track between playlists

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlaylistsApi();
final MoveTrackRequest moveTrackRequest = ; // MoveTrackRequest | 

try {
    final response = api.moveTrack(moveTrackRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlaylistsApi->moveTrack: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **moveTrackRequest** | [**MoveTrackRequest**](MoveTrackRequest.md)|  | 

### Return type

[**UnifiedResponse**](UnifiedResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeTracksFromPlaylist**
> UnifiedResponse removeTracksFromPlaylist(playlistId, removeTracksFromPlaylistRequest)

Remove tracks from playlist

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlaylistsApi();
final String playlistId = playlistId_example; // String | 
final RemoveTracksFromPlaylistRequest removeTracksFromPlaylistRequest = ; // RemoveTracksFromPlaylistRequest | 

try {
    final response = api.removeTracksFromPlaylist(playlistId, removeTracksFromPlaylistRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlaylistsApi->removeTracksFromPlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 
 **removeTracksFromPlaylistRequest** | [**RemoveTracksFromPlaylistRequest**](RemoveTracksFromPlaylistRequest.md)|  | 

### Return type

[**UnifiedResponse**](UnifiedResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reorderPlaylist**
> UnifiedResponse reorderPlaylist(playlistId, reorderPlaylistRequest)

Reorder tracks in playlist

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlaylistsApi();
final String playlistId = playlistId_example; // String | 
final ReorderPlaylistRequest reorderPlaylistRequest = ; // ReorderPlaylistRequest | 

try {
    final response = api.reorderPlaylist(playlistId, reorderPlaylistRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlaylistsApi->reorderPlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 
 **reorderPlaylistRequest** | [**ReorderPlaylistRequest**](ReorderPlaylistRequest.md)|  | 

### Return type

[**UnifiedResponse**](UnifiedResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startPlaylist**
> StartPlaylist200Response startPlaylist(playlistId, playerPlayRequest)

Start playlist playback

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlaylistsApi();
final String playlistId = playlistId_example; // String | 
final PlayerPlayRequest playerPlayRequest = ; // PlayerPlayRequest | 

try {
    final response = api.startPlaylist(playlistId, playerPlayRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlaylistsApi->startPlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 
 **playerPlayRequest** | [**PlayerPlayRequest**](PlayerPlayRequest.md)|  | [optional] 

### Return type

[**StartPlaylist200Response**](StartPlaylist200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncPlaylists**
> SyncPlaylists200Response syncPlaylists(syncPlaylistsRequest)

Sync playlist state

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlaylistsApi();
final SyncPlaylistsRequest syncPlaylistsRequest = ; // SyncPlaylistsRequest | 

try {
    final response = api.syncPlaylists(syncPlaylistsRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlaylistsApi->syncPlaylists: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **syncPlaylistsRequest** | [**SyncPlaylistsRequest**](SyncPlaylistsRequest.md)|  | [optional] 

### Return type

[**SyncPlaylists200Response**](SyncPlaylists200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePlaylist**
> UpdatePlaylist200Response updatePlaylist(playlistId, updatePlaylistRequest)

Update playlist

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlaylistsApi();
final String playlistId = playlistId_example; // String | 
final UpdatePlaylistRequest updatePlaylistRequest = ; // UpdatePlaylistRequest | 

try {
    final response = api.updatePlaylist(playlistId, updatePlaylistRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlaylistsApi->updatePlaylist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 
 **updatePlaylistRequest** | [**UpdatePlaylistRequest**](UpdatePlaylistRequest.md)|  | [optional] 

### Return type

[**UpdatePlaylist200Response**](UpdatePlaylist200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadChunk**
> UploadChunk200Response uploadChunk(playlistId, sessionId, chunkIndex, body)

Upload a file chunk

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlaylistsApi();
final String playlistId = playlistId_example; // String | 
final String sessionId = sessionId_example; // String | 
final int chunkIndex = 56; // int | 
final MultipartFile body = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.uploadChunk(playlistId, sessionId, chunkIndex, body);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlaylistsApi->uploadChunk: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playlistId** | **String**|  | 
 **sessionId** | **String**|  | 
 **chunkIndex** | **int**|  | 
 **body** | **MultipartFile**|  | 

### Return type

[**UploadChunk200Response**](UploadChunk200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/octet-stream
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

