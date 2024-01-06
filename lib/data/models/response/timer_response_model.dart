import 'dart:convert';

class TimerResponseModel {
    final bool success;
    final String message;
    final Data data;

    TimerResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory TimerResponseModel.fromJson(String str) => TimerResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TimerResponseModel.fromMap(Map<String, dynamic> json) => TimerResponseModel(
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
    final int userId;
    final String finishDate;
    final String finishTime;

    Data({
        required this.id,
        required this.nama,
        required this.userId,
        required this.finishDate,
        required this.finishTime
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        nama: json["nama"],
        userId: json["user_id"],
        finishDate: json["finish_date"],
        finishTime: json["finish_time"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "user_id": userId,
        "finish_date": finishDate,
        "finish_time": finishTime,
    };
}
