import 'package:meta/meta.dart';
import 'dart:convert';

class DapatUjianResponseModel {
  final bool success;
  final String message;
  final Data data;

  DapatUjianResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DapatUjianResponseModel.fromJson(String str) =>
      DapatUjianResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DapatUjianResponseModel.fromMap(Map<String, dynamic> json) =>
      DapatUjianResponseModel(
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

  Data({
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

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
