import 'dart:convert';

class GetSoalResponseModel {
  final bool success;
  final String message;
  final Data data;

  GetSoalResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetSoalResponseModel.fromJson(String str) =>
      GetSoalResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetSoalResponseModel.fromMap(Map<String, dynamic> json) =>
      GetSoalResponseModel(
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
  final int id;
  final String nama;
  final int userId;
  final String finishDate;
  final String finishTime;
  final List<Soal> soal;

  Data({
    required this.id,
    required this.nama,
    required this.userId,
    required this.finishDate,
    required this.finishTime,
    required this.soal,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        nama: json["nama"],
        userId: json["user_id"],
        finishDate: json["finish_date"] ?? '',
        finishTime: json["finish_time"] ?? '',
        soal: List<Soal>.from(json["soal"].map((x) => Soal.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "user_id": userId,
        "soal": List<dynamic>.from(soal.map((x) => x.toMap())),
      };

  map(Function(dynamic data) param0) {}
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
        id: json["id"] ?? '',
        soal: json["soal"] ?? '',
        gambarSoal: json["gambar_soal"] ?? '',
        tingkat: json["tingkat"] ?? '',
        matkulId: json["matkul_id"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "soal": soal,
        "gambar_soal": gambarSoal,
        "tingkat": tingkat,
        "matkul_id": matkulId,
      };
}
