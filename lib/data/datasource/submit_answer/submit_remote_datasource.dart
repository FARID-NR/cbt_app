import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../common/global_variables.dart';
import '../../models/request/submit_request_model.dart';
import '../../models/response/submit_response_model.dart';
import '../login/login_local_datasource.dart';
import 'package:http/http.dart' as http;

class SubmitRemoteDatasource {
  Future<Either<String, SubmitResponseModel>> submit(SubmitRequestModel requestModel, String matkulId, String soalId, String userId, Map<String, dynamic> selectedAnswer) async {
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
      // 'Content-Type': 'multipart/form-data',
      "Accept" : "application/json",
    };

    // Membuat request POST menggunakan MultipartRequest
    final request = await http.MultipartRequest(
      'POST',
      Uri.parse('${GlobalVariables.baseUrl}/api/mahasiswa/soal/$matkulId'),
    );

    // Membuat map untuk data jawaban yang akan dikirim
    Map<String, dynamic> soalJawaban = {
      'user_id': userId,
    };

    // for (int i = 0; i <= int.parse(soalId); i++) {
    //   // int selectedAnswerId = selectedAnswers[i + 1];
    //   Map<String, dynamic> soal = {
    //     'soal$i': selectedAnswer, // Gunakan 'soal$i' sebagai kunci
    //   };
    //   soalJawaban.addAll(soal);
    // }

    // Iterasi melalui map selectedAnswer untuk menampilkan jawaban yang telah dipilih
    selectedAnswer.forEach((key, value) {
      debugPrint('Selected answer for $key: $value');
      // Di sini, kamu bisa melakukan sesuatu dengan setiap pasangan kunci dan nilai, misalnya,
      // menambahkannya ke dalam map soalJawaban untuk dikirim ke server.
      soalJawaban[key] = value;
    });

    // Menambahkan data jawaban ke dalam request
    request.fields.addAll(soalJawaban.map((key, value) => MapEntry(key, value.toString())));
    request.headers.addAll(header);

    // Mengirimkan request
    http.StreamedResponse response = await request.send();
    String responseString = await response.stream.transform(utf8.decoder).join();

    debugPrint(request.toString());
    debugPrint(requestModel.userId);

    debugPrint(request.fields.toString());


    if (response.statusCode == 200) {
      return Right(SubmitResponseModel.fromJson(responseString));
    }
    else {
      print(response.reasonPhrase);
      return const Left('Server Error');
    }

  }
}