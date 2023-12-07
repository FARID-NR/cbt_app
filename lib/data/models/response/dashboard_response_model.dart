import 'dart:convert';

class DashboardResponseModel {
    final bool success;
    final String message;
    final Data data;

    DashboardResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory DashboardResponseModel.fromJson(String str) => DashboardResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DashboardResponseModel.fromMap(Map<String, dynamic> json) => DashboardResponseModel(
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
    final int jumlahMatkul;
    final int jumlahMahasiswa;

    Data({
        required this.jumlahMatkul,
        required this.jumlahMahasiswa,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        jumlahMatkul: json["jumlah_matkul"],
        jumlahMahasiswa: json["jumlah_mahasiswa"],
    );

    Map<String, dynamic> toMap() => {
        "jumlah_matkul": jumlahMatkul,
        "jumlah_mahasiswa": jumlahMahasiswa,
    };
}
