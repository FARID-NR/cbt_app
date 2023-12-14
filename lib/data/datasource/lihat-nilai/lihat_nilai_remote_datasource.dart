import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../common/global_variables.dart';
import '../../models/response/lihat_nilai_response_model.dart';
import '../login/login_local_datasource.dart';
import 'package:http/http.dart' as http;

class LihatNilaiRemoteDatasource {
  Future<Either<String, LihatNilaiResponseModel>> getSoal(
      int idMatkul, int idMhs) async {
    // final userId = await EndpointLocalDatasource().getIdEndpoint();
    // debugPrint(userId.toString());
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}'
    };

    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/dosen/nilai/$idMatkul/$idMhs}'),
      headers: header,
    );
    
    debugPrint(response.body);
    
    if (response.statusCode == 200) {
      return Right(LihatNilaiResponseModel.fromJson(response.body));
    } else {
      return const Left('Server error');
    }
  }
}
