# tomb_contracts.api.HealthApi

## Load the API package
```dart
import 'package:tomb_contracts/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getHealth**](HealthApi.md#gethealth) | **GET** /api/health | Health check endpoint


# **getHealth**
> GetHealth200Response getHealth()

Health check endpoint

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getHealthApi();

try {
    final response = api.getHealth();
    print(response);
} catch on DioException (e) {
    print('Exception when calling HealthApi->getHealth: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetHealth200Response**](GetHealth200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

