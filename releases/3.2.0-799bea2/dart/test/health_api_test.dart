import 'package:test/test.dart';
import 'package:tomb_contracts/tomb_contracts.dart';


/// tests for HealthApi
void main() {
  final instance = TombContracts().getHealthApi();

  group(HealthApi, () {
    // Health check endpoint
    //
    //Future<GetHealth200Response> getHealth() async
    test('test getHealth', () async {
      // TODO
    });

  });
}
