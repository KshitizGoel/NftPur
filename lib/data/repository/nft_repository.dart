import 'package:boilerplate/data/network/apis/firebase_api/firebase_api.dart';
import 'package:image_picker/image_picker.dart';

class NFTRepository {
  // api objects
  final FirebaseApi _firebaseApi;

  // constructor
  NFTRepository(this._firebaseApi);

  Future<dynamic> uploadNFTToDatabase(String fileName, XFile imageFile) async {
    return await _firebaseApi
        .uploadNftInDatabase(fileName, imageFile)
        .then((value) async {
      var downloadURL;
      await _firebaseApi.downloadURL(fileName).then((value) {
        downloadURL = value;
      }).catchError((onError) {
        print('Getting the error in getting the download URL');
        throw onError;
      });

      return downloadURL;
    }).catchError((onError) {
      print('Getting the error in uploadNFTToDatabase in repo level');
      throw onError;
    });
  }
}
