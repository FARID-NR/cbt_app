import 'package:cbt_app/common/global_variables.dart';
import 'package:cbt_app/data/datasource/login/login_local_datasource.dart';
import 'package:cbt_app/data/models/response/get_soal_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class GetsoalRemoteDatasource {
  Future<Either<String, GetSoalResponseModel>> getSoal(int userIdList) async {
    // final userId = await EndpointLocalDatasource().getIdEndpoint();
    // debugPrint(userId.toString());
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}'
    };

    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/dosen/matkul/$userIdList}'),
      headers: header,
    );
    // debugPrint(response.body);
    if (response.statusCode == 200) {
      return Right(GetSoalResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal');
    }
  }
}
