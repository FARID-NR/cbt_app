import 'package:meta/meta.dart';
import 'dart:convert';

class DashboardMhsResponseModel {
    final bool success;
    final String message;
    final Data data;

    DashboardMhsResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory DashboardMhsResponseModel.fromJson(String str) => DashboardMhsResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DashboardMhsResponseModel.fromMap(Map<String, dynamic> json) => DashboardMhsResponseModel(
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
    final User user;
    final Penguji penguji;

    Data({
        required this.user,
        required this.penguji,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        user: User.fromMap(json["user"]),
        penguji: Penguji.fromMap(json["penguji"]),
    );

    Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "penguji": penguji.toMap(),
    };
}

class Penguji {
    final Penguji1Class penguji1;
    final Penguji1Class penguji2;
    final Penguji1Class penguji3;

    Penguji({
        required this.penguji1,
        required this.penguji2,
        required this.penguji3,
    });

    factory Penguji.fromJson(String str) => Penguji.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Penguji.fromMap(Map<String, dynamic> json) => Penguji(
        penguji1: Penguji1Class.fromMap(json["penguji_1"]),
        penguji2: Penguji1Class.fromMap(json["penguji_2"]),
        penguji3: Penguji1Class.fromMap(json["penguji_3"]),
    );

    Map<String, dynamic> toMap() => {
        "penguji_1": penguji1.toMap(),
        "penguji_2": penguji2.toMap(),
        "penguji_3": penguji3.toMap(),
    };
}

class Penguji1Class {
    final String userId;
    final String nama;
    final String matkulId;
    final String matkulNama;

    Penguji1Class({
        required this.userId,
        required this.nama,
        required this.matkulId,
        required this.matkulNama,
    });

    factory Penguji1Class.fromJson(String str) => Penguji1Class.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Penguji1Class.fromMap(Map<String, dynamic> json) => Penguji1Class(
        userId: json["user_id"],
        nama: json["nama"],
        matkulId: json["matkul_id"],
        matkulNama: json["matkul_nama"],
    );

    Map<String, dynamic> toMap() => {
        "user_id": userId,
        "nama": nama,
        "matkul_id": matkulId,
        "matkul_nama": matkulNama,
    };
}

class User {
    final int id;
    final String nama;
    final String username;
    final String roles;
    final String skKompren;
    final String penguji;
    final String nilai;
    final int isVerification;
    final DateTime createdAt;
    final DateTime updatedAt;

    User({
        required this.id,
        required this.nama,
        required this.username,
        required this.roles,
        required this.skKompren,
        required this.penguji,
        required this.nilai,
        required this.isVerification,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        nama: json["nama"],
        username: json["username"],
        roles: json["roles"],
        skKompren: json["sk_kompren"],
        penguji: json["penguji"],
        nilai: json["nilai"],
        isVerification: json["is_verification"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "username": username,
        "roles": roles,
        "sk_kompren": skKompren,
        "penguji": penguji,
        "nilai": nilai,
        "is_verification": isVerification,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
