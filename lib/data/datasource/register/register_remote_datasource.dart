import 'package:cbt_app/common/global_variables.dart';
import 'package:cbt_app/data/models/request/login_request_model.dart';
import 'package:cbt_app/data/models/response/login_response_model.dart';
import 'package:cbt_app/data/models/request/register_request_model.dart';
import 'package:cbt_app/data/models/response/register_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class RegisterRemoteDataSource {
  Future<Either<String, RegisterResponseModel>> register(
    RegisterRequestModel model) async {
      final response = await http.post(
        Uri.parse('${GlobalVariables.baseUrl}/api/register'),
        // headers: headers,
        body: model.toMap()
      );
      if (response.statusCode == 200) {
        return Right(RegisterResponseModel.fromJson(response.body));
      } else {
        return const Left('Register Gagal');
      }
    }

  // Future<Either<String, AuthResponseModel>> login(
  //   LoginRequestModel model) async {
  //     final response = await http.post(
  //       Uri.parse('${GlobalVariables.baseUrl}/api/login'),
  //       // headers: headers,
  //       body: model.toJson()
  //     );
  //     if (response.statusCode == 200) {
  //       return Right(AuthResponseModel.fromJson(response.body));
  //     } else {
  //       return const Left('Server Error');
  //     }
  //   }


}