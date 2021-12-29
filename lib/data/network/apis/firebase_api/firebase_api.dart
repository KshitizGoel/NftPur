import 'dart:io';

import 'package:boilerplate/models/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseApi {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseFirestore reference = FirebaseFirestore.instance;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

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
      print("user : \n$user");
      return user;
    } catch (onError) {
      print('Getting the error in getUserDetails API!!\nerror:$onError');
      throw onError;
    }
  }

  Future<dynamic> gettingUserDetails(UserData userData) async {
    return await reference
        .collection('users')
        .doc(userData.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        //   if (documentSnapshot.get('hasWallet') == true) return true;
        // } else {
        //   print('Document does not exist on the database');
        //   return false;
        // }
        return documentSnapshot;
      }
    }).catchError((onError) {
      print('Getting the error in checkForWallet in API level!!!');
      throw onError;
    });
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<void> saveNftInDatabase(String fileName, XFile imageFile) async {
    File file = File(imageFile.path);

    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('NFTs')
        .child('$fileName')
        .putFile(file);
  }

  Future<String> downloadURL(String fileName) async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('NFTs')
        .child(fileName)
        .getDownloadURL();

    return downloadURL;
  }

  Future<void> getMetadataOfNft() async {
    firebase_storage.FullMetadata metadata = await firebase_storage
        .FirebaseStorage.instance
        .ref('uploads/file-to-upload.png')
        .getMetadata();

    // As set in previous example.
    print(metadata.customMetadata!['userId']);
  }
}
