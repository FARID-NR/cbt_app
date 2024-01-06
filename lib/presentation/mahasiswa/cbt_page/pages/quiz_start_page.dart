import 'dart:math';

import 'package:cbt_app/bloc/daftar_soal/dafttar_soal_bloc.dart';
import 'package:cbt_app/bloc/ujian/ujian_bloc.dart';
import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/common/extensions/build_context_ext.dart';
import 'package:cbt_app/presentation/mahasiswa/cbt_page/pages/quiz_finish_page.dart';
import 'package:cbt_app/presentation/mahasiswa/cbt_page/widget/countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_mode/kiosk_mode.dart';

import '../../../../common/components/custom_scaffold.dart';
import '../../../../common/constants/assets.gen.dart';
import '../widget/quiz_multiple_choice.dart';
// import 'quiz_finish_page.dart';

class QuizStartPage extends StatefulWidget {
  final String matkulId;
  final String userId;
  const QuizStartPage({
    super.key,
    required this.matkulId, required this.userId,
  });

  @override
  State<QuizStartPage> createState() => _QuizStartPageState();
}

class _QuizStartPageState extends State<QuizStartPage> {
  @override
  void initState() {
  //  await stopKioskMode();
    context
        .read<UjianBloc>()
        .add(UjianEvent.getUjian(matkulId: widget.matkulId));
    super.initState();
  }

  int quizNumber = 1;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: BlocBuilder<UjianBloc, UjianState>(
        builder: (context, state) {
          return state.maybeWhen(
              orElse: () => const Text(''),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (data) {
                return Text('Ujian ${data.data.matkul.nama}');
              });
        },
      ),
      actions: [
        Assets.icons.clock.image(width: 24.0),
        const SizedBox(width: 8.0),
        BlocListener<UjianBloc, UjianState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: (){},
              loaded: (data) {
                context.read<DaftarSoalBloc>().add(DaftarSoalEvent.daftaSoal(data.data.soal));
              }
            );
          },
          child: BlocBuilder<UjianBloc, UjianState>(
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: () => const Text(''),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (data) {
                    final date = data.data.matkul.finishDate;
                    final time = data.data.matkul.finishTime;
                    DateTime finishDateTime = DateTime.parse('$date $time');
                    DateTime currentDateTime = DateTime.now();
                    Duration difference = finishDateTime.difference(currentDateTime);

                    int days = difference.inDays;
                    int hours = difference.inHours - (days * 24);
                    int minutes = difference.inMinutes - (difference.inHours * 60);
                    int seconds = difference.inSeconds - (difference.inMinutes * 60);

                    String countdownText = (days > 0 ? '$days hari ' : '') +
                        '$hours jam ' +
                        '$minutes menit ' +
                        '$seconds detik';

                    int convertTextToSeconds(String countdownText) {
                      List<String> parts = countdownText.split(' '); // Membagi teks berdasarkan spasi
                      int hours = 0;
                      int minutes = 0;
                      int seconds = 0;

                      for (int i = 0; i < parts.length; i += 2) {
                        if (parts[i + 1] == 'jam') {
                          hours = int.parse(parts[i]);
                        } else if (parts[i + 1] == 'menit') {
                          minutes = int.parse(parts[i]);
                        } else if (parts[i + 1] == 'detik') {
                          seconds = int.parse(parts[i]);
                        }
                      }

                      return (hours * 3600) + (minutes * 60) + seconds; // Mengembalikan total detik
                    }

                    return CountdownTimer(
                      duration: convertTextToSeconds(countdownText),
                      onTimerCompletion: (timeRemaining) {
                        context.pushReplacement(QuizFinishPage(
                          matkulId: widget.matkulId,
                          timeRemaining: timeRemaining,
                        ));
                      },
                    );
                  });
            },
          ),
        ),
        IconButton(
            onPressed: () {
              context.pushReplacement(QuizFinishPage(
                matkulId: widget.matkulId,
                timeRemaining: 0,
              ));
            },
            icon: const Icon(
              Icons.done,
              color: Colors.white,
            )),
        const SizedBox(width: 24.0),
      ],
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          const Text(
            'Pertanyaan',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          BlocBuilder<DaftarSoalBloc, DaftarSoalState>(
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: () => const Text('data loading'),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (data, index, isNext, isBack) {
                    return Row(
                      children: [
                        Flexible(
                          child: LinearProgressIndicator(
                            value: (index + 1) / data.length,
                            color: ColorName.primary,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Text(
                          '${index + 1}/${data.length}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    );
                  });
            },
          ),
          const SizedBox(height: 16.0),
          QuizMultipleChoice(
            matkulId: widget.matkulId,
            userId: widget.userId
          ),
        ],
      ),
    );
  }
}
