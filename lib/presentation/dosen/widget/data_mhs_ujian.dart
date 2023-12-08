import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/pengajuan/pengajuan_bloc.dart';
import '../../../common/constants/colors.dart';

class DataMhsUjianTile extends StatefulWidget {
  // final CourseScheduleModel data;
  const DataMhsUjianTile({super.key, required int selectedUserId});

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
        body: BlocBuilder<PengajuanBloc, PengajuanState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return const Text('Belum ada pengajuan baru');
              },
              loading: () {
                return const Center(child: CircularProgressIndicator(),);
              },
              loaded: (data) {
                return ListView.builder(
                  itemCount: data.data.mahasiswa.length,
                  itemBuilder: (context, index) {
                    return IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 45.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text('${index + 1}.'),
                                  ),
                                  const Text(
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
                                  data.data.mahasiswa[index].nama,
                                  style: const TextStyle(
                                    color: ColorName.primary,
                                  ),
                                ),
                                const SizedBox(height: 18.0),
                                Text(
                                  data.data.mahasiswa[index].username,
                                  style: const TextStyle(
                                    color: ColorName.grey,
                                  ),
                                ),
                                const SizedBox(height: 18.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        
                                      },
                                      child: const Text(
                                        'Lihat SK Kompren',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ColorName.primary,
                                            decoration: TextDecoration.underline),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              isClicked = !isClicked;
                                            });
                                            _showSuccessDialog();
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                isClicked ? Colors.red : Colors.green,
                                          ),
                                          child: Text(
                                            isClicked
                                                ? 'Belum Dapat Ujian'
                                                : 'Dapat Ikut Ujian',
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
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
                    );
                  },
                  
                );
              }
            );
            
          },
        ),
      ),
    );
  }
}
