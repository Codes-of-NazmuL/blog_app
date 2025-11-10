class PostsDataModel {
  int userId;
  int id;
  String title;
  String body;

  PostsDataModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostsDataModel.fromJson(Map<String, dynamic> json) => PostsDataModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
