import 'package:flutter/material.dart';

import '../../common/constants/colors.dart';

class ButtonEdit extends StatefulWidget {
  const ButtonEdit({super.key});

  @override
  State<ButtonEdit> createState() => _ButtonEditState();
}

class _ButtonEditState extends State<ButtonEdit> {
  String _selectedDifficulty = 'Mudah';
  String fileName = "Upload Gambar";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
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
                    decoration: const InputDecoration(
                      labelText: 'Masukkan Soal',
                      border: OutlineInputBorder(),
                    ),
                    // ...
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      // UploadFile(
                      //   // fileName: ,
                      //   onFileSelected: (File file) {
                      //     // Periksa jenis file sebelum mengambil tindakan
                      //     final isImage = [
                      //       '.jpeg',
                      //       '.png',
                      //       '.gif',
                      //       '.jpg'
                      //     ].any((extension) => file.path.toLowerCase().endsWith(extension));

                      //     if (isImage) {
                      //       // Lakukan sesuatu dengan file gambar yang dipilih di sini
                      //       if (kDebugMode) {
                      //         print('Selected file: ${file.path}');
                      //       }
                      //       // Perbarui nama file di sini
                      //       setState(() {
                      //         fileName = file.path.split('/').last;
                      //       });
                      //     } else {
                      //       // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                      //       if (kDebugMode) {
                      //         print('File yang dipilih harus file gambar');
                      //       }
                      //       // Misalnya, tampilkan pesan kesalahan
                      //       showDialog(
                      //         context: context,
                      //         builder: (BuildContext context) {
                      //           return AlertDialog(
                      //             title: const Text('File yang dipilih bukan file gambar'),
                      //             actions: <Widget>[
                      //               TextButton(
                      //                 onPressed: () {
                      //                   Navigator.of(context).pop();
                      //                 },
                      //                 child: const Text('OK'),
                      //               ),
                      //             ],
                      //           );
                      //         },
                      //       );
                      //     }
                      //   },
                      // ),

                      Expanded(
                        child: Container(
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
                              fileName,
                              style: const TextStyle(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )
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
                      child: TextButton(
                        onPressed: () {
                          // Aksi yang dijalankan saat tombol ditekan
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: ColorName.primary),
                        child: const Text(
                          'Simpan',
                          style: TextStyle(
                            color: Colors.white, // Warna teks tombol
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
