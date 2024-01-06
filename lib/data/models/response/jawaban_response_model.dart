import 'dart:convert';

class JawabanResponseModel {
    final bool success;
    final String message;
    final Data data;

    JawabanResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory JawabanResponseModel.fromJson(String str) => JawabanResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory JawabanResponseModel.fromMap(Map<String, dynamic> json) => JawabanResponseModel(
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
    final Soal soal;
    final List<Jawaban> jawaban;

    Data({
        required this.soal,
        required this.jawaban,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        soal: Soal.fromMap(json["soal"]),
        jawaban: List<Jawaban>.from(json["jawaban"].map((x) => Jawaban.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "soal": soal.toMap(),
        "jawaban": List<dynamic>.from(jawaban.map((x) => x.toMap())),
    };
}

class Jawaban {
    final int id;
    final String jawaban;
    final String gambarJawaban;
    final bool isCorrect;
    final int soalId;
    final DateTime createdAt;
    final DateTime updatedAt;

    Jawaban({
        required this.id,
        required this.jawaban,
        required this.gambarJawaban,
        required this.isCorrect,
        required this.soalId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Jawaban.fromJson(String str) => Jawaban.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Jawaban.fromMap(Map<String, dynamic> json) => Jawaban(
        id: json["id"],
        jawaban: json["jawaban"],
        gambarJawaban: json["gambar_jawaban"] ?? '',
        isCorrect: json["is_correct"],
        soalId: json["soal_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "jawaban": jawaban,
        "gambar_jawaban": gambarJawaban,
        "is_correct": isCorrect,
        "soal_id": soalId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Soal {
    final int id;
    final String soal;
    final dynamic gambarSoal;
    final String tingkat;
    final int matkulId;
    final DateTime createdAt;
    final DateTime updatedAt;

    Soal({
        required this.id,
        required this.soal,
        required this.gambarSoal,
        required this.tingkat,
        required this.matkulId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Soal.fromJson(String str) => Soal.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Soal.fromMap(Map<String, dynamic> json) => Soal(
        id: json["id"],
        soal: json["soal"],
        gambarSoal: json["gambar_soal"],
        tingkat: json["tingkat"],
        matkulId: json["matkul_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "soal": soal,
        "gambar_soal": gambarSoal,
        "tingkat": tingkat,
        "matkul_id": matkulId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
