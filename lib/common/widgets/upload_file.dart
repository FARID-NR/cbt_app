import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadFile extends StatefulWidget {
  // final String fileName;
  final Function(File file) onFileSelected;

  const UploadFile({
    // required this.fileName,
    required this.onFileSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();

        if (result != null) {
          String selectedFileName = result.files.single.name;
          widget.onFileSelected(File(result.files.single.path!));
        }
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