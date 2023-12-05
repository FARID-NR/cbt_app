import 'dart:convert';

class EndpointResponseModel {
    final bool success;
    final String message;
    final List<Endpoint> data;

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
        data: List<Endpoint>.from(json["data"].map((x) => Endpoint.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Endpoint {
    final int id;
    final String nama;
    final int userId;
    final DateTime finishDate;
    final String finishTime;
    final DateTime createdAt;
    final DateTime updatedAt;

    Endpoint({
        required this.id,
        required this.nama,
        required this.userId,
        required this.finishDate,
        required this.finishTime,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Endpoint.fromJson(String str) => Endpoint.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Endpoint.fromMap(Map<String, dynamic> json) => Endpoint(
        id: json["id"],
        nama: json["nama"],
        userId: json["user_id"],
        finishDate: DateTime.parse(json["finish_date"]),
        finishTime: json["finish_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "user_id": userId,
        "finish_date": "${finishDate.year.toString().padLeft(4, '0')}-${finishDate.month.toString().padLeft(2, '0')}-${finishDate.day.toString().padLeft(2, '0')}",
        "finish_time": finishTime,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
