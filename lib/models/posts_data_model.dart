// --- Full Corrected Data Model ---

class PostsDataModel {
  bool success;
  String message;
  Data data;

  PostsDataModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory PostsDataModel.fromJson(Map<String, dynamic> json) => PostsDataModel(
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
  Pagination pagination;

  Data({required this.posts, required this.pagination});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
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
  String content;
  String featuredImage; // Corrected: Was dynamic
  Author author;
  List<String> categories;
  int readTime;
  DateTime createdAt;
  DateTime updatedAt;
  int likeCount; // Corrected: Was int, but API sends String/int
  int commentCount; // Corrected: Was String
  bool isLiked;
  bool isBookmarked;

  Post({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.content,
    required this.featuredImage,
    required this.author,
    required this.categories,
    required this.readTime,
    required this.createdAt,
    required this.updatedAt,
    required this.likeCount,
    required this.commentCount,
    required this.isLiked,
    required this.isBookmarked,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    title: json["title"],
    excerpt: json["excerpt"],
    content: json["content"],
    featuredImage: json["featured_image"],
    author: Author.fromJson(json["author"]),
    categories: List<String>.from(json["categories"].map((x) => x)),
    readTime: json["read_time"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),

    // --- FIX ---
    // Robustly handles both int (0) and String ("1") from the API
    likeCount: int.tryParse(json["like_count"].toString()) ?? 0,

    // --- FIX ---
    // Robustly handles String ("0") from the API
    commentCount: int.tryParse(json["comment_count"].toString()) ?? 0,

    isLiked: json["is_liked"],
    isBookmarked: json["is_bookmarked"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "excerpt": excerpt,
    "content": content,
    "featured_image": featuredImage,
    "author": author.toJson(),
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "read_time": readTime,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
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

// The unused 'EnumValues' class has been removed.
