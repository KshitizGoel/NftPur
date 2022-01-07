// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  final _$signedInUserAtom = Atom(name: '_AuthStore.signedInUser');

  @override
  bool get signedInUser {
    _$signedInUserAtom.reportRead();
    return super.signedInUser;
  }

  @override
  set signedInUser(bool value) {
    _$signedInUserAtom.reportWrite(value, super.signedInUser, () {
      super.signedInUser = value;
    });
  }

  final _$firebaseUserAtom = Atom(name: '_AuthStore.firebaseUser');

  @override
  User? get firebaseUser {
    _$firebaseUserAtom.reportRead();
    return super.firebaseUser;
  }

  @override
  set firebaseUser(User? value) {
    _$firebaseUserAtom.reportWrite(value, super.firebaseUser, () {
      super.firebaseUser = value;
    });
  }

  final _$userDetailsAtom = Atom(name: '_AuthStore.userDetails');

  @override
  UserData? get userDetails {
    _$userDetailsAtom.reportRead();
    return super.userDetails;
  }

  @override
  set userDetails(UserData? value) {
    _$userDetailsAtom.reportWrite(value, super.userDetails, () {
      super.userDetails = value;
    });
  }

  final _$hasWalletAtom = Atom(name: '_AuthStore.hasWallet');

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

  final _$privateKeyAtom = Atom(name: '_AuthStore.privateKey');

  @override
  EthereumAddress? get privateKey {
    _$privateKeyAtom.reportRead();
    return super.privateKey;
  }

  @override
  set privateKey(EthereumAddress? value) {
    _$privateKeyAtom.reportWrite(value, super.privateKey, () {
      super.privateKey = value;
    });
  }

  final _$dataSavedAtom = Atom(name: '_AuthStore.dataSaved');

  @override
  bool get dataSaved {
    _$dataSavedAtom.reportRead();
    return super.dataSaved;
  }

  @override
  set dataSaved(bool value) {
    _$dataSavedAtom.reportWrite(value, super.dataSaved, () {
      super.dataSaved = value;
    });
  }

  final _$googleSignInAsyncAction = AsyncAction('_AuthStore.googleSignIn');

  @override
  Future<void> googleSignIn() {
    return _$googleSignInAsyncAction.run(() => super.googleSignIn());
  }

  final _$logoutTheUserAsyncAction = AsyncAction('_AuthStore.logoutTheUser');

  @override
  Future<dynamic> logoutTheUser() {
    return _$logoutTheUserAsyncAction.run(() => super.logoutTheUser());
  }

  final _$checkForTheAvailableWalletAsyncAction =
      AsyncAction('_AuthStore.checkForTheAvailableWallet');

  @override
  Future<void> checkForTheAvailableWallet(UserData userData) {
    return _$checkForTheAvailableWalletAsyncAction
        .run(() => super.checkForTheAvailableWallet(userData));
  }

  final _$storeUserDataAsyncAction = AsyncAction('_AuthStore.storeUserData');

  @override
  Future<void> storeUserData(UserData userData) {
    return _$storeUserDataAsyncAction.run(() => super.storeUserData(userData));
  }

  final _$_AuthStoreActionController = ActionController(name: '_AuthStore');

  @override
  void getUserDetails() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.getUserDetails');
    try {
      return super.getUserDetails();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
signedInUser: ${signedInUser},
firebaseUser: ${firebaseUser},
userDetails: ${userDetails},
hasWallet: ${hasWallet},
privateKey: ${privateKey},
dataSaved: ${dataSaved}
    ''';
  }
}
