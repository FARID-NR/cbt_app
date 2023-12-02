import 'dart:convert';

class AuthResponseModel {
    final bool success;
    final String message;
    final Data data;

    AuthResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data.toMap(),
    };
}

class Data {
    final String token;
    final String nama;
    final String username;
    final String roles;

    Data({
        required this.token,
        required this.nama,
        required this.username,
        required this.roles,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        token: json["token"],
        nama: json["nama"],
        username: json["username"],
        roles: json["roles"],
    );

    Map<String, dynamic> toMap() => {
        "token": token,
        "nama": nama,
        "username": username,
        "roles": roles,
    };
}
