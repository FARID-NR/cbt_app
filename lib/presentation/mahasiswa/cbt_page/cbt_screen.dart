import 'package:cbt_app/common/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/themes.dart';
import '../../../common/widgets/main_button.dart';
import 'widget/content_area.dart';
import 'widget/countdown_timer.dart';
import 'widget/custom_appbar.dart';
import 'widget/screen_background.dart';

class CbtScreen extends StatefulWidget {
  const CbtScreen({Key? key}) : super(key: key);

  @override
  State<CbtScreen> createState() => _CbtScreenState();
}

class _CbtScreenState extends State<CbtScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(
            leading: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: CountdownTimer(
                  time: '12 : 00',
                  // time: controller.time.value,
                  // color: kOnSurfaceTextColor,
                ),
              decoration: const ShapeDecoration(
                shape: StadiumBorder(
                    side: BorderSide(color: kOnSurfaceTextColor, width: 2)),
              ),
            ),
            showActionIcon: true,
            titleWidget: Text(
                    ''
                  // 'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}',
                  // style: kAppBarTS,
                ),
          ),
          body: BackgroundDecoration(
            child: Column(
                children: [
                  // if (controller.loadingStatus.value == LoadingStatus.loading)
                  //   const Expanded(
                  //       child: ContentArea(child: QuizScreenPlaceHolder())),
                  // if (controller.loadingStatus.value == LoadingStatus.completed)
                    Expanded(
                      child: ContentArea(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Text(
                                'Apkahasd oliasod',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: ColorName.white
                                ),
                                // controller.currentQuestion.value!.question,
                                // style: kQuizeTS,
                              ),
                              // GetBuilder<QuizController>(
                              //     id: 'answers_list',
                              //     builder: (context) {
                              //       return ListView.separated(
                              //         itemCount: controller.currentQuestion
                              //             .value!.answers.length,
                              //         shrinkWrap: true,
                              //         padding: const EdgeInsets.only(top: 25),
                              //         physics:
                              //             const NeverScrollableScrollPhysics(),
                              //         separatorBuilder:
                              //             (BuildContext context, int index) {
                              //           return const SizedBox(
                              //             height: 10,
                              //           );
                              //         },
                              //         itemBuilder:
                              //             (BuildContext context, int index) {
                              //           final answer = controller
                              //               .currentQuestion
                              //               .value!
                              //               .answers[index];
                              //           return AnswerCard(
                              //             isSelected: answer.identifier ==
                              //                 controller.currentQuestion.value!
                              //                     .selectedAnswer,
                              //             onTap: () {
                              //               controller.selectAnswer(
                              //                   answer.identifier);
                              //             },
                              //             answer:
                              //                 '${answer.identifier}. ${answer.answer}',
                              //           );
                              //         },
                              //       );
                              //     }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: UIParameters.screenPadding,
                      child: Row(
                        children: [
                          Visibility(
                            // visible: controller.isFirstQuestion,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: SizedBox(
                                height: 55,
                                width: 55,
                                child: MainButton(
                                  onTap: () {
                                    // controller.prevQuestion();
                                  },
                                  child: const Icon(Icons.arrow_back_ios_new, color: ColorName.white,),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Visibility(
                                child: MainButton(
                                  onTap: () {
                                    
                                  },
                                  title: 'Next',
                                ),
                              ),
                          
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
          )),
    );
  }
}
