import 'dart:convert';

class PenilaianRequestModel {
    final String finishDate;
    final String finishTime;

    PenilaianRequestModel({
        required this.finishDate,
        required this.finishTime,
    });

    factory PenilaianRequestModel.fromJson(String str) => PenilaianRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PenilaianRequestModel.fromMap(Map<String, dynamic> json) => PenilaianRequestModel(
        finishDate: json["finish_date"],
        finishTime: json["finish_time"],
    );

    Map<String, dynamic> toMap() => {
        "finish_date": finishDate,
        "finish_time": finishTime,
    };
}
