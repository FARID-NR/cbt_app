import 'dart:convert';

import 'package:cbt_app/common/global_variables.dart';
import 'package:cbt_app/data/models/response/add_soal_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../models/request/add_soal_request_model.dart';
import '../login/login_local_datasource.dart';


class AddSoalRemoteDatasource {
  Future<Either<String, AddSoalResponseModel>> addSoal(
    AddSoalRequestModel soalData) async{
      // final token = await LoginLocalDatasource().getToken();
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
      'Content-Type': 'multipart/form-data',
      "Accept" : "application/json",
    };

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${GlobalVariables.baseUrl}/api/dosen/soal'),
    );

    final fileName = soalData.image.name;
    final bytes = await soalData.image.readAsBytes();

    final multiPartFile = http.MultipartFile.fromBytes('gambar_soal', bytes, filename: fileName);

    // final Map<String, String> fields = soalData.toJson();

    debugPrint(request.toString());

    request.files.add(multiPartFile);
    request.fields.addAll({
      'matkul_id': soalData.matkulId.toString(),
      'soal': soalData.soal,
      'tingkat': soalData.tingkat,
      'updated_at': soalData.lat?.toString() ?? '',
      'created_at': soalData.long?.toString() ?? '',
    });
    request.headers.addAll(header);

    final http.StreamedResponse response = await request.send();
    // final int statusCode = response.statusCode;

    final Uint8List responseList = await response.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    // debugPrint(statusCode.toString());

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      return Right(AddSoalResponseModel.fromJson(responseData));
    }
    else {
      // print(response.statusCode);
      return const Left('Server Error');
    }
  }

  Future<Either<String, AddSoalResponseModel>> hapusSoal(
  int soalId) async {
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
    };

    final request = http.MultipartRequest(
      'GET',
      Uri.parse('${GlobalVariables.baseUrl}/api/dosen/soal/hapus/$soalId'),
    );

    request.headers.addAll(header);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return Right(AddSoalResponseModel.fromJson(await response.stream.bytesToString()));
    } else {
      return Left('Server Error');
    }
  }
}