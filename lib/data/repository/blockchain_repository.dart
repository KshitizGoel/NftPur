import 'package:boilerplate/data/local/datasources/UserDataSource/user_datasource.dart';
import 'package:boilerplate/data/network/apis/blockchain/blockchain_services.dart';
import 'package:boilerplate/models/user/user.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

class BlockchainRepository {
  final BlockchainServices _blockchainServices;
  final UserDataSource _userDataSource;

  BlockchainRepository(this._blockchainServices, this._userDataSource);

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

  /// TODO : Take the private key from the datasource and use it here!!!

  Future<String> getWalletBalance(EthereumAddress walletAddress) async {
    return await _blockchainServices
        .getWalletBalance(walletAddress)
        .then((value) {
      print('Getting the balance here !!! : \n$value');
      return value;
    }).catchError((onError) {
      print('Getting the error here !!!');
      throw onError;
    });
  }

  Future<dynamic> transfer(EthereumAddress address, double tokens) async {
    return await _blockchainServices.transfer(address, tokens).then((value) {
      return value;
    }).catchError((onError) {
      print('Getting the error here in repo level for Transfer ');
      throw onError;
    });
  }

  Future<dynamic> approveAndAllow(EthereumAddress address) async {
    return await _blockchainServices.approve(address, 1000).then((value) {
      print(value);
      return value;
    }).catchError((onError) {
      print('Getting the error here in approval repo!!!');
      throw onError;
    });
  }
}
