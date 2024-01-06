import 'package:cbt_app/data/models/request/jawaban_request_model.dart';
import 'package:cbt_app/data/models/response/jawaban_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../../common/global_variables.dart';
import '../login/login_local_datasource.dart';

class JawabanRemoteDatasource {
  Future<Either<String, JawabanResponseModel>> jawaban(
  JawabanRequestModel jawabanData, int soalId) async{
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
      // 'Content-Type': 'multipart/form-data',
      "Accept" : "application/json",
    };

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${GlobalVariables.baseUrl}/api/soal/jawaban/$soalId'),
    );

    final fileNameA = jawabanData.imageA.name ?? '';
    final fileNameB = jawabanData.imageB.name ?? '';
    final fileNameC = jawabanData.imageC.name ?? '';
    final fileNameD = jawabanData.imageD.name ?? '';
    final fileNameE = jawabanData.imageE.name ?? '';

    final bytesA = jawabanData.imageA != null && jawabanData.imageA.path.isNotEmpty ? await jawabanData.imageA.readAsBytes() : Uint8List(0);
    final bytesB = jawabanData.imageB != null && jawabanData.imageB.path.isNotEmpty ? await jawabanData.imageB.readAsBytes() : Uint8List(0);
    final bytesC = jawabanData.imageC != null && jawabanData.imageC.path.isNotEmpty ? await jawabanData.imageC.readAsBytes() : Uint8List(0);
    final bytesD = jawabanData.imageD != null && jawabanData.imageD.path.isNotEmpty ? await jawabanData.imageD.readAsBytes() : Uint8List(0);
    final bytesE = jawabanData.imageE != null && jawabanData.imageE.path.isNotEmpty ? await jawabanData.imageE.readAsBytes() : Uint8List(0);

    // final bytesB = await jawabanData.imageB.readAsBytes();
    // final bytesC = await jawabanData.imageC.readAsBytes();
    // final bytesD = await jawabanData.imageD.readAsBytes();
    // final bytesE = await jawabanData.imageE.readAsBytes();

    final multiPartFileA = jawabanData.imageA != null ? await http.MultipartFile.fromBytes('gambar_jawabanA', bytesA, filename: fileNameA) : null;
    final multiPartFileB = jawabanData.imageB != null ? await http.MultipartFile.fromBytes('gambar_jawabanB', bytesB, filename: fileNameB) : null;
    final multiPartFileC = jawabanData.imageC != null ? await http.MultipartFile.fromBytes('gambar_jawabanC', bytesC, filename: fileNameC) : null;
    final multiPartFileD = jawabanData.imageD != null ? await http.MultipartFile.fromBytes('gambar_jawabanD', bytesD, filename: fileNameD) : null;
    final multiPartFileE = jawabanData.imageE != null ? await http.MultipartFile.fromBytes('gambar_jawabanE', bytesE, filename: fileNameE) : null;

    debugPrint(request.toString());

    if (multiPartFileA != null) {
      request.files.add(multiPartFileA);
    }
    if (multiPartFileB != null) {
      request.files.add(multiPartFileB);
    }
    if (multiPartFileC != null) {
      request.files.add(multiPartFileC);
    }
    if (multiPartFileD != null) {
      request.files.add(multiPartFileD);
    }
    if (multiPartFileE != null) {
      request.files.add(multiPartFileE);
    }

    request.fields.addAll({
      'jawabanA' : jawabanData.jawabanA,
      'jawabanB' : jawabanData.jawabanB,
      'jawabanC' : jawabanData.jawabanC,
      'jawabanD' : jawabanData.jawabanD,
      'jawabanE' : jawabanData.jawabanE,
      'benar' : jawabanData.benar
    });

    request.headers.addAll(header);

    final http.StreamedResponse response = await request.send();

    final Uint8List responseList = await response.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      return Right(JawabanResponseModel.fromJson(responseData));
    }
    else {
      // print(response.statusCode);
      return const Left('Server Error');
    }
  } 
}