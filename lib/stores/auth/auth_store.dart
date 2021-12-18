import 'package:boilerplate/data/repository/auth_repository.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/stores/error/error_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../form/form_store.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  // repository instance
  final AuthRepository _authRepository;

  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  // bool to check if current user is logged in
  bool isLoggedIn = false;

  // constructor:---------------------------------------------------------------
  _AuthStore(AuthRepository _authRepository)
      : this._authRepository = _authRepository;

  @observable
  bool signedInUser = false;

  @observable
  User? firebaseUser;

  @action
  Future<void> googleSignIn() async {
    return await _authRepository.googleSignIn().then((value) {
      signedInUser = true;

      SharedPreferences.getInstance().then((prefs) {
        prefs.setBool(Preferences.is_logged_in, true);
      });
      print('Successfully executing the Google Sign In here at store level!');
    }).catchError((onError) {
      print('Getting the error here at store level!');
      throw onError;
    });
  }

  @action
  void getUserDetails() {
    try {
      this.firebaseUser = _authRepository.getUserDetails();
      print('Getting the User Details here !!!');
    } catch (onError) {
      print('Getting the error in getUserDetails from Store!');
      throw onError;
    }
  }

  @action
  Future<dynamic> logoutTheUser() async {
    await _authRepository.logoutTheUser().then((value) {
      SharedPreferences.getInstance().then((preference) {
        preference.setBool(Preferences.is_logged_in, false);
        signedInUser = false;
      });
      print('Successfully logged out the user! ');
      return value;
    }).catchError((onError) {
      print('Getting the error in logging out the error from Store level!');
      throw onError;
    });
  }
}
