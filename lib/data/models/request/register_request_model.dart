
import 'dart:io';

class RegisterRequestModel {
  final String nama;
  final String username;
  final String password;
  final File skKompren;
  final double? lat;
  final double? long;

  RegisterRequestModel({
    required this.nama,
    required this.username,
    required this.password,
    required this.skKompren,
    this.lat,
    this.long,
  });

  Map<String, String> toJson() {
    if (lat == null && long == null) {
      return {
        'nama': nama,
        'username': username,
        'password': password
      };
    }

    return {
      'matkul_id': nama,
      'soal': username,
      'tingkat': password,
      'updated_at': lat?.toString() ?? '',
      'created_at': long?.toString() ?? '',
    };
  }
}