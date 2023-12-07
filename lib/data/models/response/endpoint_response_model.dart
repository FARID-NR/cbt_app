import 'dart:convert';

class EndpointResponseModel {
    final bool success;
    final String message;
    final List<User> data;

    EndpointResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory EndpointResponseModel.fromJson(String str) => EndpointResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EndpointResponseModel.fromMap(Map<String, dynamic> json) => EndpointResponseModel(
        success: json["success"],
        message: json["message"],
        data: List<User>.from(json["data"].map((x) => User.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class User {
    final int id;
    final String nama;
    final int userId;

    User({
        required this.id,
        required this.nama,
        required this.userId,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        nama: json["nama"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "user_id": userId,
    };
}
