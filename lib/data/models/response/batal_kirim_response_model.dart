import 'dart:convert';

class BatalKirimModel {
    final bool success;
    final String message;
    final Data data;

    BatalKirimModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory BatalKirimModel.fromJson(String str) => BatalKirimModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BatalKirimModel.fromMap(Map<String, dynamic> json) => BatalKirimModel(
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
    final String username;
    final String roles;
    final String nilai;

    Data({
        required this.id,
        required this.nama,
        required this.username,
        required this.roles,
        required this.nilai,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        nama: json["nama"],
        username: json["username"],
        roles: json["roles"],
        nilai: json["nilai"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "username": username,
        "roles": roles,
        "nilai": nilai,
    };
}
