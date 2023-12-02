import 'package:cbt_app/common/global_variables.dart';
import 'package:cbt_app/data/models/auth_response_model.dart';
import 'package:cbt_app/data/models/request/register_request_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  Future<Either<String, AuthResponseModel>> register(
    RegisterRequestModel model) async {
      final response = await http.post(
        Uri.parse('${GlobalVariables.baseUrl}/api/register'),
        body: model.toJson()
      );
      if (response.statusCode == 201) {
        return Right(AuthResponseModel.fromJson(response.body));
      } else {
        return const Left('Server Error');
      }
    }
}