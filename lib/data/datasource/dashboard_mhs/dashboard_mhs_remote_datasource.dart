import 'package:cbt_app/data/models/response/dashboard_mhs_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../common/global_variables.dart';
import '../login/login_local_datasource.dart';
import 'package:http/http.dart' as http;

class DashboardMhsRemoteDatasource {
  Future<Either<String, DashboardMhsResponseModel>> getDashMhs() async {
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
    };

    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/dashboard-mahasiswa'),
      headers: header,
    );

    debugPrint(response.body);

    if (response.statusCode == 200) {
      return Right(DashboardMhsResponseModel.fromJson(response.body));
      // try {
      //   final loginResponseModel = DashboardMhsResponseModel.fromJson(response.body);
      //   return Right(loginResponseModel);
      // } catch (e) {
      //   return Left('Username atau Password salah');
      // }
    } else {
      return const Left('Server Error');
    }
  }
}