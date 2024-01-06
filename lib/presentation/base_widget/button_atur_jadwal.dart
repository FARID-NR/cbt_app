import 'package:cbt_app/data/models/request/timer_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/timer/timer_bloc.dart';
import '../../common/constants/colors.dart';

class ButtonAturTimer extends StatefulWidget {
  final int soalId;
  final String date;
  final String time;
  const ButtonAturTimer(
      {super.key,
      required this.soalId,
      required this.date,
      required this.time});

  @override
  State<ButtonAturTimer> createState() => _ButtonAturTimerState();
}

class _ButtonAturTimerState extends State<ButtonAturTimer> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

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
      initialTime: selectedTime!,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      // Validasi format waktu yang dipilih
      final formattedTime =
          '${pickedTime.hour}:${pickedTime.minute.toString().padLeft(2, '0')}';
      print('Waktu yang dipilih: $formattedTime');

      // Validasi format waktu
      final regex = RegExp(r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$'); // Format HH:mm
      if (!regex.hasMatch(formattedTime)) {
        // Jika format waktu tidak sesuai, tampilkan pesan kesalahan atau lakukan penanganan yang sesuai
        print('Format waktu tidak sesuai dengan HH:mm');
        // Tambahkan pesan kesalahan atau lakukan penanganan lainnya di sini
      } else {
        // Jika format waktu sesuai, atur nilai selectedTime
        setState(() {
          selectedTime = pickedTime;
          
        });
      }
    }
  }

  @override
  void initState() {
    widget.soalId;
    print('Widget date: ${widget.date}');
    // Inisialisasi selectedDate dengan widget.date dan selectedTime dengan widget.time
    selectedDate = DateTime.tryParse(widget.date) ?? DateTime(0);
    selectedTime = widget.time.isNotEmpty
        ? TimeOfDay(
            hour: int.tryParse(widget.time.split(':')[0]) ?? 0,
            minute: int.tryParse(widget.time.split(':')[1]) ?? 0,
          )
        : TimeOfDay(hour: 0, minute: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        "${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}";
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
          Row(
            children: [
              ElevatedButton(
                child: const Text('Pilih Tanggal'),
                onPressed: () => _selectDate(context),
              ),
              // const SizedBox(width: 20), // Spasi antara tombol dan waktu terpilih
              // Text(
              //   'Tanggal Terpilih: ${widget.date != null ? widget.date : '00/00/0000'}',
              //   style: const TextStyle(fontSize: 18),
              // ),
            ],
          ),
          const SizedBox(height: 20),
          BlocBuilder<TimerBloc, TimerState>(
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return Text(
                  'Tanggal Terpilih: Date belum ditentukan',
                  style: const TextStyle(fontSize: 18),
                );
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, loaded: (data) {
                return Text(
                  'Tanggal Terpilih: ${data.data.finishDate != null ? data.data.finishDate : 'Date belum ditentukan'}',
                  style: const TextStyle(fontSize: 18),
                );
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _selectTime(context),
            child: const Text('Pilih Waktu'),
          ),
          const SizedBox(height: 20),
          BlocBuilder<TimerBloc, TimerState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return Text(
                    'Waktu Terpilih: Time belum ditentukan',
                    style: const TextStyle(fontSize: 18),
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (data) {
                  return Text(
                    'Waktu Terpilih: ${data.data.finishTime != null ? data.data.finishTime : 'Time belum ditentukan'}',
                    style: const TextStyle(fontSize: 18),
                  );
                }
              );
              
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Align(
              alignment: Alignment.bottomRight,
              child: BlocListener<TimerBloc, TimerState>(
                listener: (context, state) {
                  state.maybeWhen(
                      orElse: () {},
                      loaded: (data) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Jadwal Berhasil'),
                        ));
                        Navigator.pop(context);
                      },
                      error: (message) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Jadwal Gagal Disimpan'),
                        ));
                        Navigator.pop(context);
                      });
                },
                child: BlocBuilder<TimerBloc, TimerState>(
                  builder: (context, state) {
                    return state.maybeWhen(orElse: () {
                      return Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                // Aksi yang dijalankan saat tombol ditekan
                                if (selectedDate == null ||
                                    selectedTime == null) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Semua Wajib di isi'),
                                  ));
                                } else {
                                  final requestModel = TimerRequestModel(
                                    finishDate: DateFormat('yyyy-MM-dd')
                                        .format(selectedDate!),
                                    finishTime: formattedTime,
                                  );
                                  context.read<TimerBloc>().add(
                                      TimerEvent.timer(
                                          requestModel, widget.soalId));
                                }
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: ColorName.primary),
                              child: const Text(
                                'Simpan',
                                style: TextStyle(
                                  color: Colors.white, // Warna teks tombol
                                ),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: () {
                              // Aksi yang dijalankan saat tombol 'Selesai Ujian' ditekan
                              context
                                  .read<TimerBloc>()
                                  .add(TimerEvent.delete(widget.soalId));
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: ColorName.primary,
                            ),
                            child: const Text(
                              'Akhiri Ujian',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
