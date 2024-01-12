// import 'dart:io';

import 'dart:io';

import 'package:cbt_app/data/models/request/kirim_sk_request_model.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


import '../../../common/global_variables.dart';
import '../login/login_local_datasource.dart';

class KirimSkRemoteDatasource {
  final int _fileCounter = 0; // Menyimpan nomor urut file
  Future<Either<String, String>> kirimSK(BuildContext context,
      KirimSkRequestModel requestModel, String nmMatkul) async {
    final header = {
      'Authorization': 'Bearer ${await LoginLocalDatasource().getToken()}',
      "Content-Type":
          "multipart/form-data; boundary=<calculated when request is sent>",
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive'
    };

    var request = http.MultipartRequest(
        'POST', Uri.parse('${GlobalVariables.baseUrl}/api/kirim-nilai/pdf'));

    request.fields.addAll({
      'dosen_penguji': requestModel.dosenPenguji,
      'mata_kuliah_id': requestModel.mataKuliahId.toString(),
      'mata_kuliah': requestModel.mataKuliah,
      'nama_mahasiswa': requestModel.namaMahasiswa,
      'nim_mahasiswa': requestModel.nimMahasiswa,
      'nilai_angka': requestModel.nilaiAngka.toString(),
      'tanggal_sk': requestModel.tanggalSk,
      'keterangan': requestModel.keterangan,
    });

    request.headers.addAll(header);

    final http.StreamedResponse response = await request.send();

    final Uint8List responseList = await response.stream.toBytes();
    // final String responseData = String.fromCharCodes(responseList);

    debugPrint(response.statusCode.toString());

    final String fileName = 'SK_HASIL_${nmMatkul}_${_fileCounter + 1}.pdf';

    // Meminta pengguna memilih direktori
    String? result = await FilePicker.platform.getDirectoryPath();

    if (result != null) {
      final Directory selectedDirectory = Directory(result);
      final File file = File('${selectedDirectory.path}/$fileName');
      await file.writeAsBytes(responseList);

      


      // AndroidIntent intent = AndroidIntent(
      //   action: 'action_view',
      //   data: file.path,
      //   type: 'application/pdf', // Ganti tipe file jika bukan PDF
      // );
      // await intent.launch();
        // return Right('File Tersimpan');
      return Right(file.path); // ini untuk melempar nilainya
    } else {
      return const Left('File Tersimpan');
    }
  }
}
