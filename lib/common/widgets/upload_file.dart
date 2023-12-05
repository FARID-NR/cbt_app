import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadFile extends StatelessWidget {
  // final String fileName;
  final Function(File file) onFileSelected;

  const UploadFile({
    // required this.fileName,
    required this.onFileSelected,
    Key? key,
  }) : super(key: key);

  Future<void> _pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);

      // Memanggil fungsi onFileSelected dengan file yang dipilih
      onFileSelected(file);
    } else {
      // Handle jika file tidak dipilih
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tidak ada file yang dipilih.')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _pickFile(context);
      },
      child: Container(
        height: 48,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            topLeft: Radius.circular(8)
          ),
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