import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../bloc/add_soal/add_soal_bloc.dart';
import '../../common/constants/colors.dart';
import '../../data/models/request/add_soal_request_model.dart';

class ButtonAddSoal extends StatefulWidget {
  final int matkulId;

  const ButtonAddSoal({super.key, required this.matkulId});

  @override
  State<ButtonAddSoal> createState() => _ButtonAddSoalState();
}

class _ButtonAddSoalState extends State<ButtonAddSoal> {
  String _selectedDifficulty = 'Mudah';
  String fileName = "Upload Gambar";
  TextEditingController? _soalController;
  XFile? _imageFile;


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
    _soalController = TextEditingController();
    // context.read<AddSoalBloc>().add(AddSoalEvent.addSoal());
    super.initState();
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
                  'Tambah Soal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _soalController,
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
                      child: _imageFile != null
                          ? Image.file(
                              File(_imageFile!.path.toString()),
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              height: 48,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: const Color.fromARGB(
                                      255, 238, 238, 238), // Warna garis border
                                ),
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(8),
                                    topRight: Radius.circular(
                                        8)), // Membuat garis border melingkar
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  'tidak ada gambar',
                                  style: const TextStyle(color: Colors.black),
                                  overflow: TextOverflow.ellipsis,
                                ),
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
                    child: BlocListener<AddSoalBloc, AddSoalState>(
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
                    }, child: BlocBuilder<AddSoalBloc, AddSoalState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            // final idEndpoint = EndpointLocalDatasource().getIdEndpoint();
                            // final matkulId = GetsoalLocalDatasource().getId;
                            return TextButton(
                              onPressed: () {
                                if (_imageFile == null &&
                                        _soalController!.text.isEmpty ||
                                    _selectedDifficulty.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text('Semua Wajib diisi'),
                                    ),
                                  );
                                } else {
                                  final requestModel = AddSoalRequestModel(
                                    matkulId: widget.matkulId.toString(),
                                    soal: _soalController!.text,
                                    image: _imageFile!,
                                    tingkat: _selectedDifficulty,
                                  );
                                  context
                                      .read<AddSoalBloc>()
                                      .add(AddSoalEvent.addSoal(requestModel));
                                  // debugPrint(requestModel.matkulId);
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
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                      },
                    )),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
