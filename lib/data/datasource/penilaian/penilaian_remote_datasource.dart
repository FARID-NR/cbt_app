import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../common/global_variables.dart';
import '../../models/response/hasil_ujian_response.dart';
import '../login/login_local_datasource.dart';
import 'package:http/http.dart' as http;

class PenilaianRemoteDatasource {
  Future<Either<String, PenilaianResponseModel>> getHasilUjian(
      int userId) async {
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}'
    };

    final response = await http.get(
        Uri.parse('${GlobalVariables.baseUrl}/api/dosen/penilaian/$userId'),
        headers: header);

        debugPrint(response.body);

    if (response.statusCode == 200) {
      try {
        final penilaianResponseModel =
            PenilaianResponseModel.fromJson(response.body);
        return Right(penilaianResponseModel);
      } catch (e) {
        return Left('Username atau Password salah');
      }
    } else {
      return Left('Server Error');
    }
  }
}
