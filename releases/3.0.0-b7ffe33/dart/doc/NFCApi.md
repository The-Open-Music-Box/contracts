# tomb_contracts.api.NFCApi

## Load the API package
```dart
import 'package:tomb_contracts/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**associateNFC**](NFCApi.md#associatenfc) | **POST** /api/nfc/associate | Associate NFC tag with playlist
[**getNFCStatus**](NFCApi.md#getnfcstatus) | **GET** /api/nfc/status | Get NFC reader status
[**removeNFCAssociation**](NFCApi.md#removenfcassociation) | **DELETE** /api/nfc/associate/{tag_id} | Remove NFC tag association


# **associateNFC**
> AssociateNFC200Response associateNFC(associateNFCRequest)

Associate NFC tag with playlist

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getNFCApi();
final AssociateNFCRequest associateNFCRequest = ; // AssociateNFCRequest | 

try {
    final response = api.associateNFC(associateNFCRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NFCApi->associateNFC: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **associateNFCRequest** | [**AssociateNFCRequest**](AssociateNFCRequest.md)|  | 

### Return type

[**AssociateNFC200Response**](AssociateNFC200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNFCStatus**
> GetNFCStatus200Response getNFCStatus()

Get NFC reader status

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getNFCApi();

try {
    final response = api.getNFCStatus();
    print(response);
} catch on DioException (e) {
    print('Exception when calling NFCApi->getNFCStatus: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetNFCStatus200Response**](GetNFCStatus200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeNFCAssociation**
> UnifiedResponse removeNFCAssociation(tagId, playerPlayRequest)

Remove NFC tag association

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getNFCApi();
final String tagId = tagId_example; // String | 
final PlayerPlayRequest playerPlayRequest = ; // PlayerPlayRequest | 

try {
    final response = api.removeNFCAssociation(tagId, playerPlayRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NFCApi->removeNFCAssociation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tagId** | **String**|  | 
 **playerPlayRequest** | [**PlayerPlayRequest**](PlayerPlayRequest.md)|  | [optional] 

### Return type

[**UnifiedResponse**](UnifiedResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

