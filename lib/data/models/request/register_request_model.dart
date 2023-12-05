import 'dart:convert';

class RegisterRequestModel {
    final String nama;
    final String username;
    final String password;
    final String skKompren;

    RegisterRequestModel({
        required this.nama,
        required this.username,
        required this.password,
        required this.skKompren,
    });

    factory RegisterRequestModel.fromJson(String str) => RegisterRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RegisterRequestModel.fromMap(Map<String, dynamic> json) => RegisterRequestModel(
        nama: json["nama"],
        username: json["username"],
        password: json["password"],
        skKompren: json["sk_kompren"],
    );

    Map<String, dynamic> toMap() => {
        "nama": nama,
        "username": username,
        "password": password,
        "sk_kompren": skKompren,
    };
}
