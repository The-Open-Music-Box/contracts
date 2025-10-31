# tomb_contracts.api.PlayerApi

## Load the API package
```dart
import 'package:tomb_contracts/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getPlayerStatus**](PlayerApi.md#getplayerstatus) | **GET** /api/player/status | Get current player status
[**playerNext**](PlayerApi.md#playernext) | **POST** /api/player/next | Skip to next track
[**playerPause**](PlayerApi.md#playerpause) | **POST** /api/player/pause | Pause playback
[**playerPlay**](PlayerApi.md#playerplay) | **POST** /api/player/play | Start/resume playback
[**playerPrevious**](PlayerApi.md#playerprevious) | **POST** /api/player/previous | Skip to previous track
[**playerSeek**](PlayerApi.md#playerseek) | **POST** /api/player/seek | Seek to position in current track
[**playerStop**](PlayerApi.md#playerstop) | **POST** /api/player/stop | Stop playback
[**playerToggle**](PlayerApi.md#playertoggle) | **POST** /api/player/toggle | Toggle play/pause
[**setVolume**](PlayerApi.md#setvolume) | **POST** /api/player/volume | Set volume level


# **getPlayerStatus**
> PlayerPlay200Response getPlayerStatus()

Get current player status

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlayerApi();

try {
    final response = api.getPlayerStatus();
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlayerApi->getPlayerStatus: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**PlayerPlay200Response**](PlayerPlay200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **playerNext**
> PlayerPlay200Response playerNext(playerPlayRequest)

Skip to next track

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlayerApi();
final PlayerPlayRequest playerPlayRequest = ; // PlayerPlayRequest | 

try {
    final response = api.playerNext(playerPlayRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlayerApi->playerNext: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerPlayRequest** | [**PlayerPlayRequest**](PlayerPlayRequest.md)|  | [optional] 

### Return type

[**PlayerPlay200Response**](PlayerPlay200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **playerPause**
> PlayerPlay200Response playerPause(playerPlayRequest)

Pause playback

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlayerApi();
final PlayerPlayRequest playerPlayRequest = ; // PlayerPlayRequest | 

try {
    final response = api.playerPause(playerPlayRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlayerApi->playerPause: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerPlayRequest** | [**PlayerPlayRequest**](PlayerPlayRequest.md)|  | [optional] 

### Return type

[**PlayerPlay200Response**](PlayerPlay200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **playerPlay**
> PlayerPlay200Response playerPlay(playerPlayRequest)

Start/resume playback

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlayerApi();
final PlayerPlayRequest playerPlayRequest = ; // PlayerPlayRequest | 

try {
    final response = api.playerPlay(playerPlayRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlayerApi->playerPlay: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerPlayRequest** | [**PlayerPlayRequest**](PlayerPlayRequest.md)|  | [optional] 

### Return type

[**PlayerPlay200Response**](PlayerPlay200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **playerPrevious**
> PlayerPlay200Response playerPrevious(playerPlayRequest)

Skip to previous track

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlayerApi();
final PlayerPlayRequest playerPlayRequest = ; // PlayerPlayRequest | 

try {
    final response = api.playerPrevious(playerPlayRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlayerApi->playerPrevious: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerPlayRequest** | [**PlayerPlayRequest**](PlayerPlayRequest.md)|  | [optional] 

### Return type

[**PlayerPlay200Response**](PlayerPlay200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **playerSeek**
> PlayerPlay200Response playerSeek(playerSeekRequest)

Seek to position in current track

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlayerApi();
final PlayerSeekRequest playerSeekRequest = ; // PlayerSeekRequest | 

try {
    final response = api.playerSeek(playerSeekRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlayerApi->playerSeek: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerSeekRequest** | [**PlayerSeekRequest**](PlayerSeekRequest.md)|  | 

### Return type

[**PlayerPlay200Response**](PlayerPlay200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **playerStop**
> PlayerPlay200Response playerStop(playerPlayRequest)

Stop playback

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlayerApi();
final PlayerPlayRequest playerPlayRequest = ; // PlayerPlayRequest | 

try {
    final response = api.playerStop(playerPlayRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlayerApi->playerStop: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerPlayRequest** | [**PlayerPlayRequest**](PlayerPlayRequest.md)|  | [optional] 

### Return type

[**PlayerPlay200Response**](PlayerPlay200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **playerToggle**
> PlayerPlay200Response playerToggle(playerPlayRequest)

Toggle play/pause

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlayerApi();
final PlayerPlayRequest playerPlayRequest = ; // PlayerPlayRequest | 

try {
    final response = api.playerToggle(playerPlayRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlayerApi->playerToggle: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerPlayRequest** | [**PlayerPlayRequest**](PlayerPlayRequest.md)|  | [optional] 

### Return type

[**PlayerPlay200Response**](PlayerPlay200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setVolume**
> SetVolume200Response setVolume(setVolumeRequest)

Set volume level

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getPlayerApi();
final SetVolumeRequest setVolumeRequest = ; // SetVolumeRequest | 

try {
    final response = api.setVolume(setVolumeRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PlayerApi->setVolume: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setVolumeRequest** | [**SetVolumeRequest**](SetVolumeRequest.md)|  | 

### Return type

[**SetVolume200Response**](SetVolume200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

