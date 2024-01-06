import 'package:cbt_app/common/global_variables.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../models/request/edit_request_model.dart';
import '../../models/response/edit_response_model.dart';
import '../login/login_local_datasource.dart';


class EditSoalRemoteDatasource {
  Future<Either<String, EditResponseModel>> editSoal(
    EditRequestModel editData, int soalId) async{
      // final token = await LoginLocalDatasource().getToken();
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
      // 'Content-Type': 'multipart/form-data',
      "Accept" : "application/json",
    };

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${GlobalVariables.baseUrl}/api/dosen/soal/edit/$soalId'),
    );

    final fileName = editData.image?.name ?? null;
    final bytes = editData.image != null && editData.image!.path.isNotEmpty ? await editData.image?.readAsBytes() : Uint8List(0);

    final multiPartFile = editData.image != null ? await http.MultipartFile.fromBytes('gambar_soal', bytes!, filename: fileName) : null;

    // final Map<String, String> fields = editData.toJson();

    debugPrint(request.toString());

    if (multiPartFile != null) {
      request.files.add(multiPartFile);
      
    }
    request.fields.addAll({
      'soal': editData.soal,
      'tingkat': editData.tingkat,
      'updated_at': editData.lat?.toString() ?? '',
      'created_at': editData.long?.toString() ?? '',
    });
    request.headers.addAll(header);

    final http.StreamedResponse response = await request.send();
    // final int statusCode = response.statusCode;

    final Uint8List responseList = await response.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    // debugPrint(statusCode.toString());

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      return Right(EditResponseModel.fromJson(responseData));
    }
    else {
      // print(response.statusCode);
      return const Left('Server Error');
    }



  }
}