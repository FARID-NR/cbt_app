import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterRequestModel {
  // {
  //     "success": true,
  //     "message": "Pendaftaran Berhasil",
  //     "data": {
  //         "nama": "muiz",
  //         "username": "60900120004",
  //         "roles": "mahasiswa"
  //     }
  // }

  final String nama;
  final String username;
  final String password;
  final String roles;
  
  RegisterRequestModel({
    required this.nama,
    required this.username,
    required this.password,
    required this.roles,
  });




  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'username': username,
      'password': password,
      'roles': roles,
    };
  }

  factory RegisterRequestModel.fromMap(Map<String, dynamic> map) {
    return RegisterRequestModel(
      nama: map['nama'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      roles: map['roles'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromJson(String source) => RegisterRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
