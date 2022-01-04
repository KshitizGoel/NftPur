// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blockchain_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BlockchainStore on _BlockchainStore, Store {
  final _$ethereumAddressAtom = Atom(name: '_BlockchainStore.ethereumAddress');

  @override
  EthereumAddress? get ethereumAddress {
    _$ethereumAddressAtom.reportRead();
    return super.ethereumAddress;
  }

  @override
  set ethereumAddress(EthereumAddress? value) {
    _$ethereumAddressAtom.reportWrite(value, super.ethereumAddress, () {
      super.ethereumAddress = value;
    });
  }

  final _$hasWalletAtom = Atom(name: '_BlockchainStore.hasWallet');

  @override
  bool get hasWallet {
    _$hasWalletAtom.reportRead();
    return super.hasWallet;
  }

  @override
  set hasWallet(bool value) {
    _$hasWalletAtom.reportWrite(value, super.hasWallet, () {
      super.hasWallet = value;
    });
  }

  final _$successfulTransferAtom =
      Atom(name: '_BlockchainStore.successfulTransfer');

  @override
  bool get successfulTransfer {
    _$successfulTransferAtom.reportRead();
    return super.successfulTransfer;
  }

  @override
  set successfulTransfer(bool value) {
    _$successfulTransferAtom.reportWrite(value, super.successfulTransfer, () {
      super.successfulTransfer = value;
    });
  }

  final _$successAtom = Atom(name: '_BlockchainStore.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$downloadURLAtom = Atom(name: '_BlockchainStore.downloadURL');

  @override
  String get downloadURL {
    _$downloadURLAtom.reportRead();
    return super.downloadURL;
  }

  @override
  set downloadURL(String value) {
    _$downloadURLAtom.reportWrite(value, super.downloadURL, () {
      super.downloadURL = value;
    });
  }

  final _$balanceAtom = Atom(name: '_BlockchainStore.balance');

  @override
  String get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(String value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  final _$loadingAtom = Atom(name: '_BlockchainStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$nftDetailsListAtom = Atom(name: '_BlockchainStore.nftDetailsList');

  @override
  List<NFTDetailsList>? get nftDetailsList {
    _$nftDetailsListAtom.reportRead();
    return super.nftDetailsList;
  }

  @override
  set nftDetailsList(List<NFTDetailsList>? value) {
    _$nftDetailsListAtom.reportWrite(value, super.nftDetailsList, () {
      super.nftDetailsList = value;
    });
  }

  final _$generateANewWalletAddressAsyncAction =
      AsyncAction('_BlockchainStore.generateANewWalletAddress');

  @override
  Future<void> generateANewWalletAddress(UserData userData) {
    return _$generateANewWalletAddressAsyncAction
        .run(() => super.generateANewWalletAddress(userData));
  }

  final _$storingTheUserDetailsAsyncAction =
      AsyncAction('_BlockchainStore.storingTheUserDetails');

  @override
  Future<void> storingTheUserDetails(UserData userData, String publicKey) {
    return _$storingTheUserDetailsAsyncAction
        .run(() => super.storingTheUserDetails(userData, publicKey));
  }

  final _$getBalanceAsyncAction = AsyncAction('_BlockchainStore.getBalance');

  @override
  Future<void> getBalance(EthereumAddress walletAddress) {
    return _$getBalanceAsyncAction.run(() => super.getBalance(walletAddress));
  }

  final _$transferAsyncAction = AsyncAction('_BlockchainStore.transfer');

  @override
  Future<void> transfer(EthereumAddress address) {
    return _$transferAsyncAction.run(() => super.transfer(address));
  }

  final _$approveAndAllowAsyncAction =
      AsyncAction('_BlockchainStore.approveAndAllow');

  @override
  Future<void> approveAndAllow(EthereumAddress address) {
    return _$approveAndAllowAsyncAction
        .run(() => super.approveAndAllow(address));
  }

  final _$uploadNFTToDatabaseAsyncAction =
      AsyncAction('_BlockchainStore.uploadNFTToDatabase');

  @override
  Future<void> uploadNFTToDatabase(NFTMetaData nftMetaData, XFile imageFile) {
    return _$uploadNFTToDatabaseAsyncAction
        .run(() => super.uploadNFTToDatabase(nftMetaData, imageFile));
  }

  final _$getDataFromStorageAsyncAction =
      AsyncAction('_BlockchainStore.getDataFromStorage');

  @override
  Future<void> getDataFromStorage() {
    return _$getDataFromStorageAsyncAction
        .run(() => super.getDataFromStorage());
  }

  final _$mintTheTokenAsyncAction =
      AsyncAction('_BlockchainStore.mintTheToken');

  @override
  Future<void> mintTheToken(EthereumAddress address, String imageAddress) {
    return _$mintTheTokenAsyncAction
        .run(() => super.mintTheToken(address, imageAddress));
  }

  @override
  String toString() {
    return '''
ethereumAddress: ${ethereumAddress},
hasWallet: ${hasWallet},
successfulTransfer: ${successfulTransfer},
success: ${success},
downloadURL: ${downloadURL},
balance: ${balance},
loading: ${loading},
nftDetailsList: ${nftDetailsList}
    ''';
  }
}
