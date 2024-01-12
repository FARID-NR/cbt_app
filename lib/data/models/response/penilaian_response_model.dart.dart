import 'dart:convert';

class PenilaianResponseModel {
    final bool success;
    final String message;
    final Data data;

    PenilaianResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory PenilaianResponseModel.fromJson(String str) => PenilaianResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PenilaianResponseModel.fromMap(Map<String, dynamic> json) => PenilaianResponseModel(
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
    final Dosen dosen;
    final List<Mahasiswa> mahasiswa;
    final Matkul matkul;

    Data({
        required this.dosen,
        required this.mahasiswa,
        required this.matkul,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        dosen: Dosen.fromMap(json["dosen"]),
        mahasiswa: List<Mahasiswa>.from(json["mahasiswa"].map((x) => Mahasiswa.fromMap(x))),
        matkul: Matkul.fromMap(json["matkul"]),
    );

    Map<String, dynamic> toMap() => {
        "dosen": dosen.toMap(),
        "mahasiswa": List<dynamic>.from(mahasiswa.map((x) => x.toMap())),
        "matkul": matkul.toMap(),
    };
}

class Dosen {
    final int id;
    final String nama;
    final String roles;

    Dosen({
        required this.id,
        required this.nama,
        required this.roles,
    });

    factory Dosen.fromJson(String str) => Dosen.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Dosen.fromMap(Map<String, dynamic> json) => Dosen(
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

class Mahasiswa {
    final int id;
    final String nama;
    final String username;
    final String roles;
    final String skKompren;
    final Penguji penguji;
    final Nilai nilai;

    Mahasiswa({
        required this.id,
        required this.nama,
        required this.username,
        required this.roles,
        required this.skKompren,
        required this.penguji,
        required this.nilai,
    });

    factory Mahasiswa.fromJson(String str) => Mahasiswa.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Mahasiswa.fromMap(Map<String, dynamic> json) => Mahasiswa(
        id: json["id"],
        nama: json["nama"],
        username: json["username"],
        roles: json["roles"],
        skKompren: json["sk_kompren"],
        penguji: Penguji.fromMap(json["penguji"]),
        nilai: Nilai.fromMap(json["nilai"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "username": username,
        "roles": roles,
        "sk_kompren": skKompren,
        "penguji": penguji.toMap(),
        "nilai": nilai.toMap(),
    };
}

class Nilai {
    final NilaiPenguji nilaiPenguji1;
    final NilaiPenguji nilaiPenguji2;
    final NilaiPenguji nilaiPenguji3;

    Nilai({
        required this.nilaiPenguji1,
        required this.nilaiPenguji2,
        required this.nilaiPenguji3,
    });

    factory Nilai.fromJson(String str) => Nilai.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Nilai.fromMap(Map<String, dynamic> json) => Nilai(
        nilaiPenguji1: NilaiPenguji.fromMap(json["nilai_penguji_1"]),
        nilaiPenguji2: NilaiPenguji.fromMap(json["nilai_penguji_2"]),
        nilaiPenguji3: NilaiPenguji.fromMap(json["nilai_penguji_3"]),
    );

    Map<String, dynamic> toMap() => {
        "nilai_penguji_1": nilaiPenguji1.toMap(),
        "nilai_penguji_2": nilaiPenguji2.toMap(),
        "nilai_penguji_3": nilaiPenguji3.toMap(),
    };
}

class NilaiPenguji {
    final String sk;
    final bool remidial;
    final String keterangan;
    final dynamic nilaiUjian;
    final int jumlahBenar;
    final int jumlahSalah;
    final int nilaiRemidial;

    NilaiPenguji({
        required this.sk,
        required this.remidial,
        required this.keterangan,
        required this.nilaiUjian,
        required this.jumlahBenar,
        required this.jumlahSalah,
        required this.nilaiRemidial,
    });

    factory NilaiPenguji.fromJson(String str) => NilaiPenguji.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NilaiPenguji.fromMap(Map<String, dynamic> json) => NilaiPenguji(
        sk: json["sk"] ?? '',
        remidial: json["remidial"],
        keterangan: json["keterangan"] ?? '',
        nilaiUjian: json["nilai_ujian"],
        jumlahBenar: json["jumlah_benar"],
        jumlahSalah: json["jumlah_salah"],
        nilaiRemidial: json["nilai_remidial"] ?? 0,
    );

    Map<String, dynamic> toMap() => {
        "sk": sk,
        "remidial": remidial,
        "keterangan": keterangan,
        "nilai_ujian": nilaiUjian,
        "jumlah_benar": jumlahBenar,
        "jumlah_salah": jumlahSalah,
        "nilai_remidial": nilaiRemidial,
    };
}

class Penguji {
    final Penguji1Class penguji1;
    final Penguji1Class penguji2;
    final Penguji1Class penguji3;

    Penguji({
        required this.penguji1,
        required this.penguji2,
        required this.penguji3,
    });

    factory Penguji.fromJson(String str) => Penguji.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Penguji.fromMap(Map<String, dynamic> json) => Penguji(
        penguji1: Penguji1Class.fromMap(json["penguji_1"]),
        penguji2: Penguji1Class.fromMap(json["penguji_2"]),
        penguji3: Penguji1Class.fromMap(json["penguji_3"]),
    );

    Map<String, dynamic> toMap() => {
        "penguji_1": penguji1.toMap(),
        "penguji_2": penguji2.toMap(),
        "penguji_3": penguji3.toMap(),
    };
}

class Penguji1Class {
    final String userId;
    final String matkulId;
    final bool dapatUjian;

    Penguji1Class({
        required this.userId,
        required this.matkulId,
        required this.dapatUjian,
    });

    factory Penguji1Class.fromJson(String str) => Penguji1Class.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Penguji1Class.fromMap(Map<String, dynamic> json) => Penguji1Class(
        userId: json["user_id"],
        matkulId: json["matkul_id"],
        dapatUjian: json["dapat_ujian"],
    );

    Map<String, dynamic> toMap() => {
        "user_id": userId,
        "matkul_id": matkulId,
        "dapat_ujian": dapatUjian,
    };
}

class Matkul {
    final int id;
    final String nama;

    Matkul({
        required this.id,
        required this.nama,
    });

    factory Matkul.fromJson(String str) => Matkul.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Matkul.fromMap(Map<String, dynamic> json) => Matkul(
        id: json["id"],
        nama: json["nama"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
    };
}
