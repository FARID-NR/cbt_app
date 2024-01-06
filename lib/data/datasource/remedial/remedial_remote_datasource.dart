import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../common/global_variables.dart';
import '../../models/response/remedial_response_model.dart';
import '../login/login_local_datasource.dart';

class RemedialRemoteDatasource {
  Future<Either<String, RemedialResponseModel>> remedial( 
  int matkulId, int userId) async {
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
      "Accept" : "application/json",
    };

    final request = http.MultipartRequest(
      'GET',
      Uri.parse('${GlobalVariables.baseUrl}/api/dosen/remidial/$matkulId/$userId'),
    );

    request.headers.addAll(header);
    
    http.StreamedResponse response = await request.send();
    String responseString = await response.stream.transform(utf8.decoder).join();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      return Right(RemedialResponseModel.fromJson(responseString));
    } else {
      return Left('Server Error');
    }
  }
}