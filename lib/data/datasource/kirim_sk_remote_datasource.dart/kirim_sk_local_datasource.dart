// import 'dart:io';

// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';

// class PdfStorage {
//   Future<String?> savePdf(Uint8List pdfBytes, String fileName) async {
//     try {
//       final directory = await getExternalStorageDirectory();
//       final file = File('${directory!.path}/$fileName');
//       await file.writeAsBytes(pdfBytes);
//       return file.path; // Mengembalikan path dari file yang disimpan
//     } catch (e) {
//       print('Error saving PDF file: $e');
//       return null;
//     }
//   }
// }