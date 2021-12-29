// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NFTStore on _NFTStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_NFTStore.loading'))
      .value;

  final _$fetchPostsFutureAtom = Atom(name: '_NFTStore.fetchPostsFuture');

  @override
  ObservableFuture<PostList?> get fetchPostsFuture {
    _$fetchPostsFutureAtom.reportRead();
    return super.fetchPostsFuture;
  }

  @override
  set fetchPostsFuture(ObservableFuture<PostList?> value) {
    _$fetchPostsFutureAtom.reportWrite(value, super.fetchPostsFuture, () {
      super.fetchPostsFuture = value;
    });
  }

  final _$uploadSuccessAtom = Atom(name: '_NFTStore.uploadSuccess');

  @override
  bool get uploadSuccess {
    _$uploadSuccessAtom.reportRead();
    return super.uploadSuccess;
  }

  @override
  set uploadSuccess(bool value) {
    _$uploadSuccessAtom.reportWrite(value, super.uploadSuccess, () {
      super.uploadSuccess = value;
    });
  }

  final _$uploadNFTToDatabaseAsyncAction =
      AsyncAction('_NFTStore.uploadNFTToDatabase');

  @override
  Future<void> uploadNFTToDatabase(String fileName, XFile imageFile) {
    return _$uploadNFTToDatabaseAsyncAction
        .run(() => super.uploadNFTToDatabase(fileName, imageFile));
  }

  @override
  String toString() {
    return '''
fetchPostsFuture: ${fetchPostsFuture},
uploadSuccess: ${uploadSuccess},
loading: ${loading}
    ''';
  }
}
