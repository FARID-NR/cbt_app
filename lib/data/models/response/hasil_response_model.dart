import 'dart:convert';

class HasilUjianResponseModel {
    final bool success;
    final String message;
    final Data data;

    HasilUjianResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory HasilUjianResponseModel.fromJson(String str) => HasilUjianResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory HasilUjianResponseModel.fromMap(Map<String, dynamic> json) => HasilUjianResponseModel(
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
    final dynamic nilaiAsli;
    final int jumlahBenar;
    final int jumlahSalah;
    final bool remidial;
    final dynamic nilaiRemidial;
    final dynamic sk;

    Data({
        required this.mahasiswa,
        required this.matkul,
        required this.nilaiAsli,
        required this.jumlahBenar,
        required this.jumlahSalah,
        required this.remidial,
        required this.nilaiRemidial,
        required this.sk,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        mahasiswa: Mahasiswa.fromMap(json["mahasiswa"]),
        matkul: Matkul.fromMap(json["matkul"]),
        nilaiAsli: json["nilai_asli"],
        jumlahBenar: json["jumlah_benar"],
        jumlahSalah: json["jumlah_salah"],
        remidial: json["remidial"],
        nilaiRemidial: json["nilai_remidial"],
        sk: json["sk"],
    );

    Map<String, dynamic> toMap() => {
        "mahasiswa": mahasiswa.toMap(),
        "matkul": matkul.toMap(),
        "nilai_asli": nilaiAsli,
        "jumlah_benar": jumlahBenar,
        "jumlah_salah": jumlahSalah,
        "remidial": remidial,
        "nilai_remidial": nilaiRemidial,
        "sk": sk,
    };
}

class Mahasiswa {
    final int id;
    final String nama;
    final String username;
    final String roles;

    Mahasiswa({
        required this.id,
        required this.nama,
        required this.username,
        required this.roles,
    });

    factory Mahasiswa.fromJson(String str) => Mahasiswa.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Mahasiswa.fromMap(Map<String, dynamic> json) => Mahasiswa(
        id: json["id"],
        nama: json["nama"],
        username: json["username"] ?? '',
        roles: json["roles"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "username": username,
        "roles": roles,
    };
}

class Matkul {
    final int id;
    final String nama;
    final Mahasiswa user;

    Matkul({
        required this.id,
        required this.nama,
        required this.user,
    });

    factory Matkul.fromJson(String str) => Matkul.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Matkul.fromMap(Map<String, dynamic> json) => Matkul(
        id: json["id"],
        nama: json["nama"],
        user: Mahasiswa.fromMap(json["user"] ?? ''),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "user": user.toMap(),
    };
}
