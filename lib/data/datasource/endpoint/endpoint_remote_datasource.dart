import 'package:cbt_app/common/global_variables.dart';
import 'package:cbt_app/data/datasource/login/login_local_datasource.dart';
import 'package:cbt_app/data/models/response/endpoint_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;


class EndpointRemoteDatasource {

  Future<Either<String, EndpointResponseModel>> getEndpoint() async {
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}'
    };
    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/get-matkul-dosen'),
      headers: header,
    );

    // debugPrint(response.body);

    if (response.statusCode == 200) {
      return Right(EndpointResponseModel.fromJson(response.body));

    } else {
      return const Left('Server Error');
    }
  }
}