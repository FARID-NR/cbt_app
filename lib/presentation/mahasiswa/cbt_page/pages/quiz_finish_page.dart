
import 'package:cbt_app/bloc/hasil-ujian/hasil_ujian_bloc.dart';
import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/common/extensions/build_context_ext.dart';
import 'package:cbt_app/presentation/mahasiswa/mahasiswa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/components/custom_scaffold.dart';
import '../../../../common/constants/assets.gen.dart';
import '../../../../common/widgets/buttons.dart';
import '../widget/countdown_timer.dart';
import 'quiz_result_page.dart';

class QuizFinishPage extends StatefulWidget {
  final int timeRemaining;
  final String matkulId;

  const QuizFinishPage({
    super.key,
    required this.timeRemaining, required this.matkulId,
  });

  @override
  State<QuizFinishPage> createState() => _QuizFinishPageState();
}

class _QuizFinishPageState extends State<QuizFinishPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: const Text('Ujian'),
      actions: [
        Assets.icons.clock.image(width: 24.0),
        const SizedBox(width: 8.0),
        CountdownTimer(
          duration: widget.timeRemaining,
          onTimerCompletion: (timeRemaining) {},
        ),
        const SizedBox(width: 24.0),
      ],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Assets.images.finish.image(),
              const Text(
                'Yeayy Finish',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 42.0),
              Button.filled(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) {
                    return const MahasiswaPage();
                    }),
                    (_) => false, // (_) menunjukkan bahwa parameter tidak digunakan
                  );
                },
                label: 'Kembali ke Beranda',
                color: ColorName.white,
                textColor: ColorName.primary,
              ),
              const SizedBox(height: 28.0),
              Button.filled(
                onPressed: () {
                  context.push(QuizResultPage(widget.matkulId));
                  context.read<HasilUjianBloc>().add(HasilUjianEvent.hasil(widget.matkulId));
                },
                label: 'Lihat Hasil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
