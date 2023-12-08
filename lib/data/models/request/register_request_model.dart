import 'dart:convert';
import 'dart:io';

class RegisterRequestModel {
  final String nama;
  final String username;
  final String password;
  final File skKomprenPath; // Gunakan path string

  RegisterRequestModel({
    required this.nama,
    required this.username,
    required this.password,
    required this.skKomprenPath,
  });

  factory RegisterRequestModel.fromJson(String str) =>
      RegisterRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromMap(Map<String, dynamic> json) =>
      RegisterRequestModel(
        nama: json["nama"],
        username: json["username"],
        password: json["password"],
        skKomprenPath: json["sk_kompren"], // Tetapkan path string
      );

  Map<String, dynamic> toMap() => {
        "nama": nama,
        "username": username,
        "password": password,
        "sk_kompren": skKomprenPath,
      };

  // Future<String> getBase64FromSkKompren() async {
  //   final File skKompren = File(skKomprenPa);
  //   final skKomprenBytes = await skKompren.readAsBytes();
  //   return base64Encode(skKomprenBytes);
  // }
}
