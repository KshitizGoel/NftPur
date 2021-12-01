import 'dart:async';

import 'package:boilerplate/data/network/dio_client.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class FirebaseApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  FirebaseApi(this._dioClient, this._restClient);

  Future<void> handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn();
      print('Executing the Google SIGN in API level');

    } catch (error) {
      print('Getting the error in Google SIGN in API level');

      print(error);
    }
  }
}
