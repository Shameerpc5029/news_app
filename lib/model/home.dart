class NewsModel {
  NewsModel({
    required this.status,
    required this.blogsCategory,
  });

  bool status;
  List<BlogsCategory> blogsCategory;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        blogsCategory: List<BlogsCategory>.from(
            json["blogs_category"].map((x) => BlogsCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "blogs_category":
            List<dynamic>.from(blogsCategory.map((x) => x.toJson())),
      };
}

class BlogsCategory {
  BlogsCategory({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory BlogsCategory.fromJson(Map<String, dynamic> json) => BlogsCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
