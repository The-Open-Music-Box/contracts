import 'package:test/test.dart';
import 'package:tomb_contracts/tomb_contracts.dart';


/// tests for PlayerApi
void main() {
  final instance = TombContracts().getPlayerApi();

  group(PlayerApi, () {
    // Get current player status
    //
    //Future<PlayerPlay200Response> getPlayerStatus() async
    test('test getPlayerStatus', () async {
      // TODO
    });

    // Skip to next track
    //
    //Future<PlayerPlay200Response> playerNext({ PlayerPlayRequest playerPlayRequest }) async
    test('test playerNext', () async {
      // TODO
    });

    // Pause playback
    //
    //Future<PlayerPlay200Response> playerPause({ PlayerPlayRequest playerPlayRequest }) async
    test('test playerPause', () async {
      // TODO
    });

    // Start/resume playback
    //
    //Future<PlayerPlay200Response> playerPlay({ PlayerPlayRequest playerPlayRequest }) async
    test('test playerPlay', () async {
      // TODO
    });

    // Skip to previous track
    //
    //Future<PlayerPlay200Response> playerPrevious({ PlayerPlayRequest playerPlayRequest }) async
    test('test playerPrevious', () async {
      // TODO
    });

    // Seek to position in current track
    //
    //Future<PlayerPlay200Response> playerSeek(PlayerSeekRequest playerSeekRequest) async
    test('test playerSeek', () async {
      // TODO
    });

    // Stop playback
    //
    //Future<PlayerPlay200Response> playerStop({ PlayerPlayRequest playerPlayRequest }) async
    test('test playerStop', () async {
      // TODO
    });

    // Toggle play/pause
    //
    //Future<PlayerPlay200Response> playerToggle({ PlayerPlayRequest playerPlayRequest }) async
    test('test playerToggle', () async {
      // TODO
    });

    // Set volume level
    //
    //Future<SetVolume200Response> setVolume(SetVolumeRequest setVolumeRequest) async
    test('test setVolume', () async {
      // TODO
    });

  });
}
