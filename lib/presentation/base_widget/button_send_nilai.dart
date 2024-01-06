import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:cbt_app/bloc/kirim_sk/kirim_sk_bloc.dart';
import 'package:cbt_app/data/models/request/kirim_sk_request_model.dart';
import 'package:cbt_app/presentation/base_widget/pdf_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../bloc/penilaian/penilaian_bloc.dart';
import '../../common/constants/colors.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:open_file/open_file.dart';

import '../../data/datasource/kirim_sk_remote_datasource.dart/kirim_sk_remote_datasource.dart';
import '../dosen/widget/open_pdf_down.dart';

class ButtonSendNilai extends StatefulWidget {
  final String dosenPenguji;
  final int matkulId;
  final String matkul;
  final String mahasiswa;
  final String nim;

  const ButtonSendNilai(
      {super.key,
      required this.dosenPenguji,
      required this.matkulId,
      required this.matkul,
      required this.mahasiswa,
      required this.nim});

  @override
  State<ButtonSendNilai> createState() => _ButtonSendNilaiState();
}

class _ButtonSendNilaiState extends State<ButtonSendNilai> {
  TextEditingController? nilaiAkhir;
  TextEditingController? keterangan;
  late KirimSkRequestModel requestData;
  Uint8List? responseList;

  @override
  void initState() {
    nilaiAkhir = TextEditingController();
    keterangan = TextEditingController();
    responseList;
    // initializeDateFormatting('id', null).then((_) {
    //   // Format tanggal sekarang
    //   String formattedDate = DateFormat.yMMMMd('id').format(DateTime.now());
    //   requestData = KirimSkRequestModel(
    //     dosenPenguji: widget.dosenPenguji,
    //     mataKuliahId: widget.matkulId,
    //     mataKuliah: widget.matkul,
    //     namaMahasiswa: widget.mahasiswa,
    //     nimMahasiswa: widget.nim,
    //     nilaiAngka: nilaiAkhir?.text ?? '',
    //     tanggalSk: formattedDate,
    //     keterangan: keterangan?.text ?? '',
    //   );
    //   // Lakukan hal lain setelah inisialisasi berhasil
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Kirim Nilai',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text('Nilai Akhir (Konversi Remedial)'),
            TextFormField(
              controller: nilaiAkhir,
              decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
              // ...
            ),
            SizedBox(height: 20),
            Text('Keterangan Surat'),
            TextFormField(
              controller: keterangan,
              decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
              // ...
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: BlocListener<KirimSkBloc, KirimSkState>(
                listener: (context, state) {
                  state.maybeWhen(
                      orElse: () {},
                      loaded: (data) async {
                         
                        // context.read<AddSoalBloc>().add(AddSoalEvent.addSoal(data));
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //     backgroundColor: Colors.greenAccent,
                        //     content: Text('Data Berhasil Di kirim'),
                        //   ),
                        // );
                       
                      },
                      error: (message) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          '$message',
                        )));
                      });
                },
                child: BlocBuilder<KirimSkBloc, KirimSkState>(
                  builder: (context, state) {
                    return state.maybeWhen(orElse: () {
                      String formatDate(DateTime date) {
                        initializeDateFormatting(
                            'id'); // Menginisialisasi format tanggal untuk bahasa Indonesia
                        return DateFormat.yMMMMd('id').format(date);
                      }

                      String formattedDate = formatDate(DateTime.now());
                      return TextButton(
                          onPressed: () async {
                            // Aksi yang dijalankan saat tombol ditekan
                            final requestData = KirimSkRequestModel(
                              dosenPenguji: widget.dosenPenguji,
                              mataKuliahId: widget.matkulId,
                              mataKuliah: widget.matkul,
                              namaMahasiswa: widget.mahasiswa,
                              nimMahasiswa: widget.nim,
                              nilaiAngka: nilaiAkhir?.text ?? '',
                              tanggalSk: formattedDate,
                              keterangan: keterangan?.text ?? '',
                            );

                            context.read<KirimSkBloc>().add(
                                KirimSkEvent.kirimSK(
                                    requestData, widget.matkul, context));

                            // Memeriksa status izin
    

                            final result = await KirimSkRemoteDatasource().kirimSK( context, requestData, widget.matkul);
                            result.fold(
                              (l) {
                                Text('Gagal Melakukan Navigasi');
                              },
                              (r) {
                                // Gunakan path yang dikembalikan ke kelas PDFViewers
                                Future<void> openLocalPDF(String filePath) async {
                                  final result = await OpenFile.open(filePath);

                                  var statusManage = await Permission.manageExternalStorage.status;
                                    if (!statusManage.isGranted) {
                                      await Permission.manageExternalStorage.request();
                                    }

                                  if (result.type == ResultType.done) {
                                    print('File opened: ${result.message}');
                                  } else {
                                    print('Error opening file: ${result.message}');
                                  }
                                }

                                openLocalPDF(r);
                              },
                              
                            );
                            print('ini adalah $result');
                            

                            Navigator.pop(context);

                            Future<void> _refreshData() async {
                              context.read<PenilaianBloc>().add(PenilaianEvent.penilaian(widget.matkulId.toString()));
                            }
                            _refreshData();
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: ColorName.primary),
                          child: const Text(
                            'Simpan',
                            style: TextStyle(
                              color: Colors.white, // Warna teks tombol
                            ),
                          ));
                    }, loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
