class UserData {
  String? displayName;
  String? email;
  String? photoURL;

  UserData({
    this.displayName,
    this.email,
    this.photoURL,
  });

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        displayName: json["displayName"],
        email: json["email"],
        photoURL: json["photoURL"],
      );

  Map<String, dynamic> toMap() => {
        "displayName": displayName,
        "email": email,
        "photoURL": photoURL,
      };
}
