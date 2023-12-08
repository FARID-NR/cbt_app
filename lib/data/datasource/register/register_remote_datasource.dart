import 'dart:convert';

import 'package:cbt_app/common/global_variables.dart';
import 'package:cbt_app/data/models/request/register_request_model.dart';
import 'package:cbt_app/data/models/response/register_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterRemoteDataSource {


  Future<Either<String, RegistertResponseModel>> register(
  RegisterRequestModel requestModel) async {
    final url = Uri.parse('${GlobalVariables.baseUrl}/api/register');

    // Buat objek MultipartRequest
    final request = http.MultipartRequest('POST', url);

    // Tambahkan username dan password ke request
    request.fields['username'] = requestModel.username;
    request.fields['password'] = requestModel.password;

    // Tambahkan file ke request
    final file = await http.MultipartFile.fromPath('file', requestModel.skKomprenPath.path);
    request.files.add(file); 

    debugPrint(request.files.toString());
    // Kirim request
    final response = await request.send();

    debugPrint(response.toString());
    // Cek status response
    if (response.statusCode == 200) {
    // Parse response to RegistertResponseModel
      final responseData = await response.stream.bytesToString();
      final responseModel = RegistertResponseModel.fromJson(responseData);
      return Right(responseModel);
    } else {
      // Return error message
      final errorMessage = await response.stream.bytesToString();
      final errorJson = jsonDecode(errorMessage);
      final errorMessageJson = errorJson['message'];
      return Left(errorMessage);
    }
  }


  // Future<Either<String, RegistertResponseModel>> register(
  //   RegisterRequestModel requestModel) async {
  //   final response = await http.MultipartRequest(
  //     'POST',
  //     Uri.parse('${GlobalVariables.baseUrl}/api/register'),
  //   );

  //   response.files.add(
  //     await http.MultipartFile.fromPath(
  //       'sk_kompren',
  //       requestModel.skKomprenPath,
  //     ),
  //   );

  //   response.fields.addAll({
  //     'nama': requestModel.nama,
  //     'username': requestModel.username,
  //     'password': requestModel.password,
  //   });

  //   final streamedResponse = await response.send();
  //   final response2 = await http.Response.fromStream(streamedResponse);

  //   debugPrint(response2.body);

  //   if (response2.statusCode == 200) {
  //     try {
  //       final registerResponseModel =
  //           RegistertResponseModel.fromJson(response2.body);
  //       return Right(registerResponseModel);
  //     } catch (e) {
  //       return Left('Username atau Password salah');
  //     }
  //   } else {
  //     return Left('Server Error');
  //   }

  // }


//  Future<Either<String, RegistertResponseModel>> register(
//     RegisterRequestModel model, {File? skKompren}) async {
//       final Map<String, String> body = {
//         'nama': model.nama,
//         'username': model.username,
//         'password': model.password,
//       };


//       debugPrint(body.toString());

//       var stream = new http.ByteStream(pdf!.openRead());
//       var length = await pdf!.length();

//       var uri = Uri.parse('${GlobalVariables.baseUrl}/api/register');

//       var request = http.MultipartRequest('POST', uri);

//       request.fields.addAll(
//         body,
//       );

//       var multiPort = http.MultipartFile(
//         'pdf',
//         stream,
//         length
//       );

//       request.files.add(multiPort);
//       var response = await request.send();
//       // final response = await http.post(
//       //   Uri.parse('${GlobalVariables.baseUrl}/api/register'),
//       //   body: body, // Gunakan body yang telah disiapkan dengan benar
//       // );

//       // debugPrint(response.body);
//       if (response.statusCode == 200) {
//         return Right(RegistertResponseModel.fromJson(''));
//       } else {
//         return const Left('Register Gagal');
//       }
//     }

    // Future<Either<String, RegistertResponseModel>> addSKPdf(File file) async {
    //   var request = http.MultipartRequest(
    //     'POST',
    //     Uri.parse('${GlobalVariables.baseUrl}/api/register'),
    //   );

    //   final fileName = file.path.split('/').last;
    //   final bytes = await file.readAsBytes();

    //   final multiPartFile = http.MultipartFile.fromBytes(
    //     'sk_kompren',
    //     bytes,
    //     filename: fileName,
    //     contentType: MediaType('application', 'pdf'), // Perbaikan: tambahkan MediaType
    //   );

    //   request.files.add(multiPartFile);

    //   debugPrint(multiPartFile.toString());

    //   try {
    //     final http.StreamedResponse streamedResponse = await request.send();
    //     final int statusCode = streamedResponse.statusCode;

    //     final Uint8List responseList = await streamedResponse.stream.toBytes();
    //     final String responseData = utf8.decode(responseList);

    //     if (statusCode == 200) {
    //       return Right(RegistertResponseModel.fromJson(responseData));
    //     } else {
    //       return const Left('Register Gagal');
    //     }
    //   } catch (e) {
    //     return Left('Terjadi kesalahan: $e');
    //   }
    // }
}