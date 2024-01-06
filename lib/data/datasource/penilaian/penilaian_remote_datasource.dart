import 'dart:convert';

import 'package:cbt_app/data/models/request/penilaian_request_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../common/global_variables.dart';
import '../../models/response/penilaian_response_model.dart.dart';
import '../login/login_local_datasource.dart';
import 'package:http/http.dart' as http;

class PenilaianRemoteDatasource {
  Future<Either<String, PenilaianResponseModel>> getHasilUjian(
      String userId) async {
        
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}'
    };

    final request = await http.MultipartRequest(
        'GET',
        Uri.parse('${GlobalVariables.baseUrl}/api/dosen/penilaian/$userId'),
    );

    // request.fields.addAll({
    //   'finish_date': requestModel.finishDate,
    //   'finish_time': requestModel.finishTime,
    // });

    request.headers.addAll(header);

    http.StreamedResponse response = await request.send();
    String responseString = await response.stream.transform(utf8.decoder).join();

    debugPrint(responseString);

    if (response.statusCode == 200) {
      return Right(PenilaianResponseModel.fromJson(responseString));
    } else {
      return const Left('Server error');
    }
  }
}
