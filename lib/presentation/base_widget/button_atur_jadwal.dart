import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/constants/colors.dart';

class ButtonAturTimer extends StatefulWidget {
  const ButtonAturTimer({super.key});

  @override
  State<ButtonAturTimer> createState() => _ButtonAturTimerState();
}

class _ButtonAturTimerState extends State<ButtonAturTimer> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final tanggal = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (tanggal != null) {
      setState(() {
        selectedDate = tanggal;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ElevatedButton(
            child: const Text('Pilih Tanggal'),
            onPressed: () => _selectDate(context),
          ),
          const SizedBox(height: 20),
          Text(
            'Tanggal Terpilih: ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _selectTime(context),
            child: const Text('Pilih Waktu'),
          ),
          const SizedBox(height: 20),
          Text(
            'Waktu Terpilih: ${selectedTime.format(context)}',
            style: const TextStyle(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {
                    // Aksi yang dijalankan saat tombol ditekan
                    Navigator.pop(context);
                  },
                  style:
                      TextButton.styleFrom(backgroundColor: ColorName.primary),
                  child: const Text(
                    'Simpan',
                    style: TextStyle(
                      color: Colors.white, // Warna teks tombol
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
