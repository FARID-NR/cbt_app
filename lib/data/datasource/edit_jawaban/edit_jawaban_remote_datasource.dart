import 'package:cbt_app/data/models/response/edit_jawaban_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../common/global_variables.dart';
import '../login/login_local_datasource.dart';


class EditJawabanRemoteDatasource{
  Future<Either<String, EditJawabanResponseModel>> getSoal(int soalId) async {
    // final userId = await EndpointLocalDatasource().getIdEndpoint();
    // debugPrint(userId.toString());
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}'
    };

    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/soal/jawaban/$soalId}'),
      headers: header,
    );
    // debugPrint(response.body);
    if (response.statusCode == 200) {
      return Right(EditJawabanResponseModel.fromJson(response.body));
    } else {
      return const Left('Server error');
    }
  }
}