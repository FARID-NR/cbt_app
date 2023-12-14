import 'package:flutter/material.dart';

import '../../common/constants/colors.dart';

class ButtonJawaban extends StatefulWidget {
  const ButtonJawaban({super.key, required int matkulId});

  @override
  State<ButtonJawaban> createState() => _ButtonJawabanState();
}

class _ButtonJawabanState extends State<ButtonJawaban> {
  String fileName = "Upload Gambar";
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 838,
      decoration: const BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: ColorName.primary,
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
                    color: ColorName.primary),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  labelText: 'Opsi A',
                  border: OutlineInputBorder(),
                ),
                // ...
              ),
              const SizedBox(height: 10),
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
              TextFormField(
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  labelText: 'Opsi B',
                  border: OutlineInputBorder(),
                ),
                // ...
              ),
              const SizedBox(height: 10),
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
                  //       // print(
                  //       //     'Selected file: ${file.path}');
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
              TextFormField(
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  labelText: 'Opsi C',
                  border: OutlineInputBorder(),
                ),
                // ...
              ),
              const SizedBox(height: 10),
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
              TextFormField(
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  labelText: 'Opsi D',
                  border: OutlineInputBorder(),
                ),
                // ...
              ),
              const SizedBox(height: 10),
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
              TextFormField(
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  labelText: 'Opsi E',
                  border: OutlineInputBorder(),
                ),
                // ...
              ),
              const SizedBox(height: 10),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Jawaban Benar :',
                    style: TextStyle(color: ColorName.primary),
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'A',
                        groupValue: selectedOption,
                        onChanged: (String? value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                      ),
                      const Text('A'),
                      Radio<String>(
                        value: 'B',
                        groupValue: selectedOption,
                        onChanged: (String? value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                      ),
                      const Text('B'),
                      Radio<String>(
                        value: 'C',
                        groupValue: selectedOption,
                        onChanged: (String? value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                      ),
                      const Text('C'),
                      Radio<String>(
                        value: 'D',
                        groupValue: selectedOption,
                        onChanged: (String? value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                      ),
                      const Text('D'),
                      Radio<String>(
                        value: 'E',
                        groupValue: selectedOption,
                        onChanged: (String? value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                      ),
                      const Text('E'),
                    ],
                  ),
                ],
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
      ),
    );
  }
}
