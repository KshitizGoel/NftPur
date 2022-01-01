import 'firebase_user_data.dart';

class UserList {
  final List<FirebaseUserData>? users;

  UserList({
    this.users,
  });

  factory UserList.fromJson(List<dynamic> json) {
    List<FirebaseUserData> users = <FirebaseUserData>[];
    users = json.map((users) => FirebaseUserData.fromMap(users)).toList();

    return UserList(
      users: users,
    );
  }
}
