import 'package:cbt_app/data/models/response/dapat_ujian_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../common/global_variables.dart';
import '../../models/response/get_pengajuan_response_model.dart';
import 'package:http/http.dart' as http;

import '../login/login_local_datasource.dart';

class PengajuanRemoteDatasource {
  Future<Either<String, PengajuanResponseModel>> getPengujian(int userIdList) async {
    // final userId = await EndpointLocalDatasource().getIdEndpoint();
    // debugPrint(userId.toString());
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

  Future<Either<String, DapatUjianResponseModel>> getStatusUjian(int userIdList) async {
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}'
    };

    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/dosen/dapat-ujian/$userIdList}/3'),
      headers: header,
    );

    if (response.statusCode == 200) {
      return Right(DapatUjianResponseModel.fromJson(response.body));
    } else {
      return const Left('Server error');
    }

  }
}