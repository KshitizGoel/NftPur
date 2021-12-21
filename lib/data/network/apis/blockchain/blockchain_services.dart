import 'package:bip39/bip39.dart' as bip39;
import 'package:boilerplate/models/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:hex/hex.dart';
import 'package:web3dart/credentials.dart';

class BlockchainServices {
  FirebaseFirestore reference = FirebaseFirestore.instance;
  var privateKey;

  Future<dynamic> createTheWalletAddress() async {
    String mnemonic = bip39.generateMnemonic();
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);

    privateKey = HEX.encode(master.key);
    return getPublicKey(privateKey);
  }

  Future<EthereumAddress> getPublicKey(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);
    final address = await private.extractAddress();
    return address;
  }

  // CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUserDetails(UserData userData, String publicKey) async {
    await reference.collection("users").doc("${userData.uid}").set({
      'username': userData.displayName,
      'email': userData.email,
      'photoURL': userData.photoURL,
      'publicKey': publicKey,
      'privateKey': privateKey,
      'hasWallet': true
    });
  }

  /// Used to run a query in the database to see if the user has a wallet or not!!!!

  Future<bool?> checkForTheWallet(UserData userData) async {
    return await reference
        .collection('users')
        .doc(userData.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        if (documentSnapshot.get('hasWallet') == true) return true;
      } else {
        print('Document does not exist on the database');
        return false;
      }
    }).catchError((onError) {
      print('Getting the error in checkForWallet in API level!!!');
      throw onError;
    });
  }
}
