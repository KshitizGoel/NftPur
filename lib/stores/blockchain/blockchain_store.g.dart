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

  final _$generateANewWalletAddressAsyncAction =
      AsyncAction('_BlockchainStore.generateANewWalletAddress');

  @override
  Future<void> generateANewWalletAddress() {
    return _$generateANewWalletAddressAsyncAction
        .run(() => super.generateANewWalletAddress());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
