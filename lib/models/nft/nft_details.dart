class NFTData {
  String nftName, imageAddress, nftDescription, nftPrice;

  NFTData(
      {required this.nftName,
      required this.imageAddress,
      required this.nftDescription,
      required this.nftPrice});

  factory NFTData.fromMap(Map<String, dynamic> json) => NFTData(
        nftName: json["nftName"],
        imageAddress: json["imageAddress"],
        nftDescription: json["nftDescription"],
        nftPrice: json["nftPrice"],
      );

  Map<String, dynamic> toMap() => {
        "nftName": nftName,
        "imageAddress": imageAddress,
        "nftDescription": nftDescription,
        "nftPrice": nftPrice,
      };
}

class NFTMetaData {
  String nftName, nftDescription, nftPrice;

  NFTMetaData(
      {required this.nftName,
      required this.nftDescription,
      required this.nftPrice});

  factory NFTMetaData.fromMap(Map<String, dynamic> json) => NFTMetaData(
        nftName: json["nftName"],
        nftDescription: json["nftDescription"],
        nftPrice: json["nftPrice"],
      );

  Map<String, dynamic> toMap() => {
        "nftName": nftName,
        "nftDescription": nftDescription,
        "nftPrice": nftPrice,
      };
}
