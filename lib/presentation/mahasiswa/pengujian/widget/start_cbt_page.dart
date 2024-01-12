import 'package:cbt_app/bloc/ujian/ujian_bloc.dart';
import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/common/extensions/build_context_ext.dart';
import 'package:cbt_app/data/datasource/ujian/ujian_remote_datasource.dart';
import 'package:cbt_app/data/models/request/download_sk_request_model.dart';
import 'package:cbt_app/presentation/mahasiswa/cbt_page/pages/quiz_start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_mode/kiosk_mode.dart';

import '../../../../bloc/download_sk/download_sk_bloc.dart';
import '../../../../bloc/hasil-ujian/hasil_ujian_bloc.dart';

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

  //  @override
  // void initState() {
  //   super.initState();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    
  // }

  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  //   // SystemChrome.removeListener(systemUIChangeCallback);
  //   super.dispose();
  // }

  void systemUIChangeCallback() {
    final bool isSystemUIVisible =
        MediaQuery.of(context).viewInsets.bottom == 0;

    if (!isSystemUIVisible) {
      // Tampilkan notifikasi atau peringatan di sini
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Peringatan'),
            content: const Text('Dilarang untuk keluar dari mode layar penuh.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(); // Kembali ke PengujianMhsPage
        return false;
      },
      child: Scaffold(
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
                                        DownloadSkEvent.downloadSk(
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
                              final result = await UjianRemoteDatasource().getUjian(widget.matkulId);
                              result.fold(
                                (l) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Ujian Belum Dimulai'),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }, 
                                (r) async {
                                  // bool kioskModeStarted = startKioskMode() as bool;
                                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: []);
                                  startKioskMode();
                                  context.push(
                                    QuizStartPage(
                                      matkulId: widget.matkulId,
                                      userId: widget.userId,
                                    ),
                                  );
                                }
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
                                      // await startKioskMode();
                                      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
      ),
    );
  }
}
