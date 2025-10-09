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
[**getPlaylist**](PlaylistsApi.md#getplaylist) | **GET** /api/playlists/{playlist_id} | Get specific playlist
[**listPlaylists**](PlaylistsApi.md#listplaylists) | **GET** /api/playlists | List all playlists with pagination
[**startPlaylist**](PlaylistsApi.md#startplaylist) | **POST** /api/playlists/{playlist_id}/start | Start playlist playback
[**updatePlaylist**](PlaylistsApi.md#updateplaylist) | **PUT** /api/playlists/{playlist_id} | Update playlist


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

