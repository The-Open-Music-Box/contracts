import 'package:test/test.dart';
import 'package:tomb_contracts/tomb_contracts.dart';


/// tests for UploadsApi
void main() {
  final instance = TombContracts().getUploadsApi();

  group(UploadsApi, () {
    // Cleanup stale upload sessions
    //
    //Future<CleanupStaleSessions200Response> cleanupStaleSessions({ int maxAgeHours }) async
    test('test cleanupStaleSessions', () async {
      // TODO
    });

    // Delete upload session
    //
    //Future<UnifiedResponse> deleteUploadSession(String sessionId) async
    test('test deleteUploadSession', () async {
      // TODO
    });

    // Finalize upload and add track to playlist
    //
    //Future<FinalizeUpload200Response> finalizeUpload(String playlistId, String sessionId, { FinalizeUploadRequest finalizeUploadRequest }) async
    test('test finalizeUpload', () async {
      // TODO
    });

    // Get upload session status
    //
    //Future<GetUploadStatus200Response> getUploadStatus(String playlistId, String sessionId) async
    test('test getUploadStatus', () async {
      // TODO
    });

    // Initialize chunked upload session
    //
    //Future<InitUploadSession201Response> initUploadSession(String playlistId, InitUploadSessionRequest initUploadSessionRequest) async
    test('test initUploadSession', () async {
      // TODO
    });

    // List all upload sessions
    //
    //Future<ListUploadSessions200Response> listUploadSessions({ String status, int limit }) async
    test('test listUploadSessions', () async {
      // TODO
    });

    // Upload a file chunk
    //
    //Future<UploadChunk200Response> uploadChunk(String playlistId, String sessionId, int chunkIndex, MultipartFile body) async
    test('test uploadChunk', () async {
      // TODO
    });

  });
}
