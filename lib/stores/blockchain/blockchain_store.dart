import 'package:boilerplate/data/repository/blockchain_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:web3dart/credentials.dart';

part 'blockchain_store.g.dart';

class BlockchainStore = _BlockchainStore with _$BlockchainStore;

abstract class _BlockchainStore with Store {
  // repository instance
  final BlockchainRepository _blockchainRepository;

  // constructor:---------------------------------------------------------------
  _BlockchainStore(BlockchainRepository _blockchainRepository)
      : this._blockchainRepository = _blockchainRepository;

  @observable
  EthereumAddress? _ethereumAddress;

  @action
  Future<dynamic> generateANewWalletAddress() async {
    return await _blockchainRepository.getANewWalletAddress().then((value) {
      this._ethereumAddress = value;
    }).catchError((onError) {
      print('Getting the error in generateANewWalletAddress Store level !!!');
      throw onError;
    });
  }
}
