import 'package:cbt_app/data/models/response/timer_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/global_variables.dart';
import '../../models/request/timer_request_model.dart';
import '../login/login_local_datasource.dart';
import 'package:http/http.dart' as http;

class TimerRemoteDatasource {
  Future<Either<String, TimerResponseModel>> addTimer(
  TimerRequestModel timerData, int soalId) async {
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
      "Accept" : "application/json",
    };

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${GlobalVariables.baseUrl}/api/dosen/finish/$soalId'),
    );

    request.fields.addAll({
      'finish_date' : timerData.finishDate ?? '',
      'finish_time' : timerData.finishTime ?? '',
    });
    request.headers.addAll(header);

    debugPrint(timerData.finishTime);
    debugPrint(timerData.finishDate);

     final http.StreamedResponse response = await request.send();

     final Uint8List responseList = await response.stream.toBytes();
     final String responseData = String.fromCharCodes(responseList);

     if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        return Right(TimerResponseModel.fromJson(responseData));
      }
      else {
        // print(response.statusCode);
        return const Left('Server Error');
      }
  }

  Future<Either<String, TimerResponseModel>> deleteTimer(
  int soalId) async {
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
    };

    final request = http.MultipartRequest(
      'GET',
      Uri.parse('${GlobalVariables.baseUrl}/api/dosen/end/$soalId'),
    );

    request.headers.addAll(header);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return Right(TimerResponseModel.fromJson(await response.stream.bytesToString()));
    } else {
      return Left('Server Error');
    }
  }
}