import 'package:test/test.dart';
import 'package:tomb_contracts/tomb_contracts.dart';


/// tests for SystemApi
void main() {
  final instance = TombContracts().getSystemApi();

  group(SystemApi, () {
    // Get system information
    //
    //Future<GetSystemInfo200Response> getSystemInfo() async
    test('test getSystemInfo', () async {
      // TODO
    });

    // Get system logs
    //
    //Future<GetSystemLogs200Response> getSystemLogs({ int lines, String level }) async
    test('test getSystemLogs', () async {
      // TODO
    });

    // Restart the system
    //
    //Future<RestartSystem200Response> restartSystem({ PlayerPlayRequest playerPlayRequest }) async
    test('test restartSystem', () async {
      // TODO
    });

  });
}
