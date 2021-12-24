import 'package:boilerplate/data/repository/blockchain_repository.dart';
import 'package:boilerplate/models/user/user.dart';
import 'package:mobx/mobx.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

part 'blockchain_store.g.dart';

class BlockchainStore = _BlockchainStore with _$BlockchainStore;

abstract class _BlockchainStore with Store {
  // repository instance
  final BlockchainRepository _blockchainRepository;

  // constructor:---------------------------------------------------------------
  _BlockchainStore(BlockchainRepository _blockchainRepository)
      : this._blockchainRepository = _blockchainRepository;

  @observable
  EthereumAddress? ethereumAddress;

  /// Will be needing this in future!!!!
  @observable
  bool hasWallet = false;

  @observable
  dynamic balance;

  @action
  Future<void> generateANewWalletAddress(UserData userData) async {
    return _blockchainRepository.getANewWalletAddress().then((value) {
      this.ethereumAddress = value;
      storingTheUserDetails(userData, ethereumAddress.toString());
      hasWallet = true;
      print('FETCHING THE NEW ETH ADDRESS : \n$ethereumAddress');
    }).catchError((onError) {
      print('Getting the error in generateANewWalletAddress Store level !!!');
      throw onError;
    });
  }

  @action
  Future<void> storingTheUserDetails(
      UserData userData, String publicKey) async {
    return _blockchainRepository
        .storeTheUserDetails(userData, publicKey)
        .then((value) {
      print('Successfully storing the data in Store level!!');
    }).catchError((onError) {
      print('Getting the error in storingTheUserDetails in STORE level!!!');
      throw onError;
    });
  }

  @action
  Future<void> getBalance(
      EthereumAddress walletAddress ) async {
    return await _blockchainRepository
        .getWalletBalance(walletAddress)
        .then((value) {
      print('Getting the balance here !! \n $value');
      this.balance = value;
    }).catchError((onError) {
      print('Getting the error here  in getBalance store level!!!');
      throw onError;
    });
  }
}
