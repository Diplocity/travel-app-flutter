class Friend{
  final String name;
  final String image;

  Friend({required this.name, required this.image});

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
    name: json['name'],
    image: json['image'],
  );
}