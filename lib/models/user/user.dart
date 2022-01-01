class UserData {
  String? displayName;
  String? email;
  String? photoURL;
  String? uid;

  UserData({
    this.displayName,
    this.email,
    this.photoURL,
    this.uid,
  });

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        displayName: json["displayName"],
        email: json["email"],
        photoURL: json["photoURL"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "displayName": displayName,
        "email": email,
        "photoURL": photoURL,
        "uid": uid,
      };
}
