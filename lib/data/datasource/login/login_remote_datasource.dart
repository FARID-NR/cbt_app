import 'package:cbt_app/common/global_variables.dart';
import 'package:cbt_app/data/datasource/login/login_local_datasource.dart';
import 'package:cbt_app/data/models/request/login_request_model.dart';
import 'package:cbt_app/data/models/response/login_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LoginRemoteDatasource{
  
  Future<Either<String, LoginResponseModel>> login(
    LoginRequestModel requestModel) async {
      debugPrint(requestModel.password.toString());
    final response = await http.post(
      Uri.parse('${GlobalVariables.baseUrl}/api/login'),
      body: {
        "password": requestModel.password,
        'username': requestModel.username
      }
    );

    debugPrint(response.body);
    if (response.statusCode == 200) {

      try {
        final loginResponseModel = LoginResponseModel.fromJson(response.body);
        return Right(loginResponseModel);
      } catch (e) {
        return Left('Username atau Password salah');
      }
    } else {
      return Left('Server Error');
    }
  }

  Future<Either<String, String>> logout() async {
  
    final headers = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}'
    };
    // final token = await LoginLocalDatasource().getToken();
    // debugPrint(token);

    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/logout'),
      headers: headers
    );
    // debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return Right('Logout Successfully');
    } else {
      return Left('Server Error');
    }
  }
}