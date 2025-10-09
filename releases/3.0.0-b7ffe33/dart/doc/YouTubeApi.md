# tomb_contracts.api.YouTubeApi

## Load the API package
```dart
import 'package:tomb_contracts/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**downloadYouTube**](YouTubeApi.md#downloadyoutube) | **POST** /api/youtube/download | Download audio from YouTube URL


# **downloadYouTube**
> DownloadYouTube200Response downloadYouTube(downloadYouTubeRequest)

Download audio from YouTube URL

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getYouTubeApi();
final DownloadYouTubeRequest downloadYouTubeRequest = ; // DownloadYouTubeRequest | 

try {
    final response = api.downloadYouTube(downloadYouTubeRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling YouTubeApi->downloadYouTube: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **downloadYouTubeRequest** | [**DownloadYouTubeRequest**](DownloadYouTubeRequest.md)|  | 

### Return type

[**DownloadYouTube200Response**](DownloadYouTube200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

