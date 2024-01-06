import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/common/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

import '../../../../common/components/custom_scaffold.dart';
import '../../../../common/widgets/buttons.dart';
import '../widget/quiz_result_last.dart';

class QuizResultPage extends StatelessWidget {
  final String matkulId;
  const QuizResultPage( this.matkulId, {super.key});

  @override
  Widget build(BuildContext context) {
    const paddingHorizontalSize = 16.0;
    const paddingHorizontal =
        EdgeInsets.symmetric(horizontal: paddingHorizontalSize);

    return CustomScaffold(
      appBarTitle: const Text('Hasil Tes'),
      body: ListView(
        children: const [
          SizedBox(height: 30.0),
          Padding(
            padding: paddingHorizontal,
            child: QuizResultLast(),
          ),
          SizedBox(height: 40.0),
        ],
      ),
      bottomNavigationBar: Container(
        color: ColorName.white,
        padding: const EdgeInsets.all(16.0),
        child: Button.filled(
          onPressed: () async {
            // await stopKioskMode();
            context.popToRoot();
          },
          label: 'Kembali ke Beranda',
        ),
      ),
    );
  }
}
