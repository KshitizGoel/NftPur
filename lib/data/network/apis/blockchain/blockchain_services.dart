import 'package:bip39/bip39.dart' as bip39;
import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/models/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:flutter/services.dart';
import 'package:hex/hex.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3dart/web3dart.dart' as Transaction;

class BlockchainServices {
  FirebaseFirestore reference = FirebaseFirestore.instance;
  var privateKey;
  Client httpClient = Client();

  //Smart Contract necessary initiations

  /// TODO : we have to use sendTransactions in order to write / update the data!!!
  /// Intuition : We can achieve this via deploying this in Truffle. Will see in the CodePur video for the same!!

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
    try {
      String abi =
          await rootBundle.loadString(Assets.walletSmartContractAddress);

      ///TODO : This contract address will be obtained only upon the new deployment of the smart contract!!! So it may change!!
      String contractAddress = "0xd9145CCE52D386f254917e481eB44e9943F39138";

      final contract = DeployedContract(ContractAbi.fromJson(abi, 'NFTPur'),
          EthereumAddress.fromHex(contractAddress));
      return contract;
    } catch (onError) {
      print('loadWalletContract : 1');
      throw onError;
    }
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    try {
      Web3Client ethClient = Web3Client(
          'https://rinkeby.infura.io/v3/835ac87e30544599be38eed5a0a2a2c0',
          httpClient);

      final contract = await loadWalletContract();
      final ethFunction = contract.function(functionName);

      final result = await ethClient.call(
          contract: contract, function: ethFunction, params: args);

      return result;
    } catch (onError) {
      print('query : 1');
      print(onError);

      throw onError;
    }
  }

  Future<dynamic> getWalletBalance(EthereumAddress walletAddress) async {
    List<dynamic> result = await query('balanceOf', [
      EthereumAddress.fromHex('0x61a02185c526cb869ab57c4e4cfdc5941f8c3f3a')
    ]);
    print('Getting the result of getWalletBalance function here !!!\n$result');
    return result.toString();
  }

  Future<dynamic> approve(EthereumAddress address, int thresholdTokens) async {
    var bigAmount = BigInt.from(thresholdTokens);
    var response = query('approve', [address, bigAmount]);
    print('Getting the approval execution here !!!!\n$response');
    allow(address);
    return response;
  }

  Future<dynamic> allow(EthereumAddress address) async {
    EthereumAddress globalAddress =
        EthereumAddress.fromHex('0x5B38Da6a701c568545dCfcB03FcB875f56beddC4');
    var response = query('allowance', [globalAddress, address]);
    print('Getting the response here !!! \n$response');
    return response;
  }

  Future<dynamic> submitQuery(String functionName, List<dynamic> args) async {
    try {
      EthPrivateKey credentials = EthPrivateKey.fromHex(
          '261fcd4fca4a8d62a73f93125310a0690fc4946951a48b04bba9bb59e07ba3aa');
      DeployedContract contract = await loadWalletContract();
      final ethFunction = contract.function(functionName);
      Web3Client ethClient = Web3Client(
          'https://rinkeby.infura.io/v3/835ac87e30544599be38eed5a0a2a2c0',
          httpClient);
      final result = ethClient.sendTransaction(
          credentials,
          Transaction.Transaction.callContract(
              contract: contract, function: ethFunction, parameters: args));
      return result;
    } catch (onError) {
      print('Error : submitQuery 1');
      throw onError;
    }
  }

  Future<dynamic> makeTransactionForNft(EthereumAddress ownerAddress,
      EthereumAddress buyerAddress, int amt) async {
    var bigAmount = BigInt.from(amt);
    var response =
        query('transferFrom', [ownerAddress, buyerAddress, bigAmount]);
    print('Getting the response here !!!\n$response');
    return response;
  }

  /// TODO : This function will only be executed when we the wallet is created for the first time!
  Future<dynamic> transfer(
      EthereumAddress delegateAddress, double tokens) async {
    EthereumAddress adminAddress =
        EthereumAddress.fromHex('0x5B38Da6a701c568545dCfcB03FcB875f56beddC4');
    var bigAmount = BigInt.from(tokens);
    var response =
        query('transfer', [adminAddress, delegateAddress, bigAmount]);
    print('Getting the response here !!!! \n$response');
    return response;
  }

  Future<dynamic> transferInitialBalance(
      EthereumAddress address, double tokens) async {
    // var bigAmount = BigInt.from(tokens);
    try {
      var response = query('transferInitialBalance', [true, address]);
      print(
          'Getting the response here for transferInitialBalance!!!! \n$response');
      return response;
    } catch (e) {
      print('Getting the error here in transferInitialBalance!!!:');
      throw e;
    }
  }

  /// TODO : Complete the above function as well as make the datasource!!
}
