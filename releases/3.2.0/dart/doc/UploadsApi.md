# tomb_contracts.api.UploadsApi

## Load the API package
```dart
import 'package:tomb_contracts/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cleanupStaleSessions**](UploadsApi.md#cleanupstalesessions) | **POST** /api/uploads/cleanup | Cleanup stale upload sessions
[**deleteUploadSession**](UploadsApi.md#deleteuploadsession) | **DELETE** /api/uploads/sessions/{session_id} | Delete upload session
[**finalizeUpload**](UploadsApi.md#finalizeupload) | **POST** /api/playlists/{playlist_id}/uploads/{session_id}/finalize | Finalize upload and add track to playlist
[**getUploadStatus**](UploadsApi.md#getuploadstatus) | **GET** /api/playlists/{playlist_id}/uploads/{session_id} | Get upload session status
[**initUploadSession**](UploadsApi.md#inituploadsession) | **POST** /api/playlists/{playlist_id}/uploads/session | Initialize chunked upload session
[**listUploadSessions**](UploadsApi.md#listuploadsessions) | **GET** /api/uploads/sessions | List all upload sessions
[**uploadChunk**](UploadsApi.md#uploadchunk) | **PUT** /api/playlists/{playlist_id}/uploads/{session_id}/chunks/{chunk_index} | Upload a file chunk


# **cleanupStaleSessions**
> CleanupStaleSessions200Response cleanupStaleSessions(maxAgeHours)

Cleanup stale upload sessions

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getUploadsApi();
final int maxAgeHours = 56; // int | Maximum age in hours for cleanup

try {
    final response = api.cleanupStaleSessions(maxAgeHours);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UploadsApi->cleanupStaleSessions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **maxAgeHours** | **int**| Maximum age in hours for cleanup | [optional] [default to 24]

### Return type

[**CleanupStaleSessions200Response**](CleanupStaleSessions200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteUploadSession**
> UnifiedResponse deleteUploadSession(sessionId)

Delete upload session

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getUploadsApi();
final String sessionId = sessionId_example; // String | 

try {
    final response = api.deleteUploadSession(sessionId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UploadsApi->deleteUploadSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**|  | 

### Return type

[**UnifiedResponse**](UnifiedResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **finalizeUpload**
> FinalizeUpload200Response finalizeUpload(playlistId, sessionId, finalizeUploadRequest)

Finalize upload and add track to playlist

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getUploadsApi();
final String playlistId = playlistId_example; // String | 
final String sessionId = sessionId_example; // String | 
final FinalizeUploadRequest finalizeUploadRequest = ; // FinalizeUploadRequest | 

try {
    final response = api.finalizeUpload(playlistId, sessionId, finalizeUploadRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UploadsApi->finalizeUpload: $e\n');
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

# **getUploadStatus**
> GetUploadStatus200Response getUploadStatus(playlistId, sessionId)

Get upload session status

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getUploadsApi();
final String playlistId = playlistId_example; // String | 
final String sessionId = sessionId_example; // String | 

try {
    final response = api.getUploadStatus(playlistId, sessionId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UploadsApi->getUploadStatus: $e\n');
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

final api = TombContracts().getUploadsApi();
final String playlistId = playlistId_example; // String | 
final InitUploadSessionRequest initUploadSessionRequest = ; // InitUploadSessionRequest | 

try {
    final response = api.initUploadSession(playlistId, initUploadSessionRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UploadsApi->initUploadSession: $e\n');
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

# **listUploadSessions**
> ListUploadSessions200Response listUploadSessions(status, limit)

List all upload sessions

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getUploadsApi();
final String status = status_example; // String | Filter by upload status
final int limit = 56; // int | Maximum sessions to return

try {
    final response = api.listUploadSessions(status, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UploadsApi->listUploadSessions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | **String**| Filter by upload status | [optional] 
 **limit** | **int**| Maximum sessions to return | [optional] [default to 50]

### Return type

[**ListUploadSessions200Response**](ListUploadSessions200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadChunk**
> UploadChunk200Response uploadChunk(playlistId, sessionId, chunkIndex, body)

Upload a file chunk

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getUploadsApi();
final String playlistId = playlistId_example; // String | 
final String sessionId = sessionId_example; // String | 
final int chunkIndex = 56; // int | 
final MultipartFile body = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.uploadChunk(playlistId, sessionId, chunkIndex, body);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UploadsApi->uploadChunk: $e\n');
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

