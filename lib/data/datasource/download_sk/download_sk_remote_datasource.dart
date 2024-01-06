import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../../common/global_variables.dart';
import '../../models/request/download_sk_request_model.dart';
import '../login/login_local_datasource.dart';

class DownloadSkRemoteDatasource {
  Future<Either<String, String>> downloadSk(DownloadSkRequestModel downloadSk, String nmMatkul) async {
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
      // Content-Type
      "Content-Type" : "application/pdf",
    };

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${GlobalVariables.baseUrl}/api/cetak/pdf'),
    );

    request.fields.addAll({
      'dosen_penguji': downloadSk.dosenPenguji,
      'mata_kuliah_id': downloadSk.mataKuliahId,
      'mata_kuliah': downloadSk.mataKuliah,
      'nama_mahasiswa': downloadSk.namaMahasiswa,
      'nim_mahasiswa': downloadSk.nimMahasiswa,
      'nilai_angka': downloadSk.nilaiAngka.toString()
    });

    request.headers.addAll(header);

    final http.StreamedResponse response = await request.send();
    // final int statusCode = response.statusCode;

    final Uint8List responseList = await response.stream.toBytes();
    // final String responseData = String.fromCharCodes(responseList);

    int fileCounter = 0;
    final String fileName = 'NILAI_HASIL_${nmMatkul}_${fileCounter + 1}.pdf';

        // Meminta pengguna memilih direktori
        String? result = await FilePicker.platform.getDirectoryPath();

        if (result != null) {
          final Directory selectedDirectory = Directory(result);
          final File file = File('${selectedDirectory.path}/$fileName');
          await file.writeAsBytes(responseList);          

          AndroidIntent intent = AndroidIntent(
            action: 'action_view',
            data: file.path,
            type: 'application/pdf', // Ganti tipe file jika bukan PDF
          );
          await intent.launch();

          return const Right('File downloaded successfully');
        } else {
          return const Left('No directory selected');
        }
  }
}