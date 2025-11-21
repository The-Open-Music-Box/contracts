import 'package:test/test.dart';
import 'package:tomb_contracts/tomb_contracts.dart';


/// tests for PlaylistsApi
void main() {
  final instance = TombContracts().getPlaylistsApi();

  group(PlaylistsApi, () {
    // Create new playlist
    //
    //Future<CreatePlaylist201Response> createPlaylist(CreatePlaylistRequest createPlaylistRequest) async
    test('test createPlaylist', () async {
      // TODO
    });

    // Delete playlist
    //
    //Future deletePlaylist(String playlistId, { PlayerPlayRequest playerPlayRequest }) async
    test('test deletePlaylist', () async {
      // TODO
    });

    // Finalize upload and add track to playlist
    //
    //Future<FinalizeUpload200Response> finalizeUpload(String playlistId, String sessionId, { FinalizeUploadRequest finalizeUploadRequest }) async
    test('test finalizeUpload', () async {
      // TODO
    });

    // Get specific playlist
    //
    //Future<CreatePlaylist201Response> getPlaylist(String playlistId) async
    test('test getPlaylist', () async {
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

    // List all playlists with pagination
    //
    //Future<ListPlaylists200Response> listPlaylists({ int page, int limit }) async
    test('test listPlaylists', () async {
      // TODO
    });

    // Move track between playlists
    //
    //Future<UnifiedResponse> moveTrack(MoveTrackRequest moveTrackRequest) async
    test('test moveTrack', () async {
      // TODO
    });

    // Remove tracks from playlist
    //
    //Future<UnifiedResponse> removeTracksFromPlaylist(String playlistId, RemoveTracksFromPlaylistRequest removeTracksFromPlaylistRequest) async
    test('test removeTracksFromPlaylist', () async {
      // TODO
    });

    // Reorder tracks in playlist
    //
    //Future<UnifiedResponse> reorderPlaylist(String playlistId, ReorderPlaylistRequest reorderPlaylistRequest) async
    test('test reorderPlaylist', () async {
      // TODO
    });

    // Start playlist playback
    //
    //Future<StartPlaylist200Response> startPlaylist(String playlistId, { PlayerPlayRequest playerPlayRequest }) async
    test('test startPlaylist', () async {
      // TODO
    });

    // Sync playlist state
    //
    //Future<SyncPlaylists200Response> syncPlaylists({ SyncPlaylistsRequest syncPlaylistsRequest }) async
    test('test syncPlaylists', () async {
      // TODO
    });

    // Update playlist
    //
    //Future<CreatePlaylist201Response> updatePlaylist(String playlistId, { UpdatePlaylistRequest updatePlaylistRequest }) async
    test('test updatePlaylist', () async {
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
