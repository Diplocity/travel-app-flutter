class AttractionCategory {
  String category;
  List<Attraction> attractions;

  AttractionCategory({
    this.category,
    this.attractions,
  });

  factory AttractionCategory.fromJson(Map<String, dynamic> json) =>
      AttractionCategory(
        category: json['category'],
        attractions: json['attractions'] != null
            ? (json['attractions'] as List)
                .map((value) => new Attraction.fromJson(value))
                .toList()
            : [],
      );
}

class Attraction {
  String name;
  String detail;
  String shortDetail;
  String image;
  String country;

  Attraction(
      {this.name, this.detail, this.shortDetail, this.image, this.country});

  factory Attraction.fromJson(Map<String, dynamic> json) => Attraction(
        name: json['name'],
        detail: json['detail'],
        shortDetail: json['shortDetail'],
        image: json['image'],
        country: json['country'],
      );
}
