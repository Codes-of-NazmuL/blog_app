class ProfileDataModel {
    bool success;
    String message;
    Data data;

    ProfileDataModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory ProfileDataModel.fromJson(Map<String, dynamic> json) => ProfileDataModel(
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
    User user;

    Data({
        required this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
    };
}

class User {
    int id;
    String name;
    String email;
    String phone;
    DateTime registeredDate;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.registeredDate,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        registeredDate: DateTime.parse(json["registered_date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "registered_date": registeredDate.toIso8601String(),
    };
}
