class NewList {
  NewList({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int? count;

  String? next;
  dynamic previous;
  List<Result> results;

  factory NewList.fromJson(Map<String, dynamic> json) => NewList(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.createdAt,
    required this.image,
    required this.title,
    required this.content,
    required this.category,
  });

  int? id;
  dynamic createdAt;
  String? image;
  String? title;
  String? content;
  int? category;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        image: json["image"],
        title: json["title"],
        content: json["content"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "image": image,
        "title": title,
        "content": content,
        "category": category,
      };
}
