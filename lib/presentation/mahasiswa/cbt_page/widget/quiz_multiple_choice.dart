import 'package:cbt_app/bloc/daftar_soal/dafttar_soal_bloc.dart';
import 'package:cbt_app/bloc/submit_answer/submit_answer_bloc.dart';
import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/presentation/mahasiswa/cbt_page/pages/quiz_finish_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_mode/kiosk_mode.dart';

import '../../../../common/widgets/buttons.dart';
import '../../../../data/models/request/submit_request_model.dart';
import 'answer_choices.dart';

class QuizMultipleChoice extends StatefulWidget {
  final String userId;
  final String matkulId;
  const QuizMultipleChoice(
      {super.key, required this.matkulId, required this.userId});

  @override
  State<QuizMultipleChoice> createState() => _QuizMultipleChoiceState();
}

class _QuizMultipleChoiceState extends State<QuizMultipleChoice> {
  String cleanText(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>'), '');
  }

  Map<int, String> selectedAnswer = {};
  Map<String, dynamic> selectedAnswerIds = {};
  String answer = '';
  List<String> allSelectedAnswers = [];

  @override
  Widget build(BuildContext context) {
    // final ValueNotifier<String> selectedAnswer = ValueNotifier("");
    return BlocBuilder<DaftarSoalBloc, DaftarSoalState>(
      builder: (context, state) {
        return state.maybeWhen(orElse: () {
          return const Text('Soal belum tersedia');
        }, loaded: (data, index, isNext, isBack) {
          final soalId = data[index].id;
          final soalIds = data[index].id;
          final image = data[index].gambarSoal;
          // final imageN = '';
          final imageA = data[index].jawaban[0].gambarJawaban;
          final imageB = data[index].jawaban[1].gambarJawaban;
          final imageC = data[index].jawaban[2].gambarJawaban;
          final imageD = data[index].jawaban[3].gambarJawaban;
          final imageE = data[index].jawaban[4].gambarJawaban;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
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
                child: Column(
                  children: [
                    Text(
                      cleanText(data[index].soal),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    image != null && image.isNotEmpty
                      ? Image.network(
                          image,
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        )
                      : Container(),           
                  ],
                ),
              ),
              const SizedBox(height: 34.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnswerChoices(
                    label: data[index].jawaban[0].jawaban,
                    image: imageA != null ? imageA : '',
                    isSelected:
                        selectedAnswer[index] == data[index].jawaban[0].jawaban,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswer[index] = value;
                        // answer =String.fromCharCode('A'.codeUnitAt(0) + ind);
                        answer = data[index].jawaban[0].jawaban;
                        selectedAnswerIds['soal$soalIds'] = data[index].jawaban[0].id.toString(); 
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  AnswerChoices(
                    label: data[index].jawaban[1].jawaban,
                    image: imageB != null ? imageB : '',
                    isSelected:
                        selectedAnswer[index] == data[index].jawaban[1].jawaban,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswer[index] = value;
                        // answer =String.fromCharCode('A'.codeUnitAt(0) + ind);
                        answer = data[index].jawaban[1].jawaban;
                        selectedAnswerIds['soal$soalIds'] = data[index].jawaban[1].id.toString(); 
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  AnswerChoices(
                    label: data[index].jawaban[2].jawaban,
                    image: imageC != null ? imageC : '',
                    isSelected:
                        selectedAnswer[index] == data[index].jawaban[2].jawaban,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswer[index] = value;
                        // answer =String.fromCharCode('A'.codeUnitAt(0) + ind);
                        answer = data[index].jawaban[2].jawaban;
                        selectedAnswerIds['soal$soalIds'] = data[index].jawaban[2].id.toString(); 
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  AnswerChoices(
                    label: data[index].jawaban[3].jawaban,
                    image: imageD != null ? imageD : '',
                    isSelected:
                        selectedAnswer[index] == data[index].jawaban[3].jawaban,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswer[index] = value;
                        // answer =String.fromCharCode('A'.codeUnitAt(0) + ind);
                        answer = data[index].jawaban[3].jawaban;
                        selectedAnswerIds['soal$soalIds'] = data[index].jawaban[3].id.toString(); 
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  AnswerChoices(
                    label: data[index].jawaban[4].jawaban,
                    image: imageE != null ? imageE : '',
                    isSelected:
                        selectedAnswer[index] == data[index].jawaban[4].jawaban,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswer[index] = value;
                        // answer =String.fromCharCode('A'.codeUnitAt(0) + ind);
                        answer = data[index].jawaban[4].jawaban;
                        selectedAnswerIds['soal$soalIds'] = data[index].jawaban[4].id.toString(); 
                        print(selectedAnswerIds.toString());
                      });
                    },
                  ),
                ],
              ),
              // })
              const SizedBox(height: 38.0),
              Column(
                children: [
                  isNext
                      ? Button.filled(
                          onPressed: selectedAnswer[index] != null
                           ? () {
                              context
                                  .read<DaftarSoalBloc>()
                                  .add(const DaftarSoalEvent.nextSoal());
                              if (selectedAnswerIds.containsKey('soal${data[index].id}')) {
                                  debugPrint('Answer for soal${data[index].id} already selected');
                                } else {
                                  // selectedAnswerIds['soal${data[index].id.toString()}'] = answer;
                                  debugPrint('Selected answer for soal${data[index].id}: $answer');
                              }
                              debugPrint(allSelectedAnswers.toString());
                            }
                          : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Pilih jawaban sebelum melanjutkan.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            },
                          label: 'Selanjutnya',
                        )
                      : BlocListener<SubmitAnswerBloc, SubmitAnswerState>(
                          listener: (context, state) {
                            state.maybeWhen(
                              orElse: () {},
                              loaded: (data) {
                                // final matkulId = data.data.
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return QuizFinishPage(timeRemaining: 0, matkulId: widget.matkulId);
                                  }),
                                  (_) => false, // (_) menunjukkan bahwa parameter tidak digunakan
                                ); 
                              },
                              error: (message) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Mahasiswa'),
                                      content:
                                          const Text('Soal Belum Terjawab'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Close'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                          },
                          child:
                              BlocBuilder<SubmitAnswerBloc, SubmitAnswerState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                  orElse: () {
                                    return Button.filled(
                                      onPressed: () async {
                                        // submitAnswer();
                                        // await stopKioskMode();
                                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
                                        stopKioskMode();

                                        final Map<String, String> formattedAnswers = Map.fromEntries(
                                          selectedAnswerIds.entries.map(
                                            (entry) => MapEntry(entry.key.toString().replaceAll('soal', ''), entry.value as String),
                                          ),
                                        );
                                        final requestModel = SubmitRequestModel(
                                            userId: widget.userId,
                                            soal: selectedAnswerIds.toString()
                                            // soal: allSelectedAnswers.toString()
                                            // soal: data[index].jawaban[index].id.toString()
                                          );
                                          debugPrint(allSelectedAnswers.toString());
                                        context
                                            .read<SubmitAnswerBloc>()
                                            .add(SubmitAnswerEvent.submit(
                                              requestModel,
                                              widget.matkulId, 
                                              soalId.toString(),
                                              widget.userId,
                                              selectedAnswerIds

                                            ));
                                      },
                                      label: 'Selesai',
                                    );
                                  },
                                  loading: () => const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                              );
                            },
                          ),
                        ),

                  isBack
                   ? Padding(
                     padding: const EdgeInsets.symmetric(vertical: 15),
                     child: Button.filled(
                        onPressed: () {
                          context.read<DaftarSoalBloc>().add(const DaftarSoalEvent.backSoal());
                        },
                        label: 'Kembali'
                      ),
                   )
                   : const SizedBox.shrink(),
                ],
              )
            ],
          );
        });
      },
    );
  }
}
