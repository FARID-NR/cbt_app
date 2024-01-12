import 'package:cbt_app/common/global_variables.dart';
import 'package:cbt_app/data/datasource/login/login_local_datasource.dart';
import 'package:cbt_app/data/models/request/storesoal_request_model.dart';
import 'package:cbt_app/data/models/response/storesoal_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class StoresoalRemoteDatasource {
  Future<Either<dynamic, StoresoalResponseModel>> storeSoal(
      StoresoalRequestModel requestModel) async {
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
    };

    final response = await http.post(
        Uri.parse('${GlobalVariables.baseUrl}/api/dosen/soal'),
        headers: header,
        body: {
          "soal": requestModel.soal,
          "tingkat": requestModel.tingkat,
          "gambar_soal": requestModel.gambarSoal
        });

    if (response.statusCode == 200) {
      return Right(StoresoalResponseModel.fromJson(response.body));
    } else {
      return const Left('Server Error');
    }
  }
}
