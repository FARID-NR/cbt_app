import 'dart:convert';
import 'dart:io';

import 'package:cbt_app/bloc/endpoint/endpoint_bloc.dart';
import 'package:cbt_app/bloc/ujian/ujian_bloc.dart';
import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/common/extensions/build_context_ext.dart';
import 'package:cbt_app/data/models/request/download_sk_request_model.dart';
import 'package:cbt_app/presentation/mahasiswa/cbt_page/cbt_screen.dart';
import 'package:cbt_app/presentation/mahasiswa/cbt_page/pages/quiz_start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_mode/kiosk_mode.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';

import '../../../../bloc/download_sk/download_sk_bloc.dart';
import '../../../../bloc/hasil-ujian/hasil_ujian_bloc.dart';
import '../../cbt_page/models/quiz_model.dart';

class StartPage extends StatefulWidget {
  final String matkulId;
  final String userId;
// Tambahkan variabel untuk menunjukkan apakah nilai asli ada atau tidak

  const StartPage({
    Key? key,
    required this.matkulId,
    required this.userId,
  }) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool _isPermissionRequestInProgress = false;

  // Modify the method to handle permission requests
  Future<void> _handleStoragePermission() async {
    if (_isPermissionRequestInProgress) {
      // If a permission request is already in progress, exit the method
      return;
    }

    var status = await Permission.storage.status;

    if (!status.isGranted) {
      setState(() {
        _isPermissionRequestInProgress = true;
      });

      try {
        if (!await Permission.storage.isRestricted) {
          final newStatus = await Permission.storage.request();

          if (newStatus.isGranted) {
            await _moveFileToExternalStorage();
          } else {
            debugPrint("Storage permission denied");
          }
        } else {
          debugPrint("Storage permission request is already running");
        }
      } catch (e) {
        debugPrint("Error: $e");
      } finally {
        setState(() {
          _isPermissionRequestInProgress = false;
        });
      }
    } else {
      await _moveFileToExternalStorage();
    }
  }

  Future<void> _moveFileToExternalStorage() async {
    // Memeriksa status izin akses penyimpanan
    var status = await Permission.storage.status;

    if (status.isGranted) {
      // Izin telah diberikan, lanjutkan dengan penyimpanan file
      // ... code untuk menyimpan file
    } else {
      // Izin belum diberikan, minta izin
      if (!_isPermissionRequestInProgress) {
        setState(() {
          _isPermissionRequestInProgress = true;
        });

        try {
          status = await Permission.storage.request();

          if (status.isGranted) {
            // Izin telah diberikan setelah diminta, lanjutkan dengan penyimpanan file
            // ... code untuk menyimpan file setelah izin diberikan
          } else {
            // Izin tidak diberikan
            debugPrint("Izin akses ke penyimpanan tidak diberikan");
            // Tempatkan logika atau pesan yang sesuai ketika izin tidak diberikan
          }
        } catch (e) {
          debugPrint("Error: $e");
        } finally {
          setState(() {
            _isPermissionRequestInProgress = false;
          });
        }
      } else {
        debugPrint("Permintaan izin sedang berlangsung");
      }
    }
  }

  // @override
  // void initState() {
  //   context.read<UjianBloc>().add(UjianEvent.getUjian(matkulId: widget.matkulId));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Ruang Ujian',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: ColorName.primary,
          ),
        ),
      ),
      body: BlocBuilder<HasilUjianBloc, HasilUjianState>(
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return const Center(child: Text('Error'));
          }, loading: () {
            return const Center(child: CircularProgressIndicator());
          }, loaded: (data) {
            final status = data.success;
            final statusSk = data.data.sk;
            final statusRemedial = data.data.remidial;
            final statusNilaiAsli = data.data.nilaiAsli;
            final jumlahBenar = data.data.jumlahBenar;
            final jumlahSalah = data.data.jumlahSalah;
            final nilaiRmdl = data.data.nilaiRemidial;
            final nmMatkul = data.data.matkul.nama;
            final dosenPenguji = data.data.matkul.user.nama;
            final nmMhs = data.data.mahasiswa.nama;
            final nimMhs = data.data.mahasiswa.username;
            final nilaiAsliString = data.data.nilaiAsli;
            return Container(
              color: ColorName.light,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ... Widget lainnya
                    const Text(
                      'Ujian Dimulai',
                      style: TextStyle(
                        fontSize: 20,
                        color: ColorName.primary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    // Teks tombol dinamis sesuai kondisi data
                    if (statusSk != null && nilaiAsliString != null)
                      BlocBuilder<DownloadSkBloc, DownloadSkState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return ElevatedButton(
                                onPressed: () {
                                  // Ubah ini sesuai dengan kebutuhan Anda
                                  final requestModel = DownloadSkRequestModel(
                                    dosenPenguji: dosenPenguji,
                                    mataKuliahId: widget.matkulId,
                                    mataKuliah: nmMatkul,
                                    namaMahasiswa: nmMhs,
                                    nimMahasiswa: nimMhs,
                                    nilaiAngka:
                                        nilaiAsliString, // Ubah ini sesuai dengan kebutuhan Anda
                                  );
                                  context.read<DownloadSkBloc>().add(
                                      DownloadSkEvent.download_sk(
                                          requestModel, nmMatkul));

                                  // Menyimpan file setelah berhasil diunduh
                                  // context
                                  //     .read<DownloadSkBloc>()
                                  //     .stream
                                  //     .listen((state) async {
                                  //   state.maybeWhen(
                                  //     loaded: (pdfData) async {
                                  //       // await _handleStoragePermission();
                                  //       await _moveFileToExternalStorage();
                                  //     },
                                  //     orElse: () {},
                                  //   );
                                  // });
                                },
                                child: const Text('Download PDF'),
                              );
                            },
                            loading: () {
                              return const CircularProgressIndicator();
                            },
                          );
                        },
                      )

                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Tindakan ketika tombol 'Download SK' ditekan
                    //     final nilaiAsliString = data.data.nilaiAsli;
                    //     // final nilaiAngka = int.tryParse(nilaiAsliString) ?? 0;
                    //     final requestModel = DownloadSkRequestModel(
                    //       dosenPenguji: data.data.matkul.user.nama,
                    //       mataKuliahId: data.data.matkul.id.toString(),
                    //       mataKuliah: data.data.matkul.nama,
                    //       namaMahasiswa: data.data.mahasiswa.nama,
                    //       nimMahasiswa: data.data.mahasiswa.username,
                    //       // nilaiAngka: nilaiAsliString
                    //       nilaiAngka: utf8.encode(String.fromCharCodes(nilaiAsliString)).toString()
                    //     );
                    //     context.read<DownloadSkBloc>().add(DownloadSkEvent.download_sk(requestModel));

                    //     // Menyimpan file setelah berhasil diunduh
                    //     context.read<DownloadSkBloc>().stream.listen((state) async {
                    //       state.maybeWhen(
                    //         loaded: (pdfData) async {
                    //           // Mendapatkan direktori penyimpanan aplikasi
                    //           Directory appDocDir = await getApplicationDocumentsDirectory();

                    //           // Menyimpan file PDF ke diektori penyimpanan aplikasi
                    //           File file = File('${appDocDir.path}/nama_file.pdf');
                    //           await file.writeAsBytes(pdfData); // Menyimpan data PDF ke file
                    //         },
                    //         orElse: () {}, // Lakukan sesuatu jika state bukanlah state 'loaded'
                    //       );
                    //     });
                    //   },
                    //   child: const Text('Download PDF'),
                    // )
                    else if (statusRemedial == true)
                      if (nilaiRmdl != null)
                        Column(
                          children: [
                            const Text('Nilai Anda remid'),
                            Text('${data.data.nilaiRemidial}'),
                            const Text('Dengan Jumlah Benar & Salah'),
                            Text('Benar : ${data.data.jumlahBenar}'),
                            Text('Salah : ${data.data.jumlahSalah}')
                          ],
                        )
                      else
                        ElevatedButton(
                          onPressed: () async {
                            // await startKioskMode();
                            context.push(
                              QuizStartPage(
                                matkulId: widget.matkulId,
                                userId: widget.userId,
                              ),
                            );
                          },
                          child: const Text('Mulai Remedial'),
                        )
                    else if (statusNilaiAsli != null)
                      Column(
                        children: [
                          const Text('Nilai Anda asli'),
                          Text('${data.data.nilaiAsli}'),
                          const Text('Dengan Jumlah Benar & Salah'),
                          Text('Benar : ${data.data.jumlahBenar}'),
                          Text('Salah : ${data.data.jumlahSalah}'),
                        ],
                      )
                    else if (data.data.remidial == false &&
                        data.data.nilaiAsli != 0 &&
                        data.data.jumlahBenar != 0 &&
                        data.data.jumlahSalah != 0 &&
                        data.data.nilaiRemidial == null &&
                        data.data.sk == null)
                      ElevatedButton(
                        onPressed: () async {
                          // await startKioskMode();
                          // context.push(
                          //   QuizStartPage(
                          //     matkulId: widget.matkulId,
                          //     userId: widget.userId,
                          //   ),
                          // );
                        },
                        child: const Text('Tidak Ada Ujian'),
                      )
                    else
                      if (status == true)
                      BlocBuilder<UjianBloc, UjianState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Anda Belum Diizinkan Untuk Ujian'),
                                        backgroundColor: Colors
                                            .red, // Atur warna background menjadi merah
                                      ),
                                    );
                                }, 
                                child: const Text('Mulai Ujian'),
                              );
                            },
                            loading: () => const Center(child: CircularProgressIndicator()),
                            loaded: (data) {
                              final status = data.success;
                              return ElevatedButton(
                                onPressed: () async {
                                  // await startKioskMode();
                                  if (status == false) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Anda Belum Diizinkan Untuk Ujian'),
                                        backgroundColor: Colors
                                            .red, // Atur warna background menjadi merah
                                      ),
                                    );
                                  } else {
                                    context.push(
                                      QuizStartPage(
                                        matkulId: widget.matkulId,
                                        userId: widget.userId,
                                      ),
                                    );
                                  }
                                },
                                child: const Text('Mulai Ujian'),
                              );
                            }
                          );
                          
                        },
                      )
                      else
                        const Text('Ujian Belum Dimulai')
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
