import 'package:cbt_app/common/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../bloc/hasil-ujian/hasil_ujian_bloc.dart';
import 'result_value.dart';

class QuizResultLast extends StatelessWidget {
  const QuizResultLast({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HasilUjianBloc, HasilUjianState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const Text('Nilai Tidak Ada');
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loaded: (data) {
            final correct = data.data.jumlahBenar;
            final wrong = data.data.jumlahSalah;
            final totalQuestion = correct + wrong;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hasil Ujian ${data.data.matkul.nama}',
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: [
                      BoxShadow(
                        color: ColorName.black.withOpacity(0.14),
                        blurRadius: 17,
                        offset: const Offset(0, 8),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Semua Tes',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 18.0),
                            ResultValue.correct(correct),
                            const SizedBox(height: 18.0),
                            ResultValue.wrong(wrong),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            const Text(
                              'Score',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              )  
                            ),
                            CircularStepProgressIndicator(
                              totalSteps: totalQuestion,
                              currentStep: correct,
                              stepSize: 10,
                              selectedColor: ColorName.green,
                              unselectedColor: ColorName.primary,
                              padding: 0,
                              width: 140,
                              height: 140,
                              selectedStepSize: 24,
                              unselectedStepSize: 24,
                              roundedCap: (_, __) => true,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(
                                    '${(correct / totalQuestion * 100).toInt()}',
                                    style: const TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: ColorName.primary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        );
        
      },
    );
  }
}
