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

  final _$balanceAtom = Atom(name: '_BlockchainStore.balance');

  @override
  String? get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(String? value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
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
  Future<void> getBalance(EthereumAddress walletAddress, Web3Client ethClient) {
    return _$getBalanceAsyncAction
        .run(() => super.getBalance(walletAddress, ethClient));
  }

  @override
  String toString() {
    return '''
ethereumAddress: ${ethereumAddress},
hasWallet: ${hasWallet},
balance: ${balance}
    ''';
  }
}
