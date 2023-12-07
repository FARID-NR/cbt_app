import 'dart:convert';

class RegisterResponseModel {
    final bool success;
    final String message;
    final Data data;

   RegisterResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory RegisterResponseModel.fromJson(String str) => RegisterResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RegisterResponseModel.fromMap(Map<String, dynamic> json) => RegisterResponseModel(
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
    final String matkulId;
    final String soal;
    final String tingkat;
    final String gambarSoal;
    final int id;

    Data({
        required this.matkulId,
        required this.soal,
        required this.tingkat,
        required this.gambarSoal,
        required this.id,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
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
