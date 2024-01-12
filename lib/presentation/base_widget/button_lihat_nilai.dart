import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/lihat_nilai/lihat_nilai_bloc.dart';
import '../../common/constants/colors.dart';

class ButtonViewScore extends StatefulWidget {
  final int idMatkul;
  final int idMhs;
  const ButtonViewScore({super.key, required this.idMatkul, required this.idMhs});

  @override
  State<ButtonViewScore> createState() => _ButtonViewScoreState();
}

class _ButtonViewScoreState extends State<ButtonViewScore> {

  late int idMhs;
  late int idMatkul;

  @override
  void initState() {
    // Set selectedUserId from the widget's selectedUserId
    idMatkul = widget.idMatkul;
    idMhs = widget.idMhs;

    context.read<LihatNilaiBloc>().add(LihatNilaiEvent.lihat(idMhs: idMhs, idMatkul: idMatkul));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LihatNilaiBloc, LihatNilaiState>(
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return Container(child: const Text('data tidak ada'),);
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(color: ColorName.black,),
            );
          }, loaded: (data) {
              return Container(
                height: 600,
                decoration: const BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 60, bottom: 20.0),
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
                          'Lihat Nilai',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ColorName.primary),
                        ),
                        const SizedBox(height: 10),
                        const Text('Nilai Akhir'),
                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            '${data.data.nilaiAsli ?? '0'}',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('Nilai Remedial'),
                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            '${data.data.nilaiRemidial ?? '0'}',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('Jumlah Benar (Pengerjaan Terakhir)'),
                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            '${data.data.jumlahBenar ?? '0'}',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('Jumlah Salah (Pengerjaan Terakhir)'),
                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            '${data.data.jumlahSalah ?? '0'}',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
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
                                'Close',
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
          });
        },
      ),
    );
  }
}
