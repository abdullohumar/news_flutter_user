class CategoryModel {
  int id;
  String image;
  String name;
  String slug;

  CategoryModel({required this.id, required this.image, required this.name, required this.slug});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}