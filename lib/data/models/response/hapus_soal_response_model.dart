import 'dart:convert';

class HapusResponseModel {
    final bool success;
    final String message;
    final dynamic data;

    HapusResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory HapusResponseModel.fromJson(String str) => HapusResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory HapusResponseModel.fromMap(Map<String, dynamic> json) => HapusResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data,
    };
}
