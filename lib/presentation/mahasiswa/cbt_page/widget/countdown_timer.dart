import 'package:cbt_app/common/constants/colors.dart';
import 'package:flutter/material.dart';

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({Key? key, this.color, required this.time})
      : super(key: key);

  final Color? color;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: ColorName.primary,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(time, style: TextStyle(fontSize: 16, color: ColorName.primary))
      ],
    );
  }
}
