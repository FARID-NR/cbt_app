import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final int duration;
  final void Function(int timeRemaining) onTimerCompletion;

  const CountdownTimer({
    Key? key,
    required this.duration,
    required this.onTimerCompletion,
  }) : super(key: key);

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int _remainingHours;
  late int _remainingMinutes;
  late int _remainingSeconds;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _remainingHours = widget.duration ~/ 3600; // Menghitung jam
    _remainingMinutes = (widget.duration % 3600) ~/ 60; // Menghitung menit
    _remainingSeconds = widget.duration % 60; // Menghitung detik
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTimer(Timer timer) {
    if (_remainingHours == 0 && _remainingMinutes == 0 && _remainingSeconds == 0) {
      _timer.cancel();
      widget.onTimerCompletion(0);
    } else {
      setState(() {
        if (_remainingSeconds == 0) {
          if (_remainingMinutes == 0) {
            _remainingHours--;
            _remainingMinutes = 59;
          } else {
            _remainingMinutes--;
          }
          _remainingSeconds = 59;
        } else {
          _remainingSeconds--;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_remainingHours : $_remainingMinutes : $_remainingSeconds',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
