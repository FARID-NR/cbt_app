import 'package:meta/meta.dart';
import 'dart:convert';

class LoginResponseModel {
    final bool success;
    final String message;
    final Data data;

    LoginResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory LoginResponseModel.fromJson(String str) => LoginResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginResponseModel.fromMap(Map<String, dynamic> json) => LoginResponseModel(
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
    String token;
    String roles;

    Data({
        required this.token,
        required this.roles,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        token: json["token"],
        roles: json["roles"],
    );

    Map<String, dynamic> toMap() => {
        "token": token,
        "roles": roles,
    };
}
