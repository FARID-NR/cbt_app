import 'dart:convert';

import 'package:cbt_app/data/models/response/dapat_ujian_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../common/global_variables.dart';
import '../../models/response/get_pengajuan_response_model.dart';
import 'package:http/http.dart' as http;

import '../login/login_local_datasource.dart';

class PengajuanRemoteDatasource {
  Future<Either<String, PengajuanResponseModel>> getPengujian(
      int userIdList) async {

    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}'
    };

    // debugPrint(userIdList.toString());
    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/dosen/pengujian/$userIdList}'),
      headers: header,
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {

      return Right(PengajuanResponseModel.fromJson(response.body));
    } else {
      return const Left('Server error');
    }
  }

 

  Future<Either<String, DapatUjianResponseModel>> dapatUjian(
  int matkulId, int userId) async {
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
    };

    final request = http.MultipartRequest(
      'GET',
      Uri.parse('${GlobalVariables.baseUrl}/api/dosen/dapat-ujian/$matkulId/$userId'),
    );

    request.headers.addAll(header);

    http.StreamedResponse response = await request.send();
    String responseString = await response.stream.transform(utf8.decoder).join();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      return Right(DapatUjianResponseModel.fromJson(responseString));
    } else {
      return Left('Server Error');
    }
  }
}
