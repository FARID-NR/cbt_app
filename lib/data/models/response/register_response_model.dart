import 'dart:convert';

class RegisterResponseModel {
    final bool success;
    final String message;
    final Data data;

    RegisterResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory RegisterResponseModel.fromJson(String str) => RegisterResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RegisterResponseModel.fromMap(Map<String, dynamic> json) => RegisterResponseModel(
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
    final String nama;
    final String username;

    Data({
        required this.nama,
        required this.username,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        nama: json["nama"],
        username: json["username"],
    );

    Map<String, dynamic> toMap() => {
        "nama": nama,
        "username": username,
    };
}
