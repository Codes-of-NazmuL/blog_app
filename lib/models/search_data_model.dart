class SearchDataModel {
  bool success;
  String message;
  Data data;

  SearchDataModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SearchDataModel.fromJson(Map<String, dynamic> json) =>
      SearchDataModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  List<Post> posts;
  String searchTerm;
  Pagination pagination;

  Data({
    required this.posts,
    required this.searchTerm,
    required this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    searchTerm: json["search_term"],
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
    "search_term": searchTerm,
    "pagination": pagination.toJson(),
  };
}

class Pagination {
  int currentPage;
  int perPage;
  int totalPosts;
  int totalPages;

  Pagination({
    required this.currentPage,
    required this.perPage,
    required this.totalPosts,
    required this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json["current_page"],
    perPage: json["per_page"],
    totalPosts: json["total_posts"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "per_page": perPage,
    "total_posts": totalPosts,
    "total_pages": totalPages,
  };
}

class Post {
  int id;
  String title;
  String excerpt;
  dynamic featuredImage;
  Author author;
  List<String> categories;
  int readTime;
  DateTime createdAt;
  int likeCount;
  String commentCount;
  bool isLiked;
  bool isBookmarked;

  Post({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.featuredImage,
    required this.author,
    required this.categories,
    required this.readTime,
    required this.createdAt,
    required this.likeCount,
    required this.commentCount,
    required this.isLiked,
    required this.isBookmarked,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    title: json["title"],
    excerpt: json["excerpt"],
    featuredImage: json["featured_image"],
    author: Author.fromJson(json["author"]),
    categories: List<String>.from(json["categories"].map((x) => x)),
    readTime: json["read_time"],
    createdAt: DateTime.parse(json["created_at"]),
    likeCount: json["like_count"],
    commentCount: json["comment_count"],
    isLiked: json["is_liked"],
    isBookmarked: json["is_bookmarked"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "excerpt": excerpt,
    "featured_image": featuredImage,
    "author": author.toJson(),
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "read_time": readTime,
    "created_at": createdAt.toIso8601String(),
    "like_count": likeCount,
    "comment_count": commentCount,
    "is_liked": isLiked,
    "is_bookmarked": isBookmarked,
  };
}

class Author {
  int id;
  String name;
  String avatar;

  Author({required this.id, required this.name, required this.avatar});

  factory Author.fromJson(Map<String, dynamic> json) =>
      Author(id: json["id"], name: json["name"], avatar: json["avatar"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name, "avatar": avatar};
}
