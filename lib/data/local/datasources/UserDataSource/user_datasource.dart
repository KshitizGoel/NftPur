import 'package:boilerplate/data/local/constants/db_constants.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/models/user/firebase_user_data.dart';
import 'package:boilerplate/models/user/firebase_user_data_list.dart';
import 'package:sembast/sembast.dart';

class UserDataSource {
  final _firebaseStore =
      intMapStoreFactory.store(DBConstants.FIREBASE_STORE_NAME);

  // database instance
  final Database _db;

  // Constructor
  UserDataSource(this._db);

  // DB functions:--------------------------------------------------------------
  Future<int> insert(FirebaseUserData userData) async {
    return await _firebaseStore.add(_db, userData.toMap());
  }

  Future<int> count() async {
    return await _firebaseStore.count(_db);
  }

  // Future<FirebaseUserData> getAllSortedByFilter({List<Filter>? filters}) async {
  //   //creating finder
  //   final finder = Finder(
  //       filter: filters != null ? Filter.and(filters) : null,
  //       sortOrders: [SortOrder(DBConstants.FIELD_ID)]);
  //
  //   final recordSnapshots = await _firebaseStore.find(
  //     _db,
  //     finder: finder,
  //   );
  //
  //   // Making a List<Post> out of List<RecordSnapshot>
  //   return recordSnapshots.map((snapshot) {
  //     final post = FirebaseUserData.fromMap(snapshot.value);
  //     // An ID is a key of a record from the database.
  //     post.id = snapshot.key;
  //     return post;
  //   }) ;
  // }

  Future<FirebaseUserData> getUserData() async {
    print('Loading the users from database');

    // post list
    var userList;

    // fetching data
    final recordSnapshots = await _firebaseStore.find(
      _db,
    );
    if (recordSnapshots.length > 0) {
      userList = UserList(
          users: recordSnapshots.map((snapshot) {
        final user = FirebaseUserData.fromMap(snapshot.value);
        return user;
      }).toList());
    }

    print('Getting the userList from the datasource :\n$userList');
    return userList;
  }

  Future<int> update(Post post) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(post.id));
    return await _firebaseStore.update(
      _db,
      post.toMap(),
      finder: finder,
    );
  }

  Future<int> delete(Post post) async {
    final finder = Finder(filter: Filter.byKey(post.id));
    return await _firebaseStore.delete(
      _db,
      finder: finder,
    );
  }

  Future deleteAll() async {
    await _firebaseStore.drop(
      _db,
    );
  }
}
