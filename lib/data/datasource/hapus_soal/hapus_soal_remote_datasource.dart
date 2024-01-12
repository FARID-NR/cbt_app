import 'package:cbt_app/data/models/response/hapus_soal_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../common/global_variables.dart';
import '../login/login_local_datasource.dart';

class HapusSoalRemoteDatasource {
  Future<Either<String, HapusResponseModel>> hapusSoal(
  int soalId) async {
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
    };

    final request = http.MultipartRequest(
      'GET',
      Uri.parse('${GlobalVariables.baseUrl}/api/dosen/soal/hapus/$soalId'),
    );

    request.headers.addAll(header);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      return Right(HapusResponseModel.fromJson(await response.stream.bytesToString()));
    } else {
      return const Left('Server Error');
    }
  }
}