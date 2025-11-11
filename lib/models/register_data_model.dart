class RegisterDataModel {
  bool success;
  String message;
  Data data;

  RegisterDataModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      RegisterDataModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  User user;
  String token;
  String tokenType;
  int expiresIn;

  Data({
    required this.user,
    required this.token,
    required this.tokenType,
    required this.expiresIn,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    token: json["token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
    "token_type": tokenType,
    "expires_in": expiresIn,
  };
}

class User {
  int id;
  String name;
  String email;
  String phone;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
  };
}
