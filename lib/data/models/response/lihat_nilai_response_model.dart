import 'package:meta/meta.dart';
import 'dart:convert';

class LihatNilaiResponseModel {
  final bool success;
  final String message;
  final Data data;

  LihatNilaiResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LihatNilaiResponseModel.fromJson(String str) =>
      LihatNilaiResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LihatNilaiResponseModel.fromMap(Map<String, dynamic> json) =>
      LihatNilaiResponseModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromMap(json["data"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data.toMap(),
      };
}

class Data {
  final Dosen dosen;
  final Matkul matkul;
  final Dosen mahasiswa;
  final dynamic nilaiAsli;
  final int jumlahBenar;
  final int jumlahSalah;
  final bool remidial;
  final dynamic nilaiRemidial;
  final dynamic sk;

  Data({
    required this.dosen,
    required this.matkul,
    required this.mahasiswa,
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
        dosen: Dosen.fromMap(json["dosen"]),
        matkul: Matkul.fromMap(json["matkul"] ?? ''),
        mahasiswa: Dosen.fromMap(json["mahasiswa"]),
        nilaiAsli: json["nilai_asli"],
        jumlahBenar: json["jumlah_benar"],
        jumlahSalah: json["jumlah_salah"],
        remidial: json["remidial"],
        nilaiRemidial: json["nilai_remidial"],
        sk: json["sk"],
      );

  Map<String, dynamic> toMap() => {
        "dosen": dosen.toMap(),
        "matkul": matkul.toMap(),
        "mahasiswa": mahasiswa.toMap(),
        "nilai_asli": nilaiAsli,
        "jumlah_benar": jumlahBenar,
        "jumlah_salah": jumlahSalah,
        "remidial": remidial,
        "nilai_remidial": nilaiRemidial,
        "sk": sk,
      };
}

class Dosen {
  final int id;
  final String nama;
  final String roles;
  final String username;

  Dosen({
    required this.id,
    required this.nama,
    required this.roles,
    required this.username,
  });

  factory Dosen.fromJson(String str) => Dosen.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dosen.fromMap(Map<String, dynamic> json) => Dosen(
        id: json["id"],
        nama: json["nama"],
        roles: json["roles"],
        username: json["username"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "roles": roles,
        "username": username,
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
