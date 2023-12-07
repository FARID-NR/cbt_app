import 'dart:convert';

class StoresoalRequestModel {
    final String matkulId;
    final String soal;
    final String tingkat;
    final String gambarSoal;
    final int id;

    StoresoalRequestModel({
        required this.matkulId,
        required this.soal,
        required this.tingkat,
        required this.gambarSoal,
        required this.id,
    });

    factory StoresoalRequestModel.fromJson(String str) => StoresoalRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory StoresoalRequestModel.fromMap(Map<String, dynamic> json) => StoresoalRequestModel(
        matkulId: json["matkul_id"],
        soal: json["soal"],
        tingkat: json["tingkat"],
        gambarSoal: json["gambar_soal"],
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "matkul_id": matkulId,
        "soal": soal,
        "tingkat": tingkat,
        "gambar_soal": gambarSoal,
        "id": id,
    };
}
