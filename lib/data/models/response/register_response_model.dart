import 'package:meta/meta.dart';
import 'dart:convert';

class RegistertResponseModel {
  final bool success;
  final String message;

  RegistertResponseModel({
    required this.success,
    required this.message,
  });

  factory RegistertResponseModel.fromJson(String str) =>
      RegistertResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegistertResponseModel.fromMap(Map<String, dynamic> json) =>
      RegistertResponseModel(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
      };
}
