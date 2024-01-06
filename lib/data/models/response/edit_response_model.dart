import 'dart:convert';

class EditResponseModel {
    final String soal;
    final String tingkat;
    final String gambarSoal;

    EditResponseModel({
        required this.soal,
        required this.tingkat,
        required this.gambarSoal,
    });

    factory EditResponseModel.fromJson(String str) => EditResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EditResponseModel.fromMap(Map<String, dynamic> json) => EditResponseModel(
        soal: json["soal"] ?? '',
        tingkat: json["tingkat"] ?? '',
        gambarSoal: json["gambar_soal"] ?? '',
    );

    Map<String, dynamic> toMap() => {
        "soal": soal,
        "tingkat": tingkat,
        "gambar_soal": gambarSoal,
    };
}
