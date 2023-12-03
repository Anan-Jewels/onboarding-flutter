class OnboardingModel {
  String? createdAt;
  String? name;
  String? image;
  String? id;
  bool? isSelected;

  OnboardingModel({
    this.createdAt,
    this.name,
    this.image,
    this.id,
    this.isSelected,
  });

  OnboardingModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    image = json['image'];
    id = json['id'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['createdAt'] = createdAt;
    data['name'] = name;
    data['image'] = image;
    data['id'] = id;
    data['isSelected'] = isSelected;
    return data;
  }
}
