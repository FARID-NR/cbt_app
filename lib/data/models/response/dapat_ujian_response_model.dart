import 'dart:convert';

class DapatUjianResponseModel {
    final bool success;
    final String message;
    final Data data;

    DapatUjianResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory DapatUjianResponseModel.fromJson(String str) => DapatUjianResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DapatUjianResponseModel.fromMap(Map<String, dynamic> json) => DapatUjianResponseModel(
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
  final Map<String, dynamic> penguji;

  Data({
    required this.id,
    required this.nama,
    required this.username,
    required this.roles,
    required this.penguji,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      nama: json['nama'],
      username: json['username'],
      roles: json['roles'],
      penguji: jsonDecode(json['penguji']),
    );
  }

  factory Data.fromMap(Map<String, dynamic> json) {
    return Data.fromJson(json);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'username': username,
      'roles': roles,
      'penguji': jsonEncode(penguji),
    };
  }
}

