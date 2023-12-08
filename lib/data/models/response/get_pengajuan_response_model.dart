import 'dart:convert';

class PengajuanResponseModel {
    final bool success;
    final String message;
    final Data data;

    PengajuanResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory PengajuanResponseModel.fromJson(String str) => PengajuanResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PengajuanResponseModel.fromMap(Map<String, dynamic> json) => PengajuanResponseModel(
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

    Mahasiswa({
        required this.id,
        required this.nama,
        required this.username,
        required this.roles,
        required this.skKompren,
        required this.penguji,
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
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "username": username,
        "roles": roles,
        "sk_kompren": skKompren,
        "penguji": penguji.toMap(),
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
