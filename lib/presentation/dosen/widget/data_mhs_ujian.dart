import 'package:flutter/material.dart';

import '../../../common/constants/colors.dart';

class DataMhsUjianTile extends StatefulWidget {
  // final CourseScheduleModel data;
  const DataMhsUjianTile({super.key});

  @override
  State<DataMhsUjianTile> createState() => _DataMhsUjianState();
}

class _DataMhsUjianState extends State<DataMhsUjianTile> {
  ScrollController scrollController = ScrollController();
  bool activated = false;
  bool endScroll = false;
  String? selectedOption;
  bool isClicked = false;

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
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Untuk kembali ke halaman sebelumnya
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'List Pengajuan Mahasiswa',
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
              SizedBox(
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
              SizedBox(width: 5.0),
              VerticalDivider(),
              SizedBox(width: 5.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Awwir Wahyudin',
                      style: TextStyle(
                        color: ColorName.primary,
                      ),
                    ),
                    SizedBox(height: 18.0),
                    Text(
                      '60900120025',
                      style: TextStyle(
                        color: ColorName.grey,
                      ),
                    ),
                    SizedBox(height: 18.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
        
                          },
                          child: Text(
                            'Lihat SK Kompren',
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorName.primary,
                              decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isClicked = !isClicked;
                                });
                                _showSuccessDialog();
                              },
                              child: Text(
                                isClicked ? 'Belum Dapat Ujian' : 'Dapat Ikut Ujian',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: isClicked ? Colors.red : Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
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
