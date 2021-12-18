import 'dart:async';

import 'package:boilerplate/data/local/datasources/post/post_datasource.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../network/apis/firebase_api/firebase_api.dart';

class AuthRepository {
  // data source object
  final PostDataSource _postDataSource;

  // api objects
  final FirebaseApi _firebaseApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  AuthRepository(
      this._firebaseApi, this._sharedPrefsHelper, this._postDataSource);

  Future<dynamic> googleSignIn() async {
    return await _firebaseApi.handleGoogleSignIn().then((value) {
      print(
          'Executing the Google Sign in successfully and getting the following details ');
    }).catchError((onError) {
      print('Getting the error in Google Sign In!!');
      throw onError;
    });
  }

  User? getUserDetails()  {
    try {
      print('Getting the user Details in Repo level!');
      return _firebaseApi.getUserDetails();
    } catch (onError) {
      print('Getting the error in retrieving the User Details!');
      throw onError;
    }
  }

  Future <dynamic> logoutTheUser() async{
    return await _firebaseApi.signOutFromGoogle().then((value) {
      print('Successfully executed the sign out !');
      return value;
    }).catchError((onError){
      print('Getting the error in Logging Out from the Repo level !!');
      throw onError;
    });
  }
}
