import 'dart:convert';

import 'package:cbt_app/data/models/response/batal_kirim_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../common/global_variables.dart';
import '../login/login_local_datasource.dart';

class BatalKirimRemoteDatasource {
  Future<Either<String, BatalKirimModel>> batalKirim(int matkuliId, int mhsId) async{
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}'
    };

    final request = http.MultipartRequest(
      'GET',
      Uri.parse('${GlobalVariables.baseUrl}/api/dosen/batal-kirim/$matkuliId/$mhsId'),
    );

    request.headers.addAll(header);

    http.StreamedResponse response = await request.send();
    String responseString = await response.stream.transform(utf8.decoder).join();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      return Right(BatalKirimModel.fromJson(responseString));
    } else {
      return const Left('Server Error');
    }
  }
}