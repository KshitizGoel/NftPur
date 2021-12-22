import 'package:boilerplate/data/network/apis/blockchain/blockchain_services.dart';
import 'package:boilerplate/models/user/user.dart';
import 'package:http/http.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

class BlockchainRepository {
  final BlockchainServices _blockchainServices;

  BlockchainRepository(this._blockchainServices);

  Future<EthereumAddress?> getANewWalletAddress() async {
    return await _blockchainServices.createTheWalletAddress().then((value) {
      return value;
    }).catchError((onError) {
      print('Getting the error here in getANewWalletAddress in repo level');
      throw onError;
    });
  }

  Future<void> storeTheUserDetails(UserData userData, String publicKey) async {
    return await _blockchainServices
        .addUserDetails(userData, publicKey)
        .then((value) {
      print(
          'Successfully executed storing the User Details in repo level!!!!!');
    }).catchError((onError) {
      print('Getting the error in storeTheUserDetails in repo level!');
      throw onError;
    });
  }

  Future<String> getWalletBalance(
      EthereumAddress walletAddress , Web3Client ethClient) async {
    return await _blockchainServices
        .getWalletBalance(walletAddress , ethClient)
        .then((value) {
      print('Getting the balance here !!! : \n$value');
      return value;
    }).catchError((onError) {
      print('Getting the error here !!!');
      throw onError;
    });
  }
}
