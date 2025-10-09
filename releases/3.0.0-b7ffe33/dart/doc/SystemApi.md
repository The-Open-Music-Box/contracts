# tomb_contracts.api.SystemApi

## Load the API package
```dart
import 'package:tomb_contracts/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getSystemInfo**](SystemApi.md#getsysteminfo) | **GET** /api/system/info | Get system information


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

