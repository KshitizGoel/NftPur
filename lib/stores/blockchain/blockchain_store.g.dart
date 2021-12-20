// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blockchain_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BlockchainStore on _BlockchainStore, Store {
  final _$_ethereumAddressAtom =
      Atom(name: '_BlockchainStore._ethereumAddress');

  @override
  EthereumAddress? get _ethereumAddress {
    _$_ethereumAddressAtom.reportRead();
    return super._ethereumAddress;
  }

  @override
  set _ethereumAddress(EthereumAddress? value) {
    _$_ethereumAddressAtom.reportWrite(value, super._ethereumAddress, () {
      super._ethereumAddress = value;
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

  @override
  String toString() {
    return '''
hasWallet: ${hasWallet}
    ''';
  }
}
