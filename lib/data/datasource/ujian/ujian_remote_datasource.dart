import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../common/global_variables.dart';
import '../../models/response/ujian_response_model.dart';
import '../login/login_local_datasource.dart';

class UjianRemoteDatasource {
  Future<Either<String, UjianResponseModel>> getUjian(
  String matkulId) async {
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
    };

    final request = http.Request(
      'GET',
      Uri.parse('${GlobalVariables.baseUrl}/api/mahasiswa/soal/$matkulId'),
    );

    request.headers.addAll(header);

    debugPrint(request.body);

    http.StreamedResponse response = await request.send();
    String responseString = await response.stream.transform(utf8.decoder).join();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      return Right(UjianResponseModel.fromJson(responseString));
    }
    else {
      // print(response.reasonPhrase);
      return const Left('Server Error');
    }
  }

  Future<Either<String, UjianResponseModel>> answer(int soalId, String jawaban, String matkulId) async {
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
    };

    final request = http.Request(
      'POST',
      Uri.parse('${GlobalVariables.baseUrl}/api/mahasiswa/soal/$matkulId'),
    );

    request.headers.addAll(header);

    debugPrint(request.body);

    http.StreamedResponse response = await request.send();
    String responseString = await response.stream.transform(utf8.decoder).join();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      return Right(UjianResponseModel.fromJson(responseString));
    }
    else {
      // print(response.reasonPhrase);
      return const Left('Server Error');
    }

  }

  // Future<Either<String, SubmitResponseModel>> submit(int matkulId, int userId) async {
  //   final header = {
  //     'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
  //   };

  //   final request = await http.MultipartRequest(
  //     'POST',
  //     Uri.parse('${GlobalVariables.baseUrl}/api/mahasiswa/soal/$matkulId'),
  //   );

  //   request.fields.addAll({
  //     'user_id': userId.toString(),
  //   });

  //   request.headers.addAll(header);

  //   // debugPrint(request.);

  //   http.StreamedResponse response = await request.send();
  //   String responseString = await response.stream.transform(utf8.decoder).join();

  //   if (response.statusCode == 200) {
  //     // print(await response.stream.bytesToString());
  //     return Right(SubmitResponseModel.fromJson(responseString));
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //     return const Left('Server Error');
  //   }

  // }
}