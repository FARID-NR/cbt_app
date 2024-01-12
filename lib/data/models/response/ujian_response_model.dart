import 'dart:convert';

class UjianResponseModel {
    final bool success;
    final String message;
    final Data data;

    UjianResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory UjianResponseModel.fromJson(String str) => UjianResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UjianResponseModel.fromMap(Map<String, dynamic> json) => UjianResponseModel(
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
    final Mahasiswa mahasiswa;
    final Matkul matkul;
    final List<Soal> soal;

    Data({
        required this.mahasiswa,
        required this.matkul,
        required this.soal,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        mahasiswa: Mahasiswa.fromMap(json["mahasiswa"]),
        matkul: Matkul.fromMap(json["matkul"]),
        soal: List<Soal>.from(json["soal"].map((x) => Soal.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "mahasiswa": mahasiswa.toMap(),
        "matkul": matkul.toMap(),
        "soal": List<dynamic>.from(soal.map((x) => x.toMap())),
    };
}

class Mahasiswa {
    final int id;
    final String nama;
    final String roles;

    Mahasiswa({
        required this.id,
        required this.nama,
        required this.roles,
    });

    factory Mahasiswa.fromJson(String str) => Mahasiswa.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Mahasiswa.fromMap(Map<String, dynamic> json) => Mahasiswa(
        id: json["id"],
        nama: json["nama"],
        roles: json["roles"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "roles": roles,
    };
}

class Matkul {
    final int id;
    final String nama;
    final String finishDate;
    final String finishTime;

    Matkul({
        required this.id,
        required this.nama,
        required this.finishDate,
        required this.finishTime,
    });

    factory Matkul.fromJson(String str) => Matkul.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Matkul.fromMap(Map<String, dynamic> json) => Matkul(
        id: json["id"],
        nama: json["nama"],
        finishDate: json["finish_date"],
        finishTime: json["finish_time"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
    };
}

class Soal {
    final int id;
    final String soal;
    final String gambarSoal;
    final List<Jawaban> jawaban;

    Soal({
        required this.id,
        required this.soal,
        required this.gambarSoal,
        required this.jawaban,
    });

    factory Soal.fromJson(String str) => Soal.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Soal.fromMap(Map<String, dynamic> json) => Soal(
        id: json["id"] ?? '',
        soal: json["soal"] ?? '',
        gambarSoal: json["gambar_soal"] ?? '',
        jawaban: List<Jawaban>.from(json["jawaban"].map((x) => Jawaban.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "soal": soal,
        "gambar_soal": gambarSoal,
        "jawaban": List<dynamic>.from(jawaban.map((x) => x.toMap())),
    };
}

class Jawaban {
    final int id;
    final dynamic jawaban;
    final String gambarJawaban;

    Jawaban({
        required this.id,
        required this.jawaban,
        required this.gambarJawaban,
    });

    factory Jawaban.fromJson(String str) => Jawaban.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Jawaban.fromMap(Map<String, dynamic> json) => Jawaban(
        id: json["id"] ?? '',
        jawaban: json["jawaban"] ?? '',
        gambarJawaban: json["gambar_jawaban"] ?? '',
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "jawaban": jawaban,
        "gambar_jawaban": gambarJawaban,
    };
}
