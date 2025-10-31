import 'package:test/test.dart';
import 'package:tomb_contracts/tomb_contracts.dart';


/// tests for YouTubeApi
void main() {
  final instance = TombContracts().getYouTubeApi();

  group(YouTubeApi, () {
    // Download audio from YouTube URL
    //
    //Future<DownloadYouTube200Response> downloadYouTube(DownloadYouTubeRequest downloadYouTubeRequest) async
    test('test downloadYouTube', () async {
      // TODO
    });

    // Get YouTube download task status
    //
    //Future<GetYouTubeDownloadStatus200Response> getYouTubeDownloadStatus(String taskId) async
    test('test getYouTubeDownloadStatus', () async {
      // TODO
    });

    // Search YouTube videos
    //
    //Future<SearchYouTube200Response> searchYouTube(String q, { int maxResults }) async
    test('test searchYouTube', () async {
      // TODO
    });

  });
}
