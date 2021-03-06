import 'package:boilerplate/data/repository/blockchain_repository.dart';
import 'package:boilerplate/models/nft/nft_details.dart';
import 'package:boilerplate/models/nft/nft_details_list.dart';
import 'package:boilerplate/models/user/user.dart';
import 'package:image_picker/image_picker.dart';
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
  bool successfulTransfer = false;

  @observable
  bool success = false;

  @observable
  String downloadURL = " ";

  @observable
  String balance = " ";

  @observable
  bool loading = true;

  @observable
  List<NFTDetailsList>? nftDetailsList;

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
  Future<void> getBalance(EthereumAddress walletAddress) async {
    return await _blockchainRepository
        .getWalletBalance(walletAddress)
        .then((value) {
      print('Getting the balance here !! \n $value');
      this.balance = value.toString();
    }).catchError((onError) {
      print('Getting the error here  in getBalance store level!!!');
      throw onError;
    });
  }

  @action
  Future<void> transfer(EthereumAddress address) async {
    return await _blockchainRepository.transfer(address, 500).then((value) {
      successfulTransfer = value;

      print('Successfully transferred the money!! : $value');
    }).catchError((onError) {
      print('Getting the error here !!! \n$onError');
      throw onError;
    });
  }

  @action
  Future<void> approveAndAllow(EthereumAddress address) async {
    return await _blockchainRepository.approveAndAllow(address).then((value) {
      print('Getting the value of approval here !! $value');
    }).catchError((onError) {
      print('Error : approval , store');
      throw onError;
    });
  }

  @action
  Future<void> uploadNFTToDatabase(
      NFTMetaData nftMetaData, XFile imageFile) async {
    return await _blockchainRepository
        .uploadFileToDatabase(nftMetaData, imageFile)
        .then((value) {
      success = true;
      this.downloadURL = value;
      print(
          'Getting the downloadURL here !!! \nvalue : $value\nuploadSuccess : $success');
    }).catchError((onError) {
      print('Getting the error in uploadNFTToDatabase in store level');
      throw onError;
    });
  }

  @action
  Future<void> getDataFromStorage() async {
    return await _blockchainRepository.getFilesFromDatabase().then((value) {
      this.nftDetailsList = value;
      print(
          'Getting the data from getDataFromStorage here!! \n${nftDetailsList!.last.nftName}');

      this.loading = false;
    }).catchError((onError) {
      print('Getting the error here in getDataFromStorage Store level!');
      throw onError;
    });
  }

  @action
  Future<void> mintTheToken(
      EthereumAddress address, String imageAddress) async {
    return await _blockchainRepository
        .mintTheToken(address, imageAddress)
        .then((value) {
      print('Gettig the token here in Store level!! : \n$value');
    }).catchError((onError) {
      print('Getting the error here in the mintTheTOken Store level');
      throw onError;
    });
  }
}
