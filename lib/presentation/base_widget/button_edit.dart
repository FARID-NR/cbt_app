import 'dart:io';

import 'package:cbt_app/data/models/request/edit_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../bloc/edit_soal/edit_soal_bloc.dart';
import '../../common/constants/colors.dart';

class ButtonEdit extends StatefulWidget {
  final int soalId;
  final String soal;
  final String tingkat;
  final String image;

  const ButtonEdit({
    Key? key,
    required this.soalId,
    required this.soal,
    required this.tingkat,
    required this.image,
  }) : super(key: key);

  @override
  State<ButtonEdit> createState() => _ButtonEditState();
}

class _ButtonEditState extends State<ButtonEdit> {
  TextEditingController? _soal;
  String _selectedDifficulty = '';
  String fileName = "Upload Gambar";
  XFile? _imageFile;
  // late int matkulId;

  Future<void> getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo =
        await picker.pickImage(source: source, imageQuality: 50);

    if (photo != null) {
      _imageFile = photo;
      setState(() {});
    }
  }

  @override
  void initState() {
    _soal = TextEditingController(text: cleanText(widget.soal));
    // if (widget.image.isNotEmpty) {
    //   _imageFile =
    //       XFile(widget.image); // assuming the image is stored as a file path
    //   // debugPrint(widget.image);
    // }
    _selectedDifficulty = widget.tingkat;
    super.initState();
  }

  @override
  void dispose() {
    _soal?.dispose();
    super.dispose();
  }

  String cleanText(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>'), '');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          height: 700,
          decoration: const BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Edit Soal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _soal,
                  decoration: const InputDecoration(
                    labelText: 'Masukkan Soal',
                    border: OutlineInputBorder(),
                  ),
                  // ...
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: (_imageFile != null)
                          ? Image.file(
                              File(_imageFile!.path.toString()),
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            )
                          : widget.image.isNotEmpty
                              ? Image.network(
                                  widget.image,
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: const Color.fromARGB(255, 238, 238,
                                          238), // Warna garis border
                                    ),
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(8),
                                        topRight: Radius.circular(
                                            8)), // Membuat garis border melingkar
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Image.network(
                                      widget.image,
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    )
                                  ),
                                ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        getImage(ImageSource.gallery);
                      },
                      child: Container(
                        height: 48,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              topLeft: Radius.circular(8)),
                        ),
                        child: const Row(
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
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedDifficulty,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDifficulty = newValue!;
                    });
                  },
                  items: <String>['Sulit', 'Menengah', 'Mudah']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: BlocListener<EditSoalBloc, EditSoalState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          loaded: (data) {
                            // context.read<AddSoalBloc>().add(AddSoalEvent.addSoal(data));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.greenAccent,
                                content: Text('Data Berhasil Di tambah'),
                              ),
                            );
                            Navigator.pop(context);
                          },
                          error: (message) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              '$message',
                            )));
                          });
                      },
                      child: BlocBuilder<EditSoalBloc, EditSoalState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                            return TextButton(
                              onPressed: () {
                                // Aksi yang dijalankan saat tombol ditekan
                                if (_imageFile != null && _imageFile!.path != widget.image) {
                                  // Aksi yang dijalankan saat tombol ditekan dengan gambar baru dipilih
                                  final requestEdit = EditRequestModel(
                                    soal: _soal!.text,
                                    image: _imageFile!,
                                    tingkat: _selectedDifficulty,
                                  );

                                  context.read<EditSoalBloc>().add(
                                    EditSoalEvent.edit(requestEdit, widget.soalId)
                                  );
                                } else {
                                  // Aksi yang dijalankan saat tombol ditekan tanpa ada perubahan gambar
                                  final requestEdit = EditRequestModel(
                                    soal: _soal!.text,
                                    tingkat: _selectedDifficulty,
                                  );

                                  context.read<EditSoalBloc>().add(
                                    EditSoalEvent.edit(requestEdit, widget.soalId)
                                  );
                                }
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: ColorName.primary),
                              child: const Text(
                                'Simpan',
                                style: TextStyle(
                                  color: Colors.white, // Warna teks tombol
                                ),
                              ),
                            );
                          },
                         );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
