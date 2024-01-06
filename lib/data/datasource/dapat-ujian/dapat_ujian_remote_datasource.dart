import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../common/global_variables.dart';
import '../../models/response/dapat_ujian_response_model.dart';
import '../login/login_local_datasource.dart';

class DapatUjianRemoteDatasource {
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