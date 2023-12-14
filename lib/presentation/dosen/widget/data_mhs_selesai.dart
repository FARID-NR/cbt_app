import 'package:cbt_app/data/datasource/endpoint/endpoint_local_datasource.dart';
import 'package:cbt_app/presentation/base_widget/button_lihat_nilai.dart';
import 'package:cbt_app/presentation/base_widget/button_send_nilai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/penilaian/penilaian_bloc.dart';
import '../../../common/constants/colors.dart';

class DataMhsSelesaiTile extends StatefulWidget {
  // final CourseScheduleModel data;
  const DataMhsSelesaiTile({super.key, required int userId});

  @override
  State<DataMhsSelesaiTile> createState() => _DataMhsSelesaiTile();
}

class _DataMhsSelesaiTile extends State<DataMhsSelesaiTile> {
  ScrollController scrollController = ScrollController();
  String message = "";
  bool activated = false;
  bool endScroll = false;
  String? selectedOption;

  String matkulId = '${EndpointLocalDatasource().getIdEndpoint()}';

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
      child: BlocBuilder<PenilaianBloc, PenilaianState>(
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return Scaffold(
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
            );
          }, loading: () {
            return Scaffold(
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
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }, loaded: (data) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    // Untuk kembali ke halaman sebelumnya
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  'Data Ujian ${data.data.matkul.nama}',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ColorName.primary),
                ),
              ),
              body: ListView.builder(
                itemCount: data.data.mahasiswa.length,
                itemBuilder: (context, index) {
                  final idMatkul = data.data.matkul.id;
                  final idMhs = data.data.mahasiswa[index].id;
                  debugPrint(idMatkul.toString());
                  debugPrint(idMhs.toString());
                  return IntrinsicHeight(
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
                                  child: Text('${index + 1}.'),
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
                                data.data.mahasiswa[index].nama,
                                style: const TextStyle(
                                  color: ColorName.primary,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                data.data.mahasiswa[index].username,
                                style: const TextStyle(
                                  color: ColorName.primary,
                                ),
                              ),
                              const SizedBox(height: 18.0),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          // Aksi yang dijalankan saat tombol ditekan
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Color.fromARGB(
                                                0, 255, 255, 255),
                                            context: context,
                                            builder: (BuildContext Context) {
                                              return StatefulBuilder(
                                                builder: (BuildContext context,
                                                    StateSetter setState) {
                                                  return ButtonViewScore(
                                                      idMatkul: idMatkul,
                                                      idMhs: idMhs);
                                                },
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          'Lihat Nilai',
                                          style: TextStyle(
                                            color: Colors
                                                .white, // Warna teks tombol
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
                                            color: Colors
                                                .white, // Warna teks tombol
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors
                                              .red, // Warna latar belakang tombol
                                        ),
                                      ),
                                      SizedBox(width: 10),
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
                                                  return ButtonSendNilai();
                                                });
                                              });
                                        },
                                        child: Text(
                                          'Kirim Nilai',
                                          style: TextStyle(
                                            color: Colors
                                                .white, // Warna teks tombol
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
                  );
                },
              ),
            );
          });
        },
      ),
    );
  }
}
