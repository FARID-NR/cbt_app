import 'package:flutter/material.dart';

import '../../../common/constants/colors.dart';

class DataMhsSelesaiTile extends StatefulWidget {
  // final CourseScheduleModel data;
  const DataMhsSelesaiTile({super.key});

  @override
  State<DataMhsSelesaiTile> createState() => _DataMhsSelesaiTile();
}

class _DataMhsSelesaiTile extends State<DataMhsSelesaiTile> {
  ScrollController scrollController = ScrollController();
  String message = "";
  bool activated = false;
  bool endScroll = false;
  String? selectedOption;

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Perubahan Berhasil'),
          content: Text('Status berhasil diubah.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Untuk kembali ke halaman sebelumnya
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Data Mahasiswa Ujian',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ColorName.primary),
          ),
        ),
        body: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 45.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('1.'),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          color: ColorName.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 5.0),
              const VerticalDivider(),
              const SizedBox(width: 5.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '60900120025',
                      style: TextStyle(
                        color: ColorName.primary,
                      ),
                    ),
                    SizedBox(height: 18.0),
                    Text(
                      'Remedial',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 18.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Action :',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Aksi yang dijalankan saat tombol ditekan
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor:
                                      Color.fromARGB(0, 255, 255, 255),
                                  context: context,
                                  builder: (BuildContext Context) {
                                    return StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter setState) {
                                        return Container(
                                          height: 838,
                                          decoration: BoxDecoration(
                                            color: ColorName.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                top: 60,
                                                bottom: 20.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: IconButton(
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_outlined,
                                                        color: ColorName
                                                            .primary,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pop(
                                                            context);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(height: 20),
                                                  Text(
                                                    'Lihat Soal',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: ColorName
                                                            .primary),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text('Nilai Akhir'),
                                                  Container(
                                                    width: double.maxFinite,
                                                    padding: EdgeInsets.all(
                                                        16.0),
                                                    decoration:
                                                        BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                                  8.0),
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Teks yang tidak dapat diubah',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text('Nilai Remedial'),
                                                  Container(
                                                    width: double.maxFinite,
                                                    padding: EdgeInsets.all(
                                                        16.0),
                                                    decoration:
                                                        BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                                  8.0),
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Teks yang tidak dapat diubah',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                      'Jumlah Benar (Pengerjaan Terakhir)'),
                                                  Container(
                                                    width: double.maxFinite,
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    decoration:
                                                        BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                                  8.0),
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Teks yang tidak dapat diubah',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                      'Jumlah Salah (Pengerjaan Terakhir)'),
                                                  Container(
                                                    width: double.maxFinite,
                                                    padding: EdgeInsets.all(
                                                        16.0),
                                                    decoration:
                                                        BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                                  8.0),
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Teks yang tidak dapat diubah',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 20),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(
                                                            bottom: 5),
                                                    child: Align(
                                                      alignment: Alignment
                                                          .bottomRight,
                                                      child: TextButton(
                                                        onPressed: () {
                                                          // Aksi yang dijalankan saat tombol ditekan
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          'Close',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .white, // Warna teks tombol
                                                          ),
                                                        ),
                                                        style: TextButton.styleFrom(
                                                            backgroundColor:
                                                                ColorName
                                                                    .primary),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Lihat Nilai',
                                style: TextStyle(
                                  color: Colors.white, // Warna teks tombol
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors
                                    .blueAccent, // Warna latar belakang tombol
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                // Aksi yang dijalankan saat tombol ditekan
                                _showSuccessDialog();
                              },
                              child: Text(
                                'Remedial',
                                style: TextStyle(
                                  color: Colors.white, // Warna teks tombol
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors
                                    .red, // Warna latar belakang tombol
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                // Aksi yang dijalankan saat tombol ditekan
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext Context) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return Container(
                                          height: 700,
                                          decoration: BoxDecoration(
                                            color: ColorName.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.all(20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.topRight,
                                                  child: IconButton(
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                      color: Colors.black,
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context);
                                                    },
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                Text(
                                                  'Kirim Nilai',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                Text(
                                                  'Nilai Akhir (Konversi Remedial)'
                                                ),
                                                TextFormField(
                                                  decoration:
                                                      InputDecoration(
                                                    labelText:
                                                        '',
                                                    border:
                                                        OutlineInputBorder(),
                                                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10)
                                                  ),
                                                  // ...
                                                ),
                                                SizedBox(height: 20),
                                                Text(
                                                  'Keterangan Surat'
                                                ),
                                                TextFormField(
                                                  decoration:
                                                      InputDecoration(
                                                    labelText:
                                                        '',
                                                    border:
                                                        OutlineInputBorder(),
                                                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10)
                                                  ),
                                                  // ...
                                                ),
        
                                                Align(
                                                  alignment: Alignment.bottomRight,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      // Aksi yang dijalankan saat tombol ditekan
                                                      Navigator.pop(
                                                        context
                                                      );
                                                    },
                                                    child: Text(
                                                      'Simpan',
                                                      style: TextStyle(
                                                        color: Colors.white, // Warna teks tombol
                                                      ),
                                                    ),
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:ColorName.primary
                                                    )
                                                  ),
                                                ),
        
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                    });
                              },
                              child: Text(
                                'Kirim Nilai',
                                style: TextStyle(
                                  color: Colors.white, // Warna teks tombol
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors
                                    .green, // Warna latar belakang tombol
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
