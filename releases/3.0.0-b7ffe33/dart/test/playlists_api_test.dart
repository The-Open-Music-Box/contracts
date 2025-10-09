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

    // Get specific playlist
    //
    //Future<CreatePlaylist201Response> getPlaylist(String playlistId) async
    test('test getPlaylist', () async {
      // TODO
    });

    // List all playlists with pagination
    //
    //Future<ListPlaylists200Response> listPlaylists({ int page, int limit }) async
    test('test listPlaylists', () async {
      // TODO
    });

    // Start playlist playback
    //
    //Future<StartPlaylist200Response> startPlaylist(String playlistId, { PlayerPlayRequest playerPlayRequest }) async
    test('test startPlaylist', () async {
      // TODO
    });

    // Update playlist
    //
    //Future<UpdatePlaylist200Response> updatePlaylist(String playlistId, { UpdatePlaylistRequest updatePlaylistRequest }) async
    test('test updatePlaylist', () async {
      // TODO
    });

  });
}
