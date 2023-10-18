class Product {
  final String id;
  final String image;
  final String name;
  final DateTime? createdAt;

  Product(
      {required this.id,
      required this.image,
      required this.name,
      this.createdAt});

  factory Product.fromJson(Map json) {
    return Product(
        id: json['id'],
        image: json['image'],
        name: json['name'],
        createdAt: json['createdAt'] != null
            ? DateTime.tryParse(json['createdAt'])
            : null);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['image'] = image;
    json['name'] = name;
    json['createdAt'] = createdAt?.toIso8601String();
    return json;
  }
}
