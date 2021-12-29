import 'package:boilerplate/data/repository/nft_repository.dart';
import 'package:boilerplate/models/post/post_list.dart';
import 'package:boilerplate/stores/error/error_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'nft_store.g.dart';

class NFTStore = _NFTStore with _$NFTStore;

abstract class _NFTStore with Store {
  // repository instance
  late NFTRepository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _NFTStore(NFTRepository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<PostList?> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<PostList?> fetchPostsFuture =
      ObservableFuture<PostList?>(emptyPostResponse);

  @observable
  bool uploadSuccess = false;

  @observable
  String? downloadURL;

  @computed
  bool get loading => fetchPostsFuture.status == FutureStatus.pending;

  @action
  Future<void> uploadNFTToDatabase(String fileName, XFile imageFile) async {
    return _repository.uploadNFTToDatabase(fileName, imageFile).then((value) {
      downloadURL = value;
      uploadSuccess = true;
    }).catchError((onError) {
      print('Getting the error in uploadNFTToDatabase in store level');
      throw onError;
    });
  }
}
