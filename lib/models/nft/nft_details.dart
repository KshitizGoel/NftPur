class NftDetails {
  String nftName, imageAddress, nftDescription, nftPrice;

  NftDetails(
      {required this.nftName,
      required this.imageAddress,
      required this.nftDescription,
      required this.nftPrice});
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
