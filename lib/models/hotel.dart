class HotelModel {
  final String name;
  final String image;
  final String detail;
  final String price;
  final String shortDetail;
  final String address;
  final double rating;

  HotelModel(
      {this.name,
      this.image,
      this.detail,
      this.price,
      this.shortDetail,
      this.address,
      this.rating});

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        name: json['name'],
        image: json['image'],
        detail: json['detail'],
        price: json['price'],
        shortDetail: json['shortDetail'],
        address: json['address'],
        rating: json['rating'],
      );
}
