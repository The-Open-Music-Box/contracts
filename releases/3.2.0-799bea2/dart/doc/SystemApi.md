# tomb_contracts.api.SystemApi

## Load the API package
```dart
import 'package:tomb_contracts/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getSystemInfo**](SystemApi.md#getsysteminfo) | **GET** /api/system/info | Get system information
[**getSystemLogs**](SystemApi.md#getsystemlogs) | **GET** /api/system/logs | Get system logs
[**restartSystem**](SystemApi.md#restartsystem) | **POST** /api/system/restart | Restart the system


# **getSystemInfo**
> GetSystemInfo200Response getSystemInfo()

Get system information

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getSystemApi();

try {
    final response = api.getSystemInfo();
    print(response);
} catch on DioException (e) {
    print('Exception when calling SystemApi->getSystemInfo: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetSystemInfo200Response**](GetSystemInfo200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSystemLogs**
> GetSystemLogs200Response getSystemLogs(lines, level)

Get system logs

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getSystemApi();
final int lines = 56; // int | Number of log lines to return
final String level = level_example; // String | Filter by log level

try {
    final response = api.getSystemLogs(lines, level);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SystemApi->getSystemLogs: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lines** | **int**| Number of log lines to return | [optional] [default to 100]
 **level** | **String**| Filter by log level | [optional] 

### Return type

[**GetSystemLogs200Response**](GetSystemLogs200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **restartSystem**
> RestartSystem200Response restartSystem(playerPlayRequest)

Restart the system

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getSystemApi();
final PlayerPlayRequest playerPlayRequest = ; // PlayerPlayRequest | 

try {
    final response = api.restartSystem(playerPlayRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SystemApi->restartSystem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerPlayRequest** | [**PlayerPlayRequest**](PlayerPlayRequest.md)|  | [optional] 

### Return type

[**RestartSystem200Response**](RestartSystem200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

