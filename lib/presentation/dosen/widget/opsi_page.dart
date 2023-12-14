import 'package:cbt_app/common/constants/colors.dart';
import 'package:flutter/material.dart';

class OpsiPage extends StatefulWidget {
  const OpsiPage({super.key});

  @override
  State<OpsiPage> createState() => _OpsiPageState();
}

class _OpsiPageState extends State<OpsiPage> {
  String fileName = "Upload Gambar";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Soal',
          style: TextStyle(
            fontSize: 20,
            color: ColorName.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Opsi A',
                  border: OutlineInputBorder(),
                ),
                // ...
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  // UploadFile(
                  //   // fileName: ,
                  //   onFileSelected: (File file) {
                  //     // Periksa jenis file sebelum mengambil tindakan
                  //     final isImage = ['.jpeg', '.png', '.gif', '.jpg'].any(
                  //         (extension) =>
                  //             file.path.toLowerCase().endsWith(extension));

                  //     if (isImage) {
                  //       // Lakukan sesuatu dengan file gambar yang dipilih di sini
                  //       print('Selected file: ${file.path}');
                  //       // Perbarui nama file di sini
                  //       setState(() {
                  //         fileName = file.path.split('/').last;
                  //       });
                  //     } else {
                  //       // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                  //       print('File yang dipilih harus file gambar');
                  //       // Misalnya, tampilkan pesan kesalahan
                  //       showDialog(
                  //         context: context,
                  //         builder: (BuildContext context) {
                  //           return AlertDialog(
                  //             title: Text('File yang dipilih bukan file gambar'),
                  //             actions: <Widget>[
                  //               TextButton(
                  //                 onPressed: () {
                  //                   Navigator.of(context).pop();
                  //                 },
                  //                 child: Text('OK'),
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
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(
                                8)), // Membuat garis border melingkar
                      ),
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          fileName,
                          style: TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Opsi A',
                  border: OutlineInputBorder(),
                ),
                // ...
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  // UploadFile(
                  //   // fileName: ,
                  //   onFileSelected: (File file) {
                  //     // Periksa jenis file sebelum mengambil tindakan
                  //     final isImage = ['.jpeg', '.png', '.gif', '.jpg'].any(
                  //         (extension) =>
                  //             file.path.toLowerCase().endsWith(extension));

                  //     if (isImage) {
                  //       // Lakukan sesuatu dengan file gambar yang dipilih di sini
                  //       print('Selected file: ${file.path}');
                  //       // Perbarui nama file di sini
                  //       setState(() {
                  //         fileName = file.path.split('/').last;
                  //       });
                  //     } else {
                  //       // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                  //       print('File yang dipilih harus file gambar');
                  //       // Misalnya, tampilkan pesan kesalahan
                  //       showDialog(
                  //         context: context,
                  //         builder: (BuildContext context) {
                  //           return AlertDialog(
                  //             title: Text('File yang dipilih bukan file gambar'),
                  //             actions: <Widget>[
                  //               TextButton(
                  //                 onPressed: () {
                  //                   Navigator.of(context).pop();
                  //                 },
                  //                 child: Text('OK'),
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
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(
                                8)), // Membuat garis border melingkar
                      ),
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          fileName,
                          style: TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Opsi A',
                  border: OutlineInputBorder(),
                ),
                // ...
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  // UploadFile(
                  //   // fileName: ,
                  //   onFileSelected: (File file) {
                  //     // Periksa jenis file sebelum mengambil tindakan
                  //     final isImage = ['.jpeg', '.png', '.gif', '.jpg'].any(
                  //         (extension) =>
                  //             file.path.toLowerCase().endsWith(extension));

                  //     if (isImage) {
                  //       // Lakukan sesuatu dengan file gambar yang dipilih di sini
                  //       print('Selected file: ${file.path}');
                  //       // Perbarui nama file di sini
                  //       setState(() {
                  //         fileName = file.path.split('/').last;
                  //       });
                  //     } else {
                  //       // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                  //       print('File yang dipilih harus file gambar');
                  //       // Misalnya, tampilkan pesan kesalahan
                  //       showDialog(
                  //         context: context,
                  //         builder: (BuildContext context) {
                  //           return AlertDialog(
                  //             title: Text('File yang dipilih bukan file gambar'),
                  //             actions: <Widget>[
                  //               TextButton(
                  //                 onPressed: () {
                  //                   Navigator.of(context).pop();
                  //                 },
                  //                 child: Text('OK'),
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
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(
                                8)), // Membuat garis border melingkar
                      ),
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          fileName,
                          style: TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Opsi A',
                  border: OutlineInputBorder(),
                ),
                // ...
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  // UploadFile(
                  //   // fileName: ,
                  //   onFileSelected: (File file) {
                  //     // Periksa jenis file sebelum mengambil tindakan
                  //     final isImage = ['.jpeg', '.png', '.gif', '.jpg'].any(
                  //         (extension) =>
                  //             file.path.toLowerCase().endsWith(extension));

                  //     if (isImage) {
                  //       // Lakukan sesuatu dengan file gambar yang dipilih di sini
                  //       print('Selected file: ${file.path}');
                  //       // Perbarui nama file di sini
                  //       setState(() {
                  //         fileName = file.path.split('/').last;
                  //       });
                  //     } else {
                  //       // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                  //       print('File yang dipilih harus file gambar');
                  //       // Misalnya, tampilkan pesan kesalahan
                  //       showDialog(
                  //         context: context,
                  //         builder: (BuildContext context) {
                  //           return AlertDialog(
                  //             title: Text('File yang dipilih bukan file gambar'),
                  //             actions: <Widget>[
                  //               TextButton(
                  //                 onPressed: () {
                  //                   Navigator.of(context).pop();
                  //                 },
                  //                 child: Text('OK'),
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
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(
                                8)), // Membuat garis border melingkar
                      ),
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          fileName,
                          style: TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Opsi A',
                  border: OutlineInputBorder(),
                ),
                // ...
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  // UploadFile(
                  //   // fileName: ,
                  //   onFileSelected: (File file) {
                  //     // Periksa jenis file sebelum mengambil tindakan
                  //     final isImage = ['.jpeg', '.png', '.gif', '.jpg'].any(
                  //         (extension) =>
                  //             file.path.toLowerCase().endsWith(extension));

                  //     if (isImage) {
                  //       // Lakukan sesuatu dengan file gambar yang dipilih di sini
                  //       print('Selected file: ${file.path}');
                  //       // Perbarui nama file di sini
                  //       setState(() {
                  //         fileName = file.path.split('/').last;
                  //       });
                  //     } else {
                  //       // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                  //       print('File yang dipilih harus file gambar');
                  //       // Misalnya, tampilkan pesan kesalahan
                  //       showDialog(
                  //         context: context,
                  //         builder: (BuildContext context) {
                  //           return AlertDialog(
                  //             title: Text('File yang dipilih bukan file gambar'),
                  //             actions: <Widget>[
                  //               TextButton(
                  //                 onPressed: () {
                  //                   Navigator.of(context).pop();
                  //                 },
                  //                 child: Text('OK'),
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
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(
                                8)), // Membuat garis border melingkar
                      ),
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          fileName,
                          style: TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ));
  }
}
