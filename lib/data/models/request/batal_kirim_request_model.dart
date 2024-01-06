import 'dart:convert';

class KirimSkRequestModel {
    final String finishDate;
    final String finishTime;

    KirimSkRequestModel({
        required this.finishDate,
        required this.finishTime,
    });

    factory KirimSkRequestModel.fromJson(String str) => KirimSkRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory KirimSkRequestModel.fromMap(Map<String, dynamic> json) => KirimSkRequestModel(
        finishDate: json["finish_date"],
        finishTime: json["finish_time"],
    );

    Map<String, dynamic> toMap() => {
        "finish_date": finishDate,
        "finish_time": finishTime,
    };
}
