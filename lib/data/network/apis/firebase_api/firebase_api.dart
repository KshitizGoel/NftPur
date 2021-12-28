import 'package:boilerplate/models/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseApi {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseFirestore reference = FirebaseFirestore.instance;

  /// TODO  : Integrate the Firebase push notifications as well!!!

  Future<dynamic> handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
      return credential;
    } on FirebaseAuthException catch (e) {
      print('Terminating the Google Sign In with the error XXXXX' +
          '\n ' +
          '$e.message');
      throw e;
    }
  }

  /// From here, we will retrieve the User's Name , Email ID and photo!
  /// Obv not an API call necessarily
  User? getUserDetails() {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      return user;
    } catch (onError) {
      print('Getting the error in getUserDetails API!!\nerror:$onError');
      throw onError;
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }


}
