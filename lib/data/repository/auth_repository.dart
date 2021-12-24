import 'dart:async';

import 'package:boilerplate/data/local/datasources/UserDataSource/user_datasource.dart';
import 'package:boilerplate/data/network/apis/blockchain/blockchain_services.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../network/apis/firebase_api/firebase_api.dart';

class AuthRepository {
  // data source object
  final UserDataSource _userDataSource;

  // api objects
  final FirebaseApi _firebaseApi;
  final BlockchainServices _blockchainServices;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  AuthRepository(this._blockchainServices, this._firebaseApi,
      this._sharedPrefsHelper, this._userDataSource);

  Future<dynamic> googleSignIn() async {
    return await _firebaseApi.handleGoogleSignIn().then((value) {
      print(
          'Executing the Google Sign in successfully and getting the following details ');
    }).catchError((onError) {
      print('Getting the error in Google Sign In!!');
      throw onError;
    });
  }

  User? getUserDetails() {
    try {
      print('Getting the user Details in Repo level!');
      return _firebaseApi.getUserDetails();
    } catch (onError) {
      print('Getting the error in retrieving the User Details!');
      throw onError;
    }
  }

  Future<dynamic> logoutTheUser() async {
    return await _firebaseApi.signOutFromGoogle().then((value) {
      print('Successfully executed the sign out !');
      return value;
    }).catchError((onError) {
      print('Getting the error in Logging Out from the Repo level !!');
      throw onError;
    });
  }

  Future<bool?> checkForTheAvailableWallet(UserData userData) async {
    return await _blockchainServices.checkForTheWallet(userData).then((value) {
      print('Getting the value here for checkTheAvailableWallet!!!! $value');
      return value;
    }).catchError((onError) {
      print('Getting the error in checkTheAvailableWallet in repo level');
      throw onError;
    });
  }
}
