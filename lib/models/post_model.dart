class Post {
  final int id;
  final String title;
  final String slug;
  final int categoryId;
  final int userId;
  final String content;
  final String image;
  final User user;
  final Category category;

  Post({
    required this.id,
    required this.title,
    required this.slug,
    required this.categoryId,
    required this.userId,
    required this.content,
    required this.image,
    required this.user,
    required this.category,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      categoryId: json['category_id'],
      userId: json['user_id'],
      content: json['content'],
      image: json['image'],
      user: User.fromJson(json['user']),
      category: Category.fromJson(json['category']),
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

class Category {
  final int id;
  final String image;
  final String name;
  final String slug;

  Category({
    required this.id,
    required this.image,
    required this.name,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}