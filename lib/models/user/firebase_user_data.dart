class FirebaseUserData {
  String? displayName;
  String? email;
  String? photoURL;
  String? uid;
  String? privateKey;
  String? publicKey;

  FirebaseUserData(
      {this.displayName,
      this.email,
      this.photoURL,
      this.uid,
      this.privateKey,
      this.publicKey});

  factory FirebaseUserData.fromMap(Map<String, dynamic> json) =>
      FirebaseUserData(
        displayName: json["displayName"],
        email: json["email"],
        photoURL: json["photoURL"],
        uid: json["uid"],
        privateKey: json["privateKey"],
        publicKey: json["publicKey"],
      );

  Map<String, dynamic> toMap() => {
        "displayName": displayName,
        "email": email,
        "photoURL": photoURL,
        "uid": uid,
        "privateKey": privateKey,
        "publicKey": publicKey,
      };
}
