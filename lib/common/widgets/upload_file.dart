import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../global_variables.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class UploadFile extends StatefulWidget {
  final Function(File file) onFileSelected;

  const UploadFile({
    required this.onFileSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  String fileName = "Upload SK";
  File? pdf;

  // void onFileSelected(File file) async {
  //   print('Selected file: ${file.path}');
  //   setState(() {
  //     fileName = file.path.split('/').last;
  //   });

  //   try {
  //     await addSKPdf(file);
  //   } catch (e) {
  //     print('Error uploading file: $e');
  //     // Handle error during file upload
  //   }
  // }

  Future<void> getPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        fileName = result.files.single.name;
        pdf = File(result.files.single.path!);
        widget.onFileSelected(pdf!); // Panggil fungsi onFileSelected
      });
    } else {
      // Pengguna tidak memilih file
    }
  }

  Future<void> addSKPdf(File file) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          '${GlobalVariables.baseUrl}/api/register'), // Ganti dengan URL server Anda
    );

    final fileName = file.path.split('/').last;
    final bytes = await file.readAsBytes();

    final multiPartFile = http.MultipartFile.fromBytes(
      'sk_kompren',
      bytes,
      filename: fileName,
      contentType:
          MediaType('application', 'pdf'), // Sesuaikan tipe konten jika perlu
    );

    request.files.add(multiPartFile);

    try {
      final http.StreamedResponse streamedResponse = await request.send();
      final int statusCode = streamedResponse.statusCode;

      final Uint8List responseList = await streamedResponse.stream.toBytes();
      final String responseData = utf8.decode(responseList);

      if (statusCode == 200) {
        // File berhasil diunggah
        print('File berhasil diunggah: $responseData');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File berhasil diunggah ke server.')),
        );
      } else {
        // Gagal mengunggah file
        print('Gagal mengunggah file.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mengunggah file.')),
        );
      }
    } catch (e) {
      // Terjadi kesalahan selama proses pengunggahan
      print('Terjadi kesalahan: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
  }

  Future<void> _pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);

      // Update _filePdf using the provided callback
      widget
          .onFileSelected(file); // Mengirim file yang dipilih ke widget parent
    } else {
      // Handle if no file is chosen
    }
  }

  // ... kode lainnya ...
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await getPdf();
        // await addSKPdf();
      },
      child: Container(
        height: 48,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.file_upload),
            SizedBox(width: 8),
            Text(
              "Pilih File",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
