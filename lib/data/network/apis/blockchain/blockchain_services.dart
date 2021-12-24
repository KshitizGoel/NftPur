import 'package:bip39/bip39.dart' as bip39;
import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/models/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:flutter/services.dart';
import 'package:hex/hex.dart';
import 'package:http/http.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

class BlockchainServices {
  FirebaseFirestore reference = FirebaseFirestore.instance;
  var privateKey;
  Client httpClient = Client();

  //Smart Contract necessary initiations

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

  /// Dealing with the Smart Contracts!!!!
  /// TODO : WE MAY HAVE TO MAKE SOME CHANGES IN THE CURRENT SMART CONTRACTS!!!!

  Future<DeployedContract> loadWalletContract() async {
    String abi = await rootBundle.loadString(Assets.walletContractAddress);

    ///TODO : This contract address will be obtained only upon the new deployment of the smart contract!!! So it may change!!
    String contractAddress = "0xd9145CCE52D386f254917e481eB44e9943F39138";

    final contract = DeployedContract(ContractAbi.fromJson(abi, 'NFTPur'),
        EthereumAddress.fromHex(contractAddress));
    return contract;
  }

  Future<List<dynamic>> query(
      String functionName, List<dynamic> args, Web3Client ethClient) async {
    final contract = await loadWalletContract();
    final ethFunction = contract.function(functionName);

    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<dynamic> getWalletBalance(
      EthereumAddress walletAddress ) async {
    Web3Client ethClient = Web3Client(
        'https://rinkeby.infura.io/v3/835ac87e30544599be38eed5a0a2a2c0',
        httpClient);

    List<dynamic> result = await query('balanceOf', [walletAddress], ethClient);

    return result[0];
  }
}
