# tomb_contracts.api.YouTubeApi

## Load the API package
```dart
import 'package:tomb_contracts/api.dart';
```

All URIs are relative to *http://localhost:8000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**downloadYouTube**](YouTubeApi.md#downloadyoutube) | **POST** /api/youtube/download | Download audio from YouTube URL
[**getYouTubeDownloadStatus**](YouTubeApi.md#getyoutubedownloadstatus) | **GET** /api/youtube/status/{task_id} | Get YouTube download task status
[**searchYouTube**](YouTubeApi.md#searchyoutube) | **GET** /api/youtube/search | Search YouTube videos


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

# **getYouTubeDownloadStatus**
> GetYouTubeDownloadStatus200Response getYouTubeDownloadStatus(taskId)

Get YouTube download task status

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getYouTubeApi();
final String taskId = taskId_example; // String | 

try {
    final response = api.getYouTubeDownloadStatus(taskId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling YouTubeApi->getYouTubeDownloadStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **taskId** | **String**|  | 

### Return type

[**GetYouTubeDownloadStatus200Response**](GetYouTubeDownloadStatus200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchYouTube**
> SearchYouTube200Response searchYouTube(q, maxResults)

Search YouTube videos

### Example
```dart
import 'package:tomb_contracts/api.dart';

final api = TombContracts().getYouTubeApi();
final String q = q_example; // String | Search query
final int maxResults = 56; // int | Maximum number of results

try {
    final response = api.searchYouTube(q, maxResults);
    print(response);
} catch on DioException (e) {
    print('Exception when calling YouTubeApi->searchYouTube: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **q** | **String**| Search query | 
 **maxResults** | **int**| Maximum number of results | [optional] [default to 10]

### Return type

[**SearchYouTube200Response**](SearchYouTube200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

