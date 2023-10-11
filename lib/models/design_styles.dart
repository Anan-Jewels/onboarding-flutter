class DesignStyles {
  final DateTime? createdAt;
  final String? name;
  final String? image;
  final String? id;

  DesignStyles({
    this.createdAt,
    this.name,
    this.image,
    this.id,
  });

  factory DesignStyles.fromJson(Map<String, dynamic> json) => DesignStyles(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        name: json["name"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "name": name,
        "image": image,
        "id": id,
      };
}
