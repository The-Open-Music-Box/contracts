import 'package:test/test.dart';
import 'package:tomb_contracts/tomb_contracts.dart';


/// tests for NFCApi
void main() {
  final instance = TombContracts().getNFCApi();

  group(NFCApi, () {
    // Associate NFC tag with playlist
    //
    //Future<AssociateNFC200Response> associateNFC(AssociateNFCRequest associateNFCRequest) async
    test('test associateNFC', () async {
      // TODO
    });

    // Get NFC reader status
    //
    //Future<GetNFCStatus200Response> getNFCStatus() async
    test('test getNFCStatus', () async {
      // TODO
    });

    // Remove NFC tag association
    //
    //Future<UnifiedResponse> removeNFCAssociation(String tagId, { PlayerPlayRequest playerPlayRequest }) async
    test('test removeNFCAssociation', () async {
      // TODO
    });

  });
}
