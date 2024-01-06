import 'package:meta/meta.dart';
import 'dart:convert';

class EditJawabanResponseModel {
    final bool success;
    final String message;
    final Data data;

    EditJawabanResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory EditJawabanResponseModel.fromJson(String str) => EditJawabanResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EditJawabanResponseModel.fromMap(Map<String, dynamic> json) => EditJawabanResponseModel(
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
    final A a;
    final A b;
    final A c;
    final A d;
    final A e;

    Data({
        required this.soal,
        required this.a,
        required this.b,
        required this.c,
        required this.d,
        required this.e,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        soal: Soal.fromMap(json["soal"]),
        a: A.fromMap(json["a"]),
        b: A.fromMap(json["b"]),
        c: A.fromMap(json["c"]),
        d: A.fromMap(json["d"]),
        e: A.fromMap(json["e"]),
    );

    Map<String, dynamic> toMap() => {
        "soal": soal.toMap(),
        "a": a.toMap(),
        "b": b.toMap(),
        "c": c.toMap(),
        "d": d.toMap(),
        "e": e.toMap(),
    };
}

class A {
    final int id;
    final String jawaban;
    final String gambarJawaban;
    final int isCorrect;

    A({
        required this.id,
        required this.jawaban,
        required this.gambarJawaban,
        required this.isCorrect,
    });

    factory A.fromJson(String str) => A.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory A.fromMap(Map<String, dynamic> json) => A(
        id: json["id"],
        jawaban: json["jawaban"],
        gambarJawaban: json["gambar_jawaban"],
        isCorrect: json["is_correct"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "jawaban": jawaban,
        "gambar_jawaban": gambarJawaban,
        "is_correct": isCorrect,
    };
}

class Soal {
    final int id;
    final String soal;
    final String gambarSoal;
    final String tingkat;
    final int matkulId;

    Soal({
        required this.id,
        required this.soal,
        required this.gambarSoal,
        required this.tingkat,
        required this.matkulId,
    });

    factory Soal.fromJson(String str) => Soal.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Soal.fromMap(Map<String, dynamic> json) => Soal(
        id: json["id"],
        soal: json["soal"],
        gambarSoal: json["gambar_soal"],
        tingkat: json["tingkat"],
        matkulId: json["matkul_id"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "soal": soal,
        "gambar_soal": gambarSoal,
        "tingkat": tingkat,
        "matkul_id": matkulId,
    };
}
