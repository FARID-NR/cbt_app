import 'dart:io';

import 'package:cbt_app/common/utils/dimensions.dart';
import 'package:cbt_app/common/utils/images.dart';
import 'package:cbt_app/common/widgets/animated_floating_button.dart';
import 'package:cbt_app/common/widgets/upload_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../bloc/get-soal/getsoal_bloc.dart';
import '../../../common/constants/colors.dart';

class CourseScheduleTile extends StatefulWidget {
  final int selectedUserId;
  // final CourseScheduleModel data;
  const CourseScheduleTile({super.key, required this.selectedUserId});

  @override
  State<CourseScheduleTile> createState() => _CourseScheduleTileState();
}

class _CourseScheduleTileState extends State<CourseScheduleTile> {
  ScrollController scrollController = ScrollController();
  String _selectedDifficulty = 'Mudah'; // Nilai default
  String fileName = "Upload Gambar";
  String message = "";
  bool activated = false;
  bool endScroll = false;
  String? selectedOption;
  late int selectedUserId;

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

  String cleanText(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>'), '');
  }


  @override
  void initState() {
    // Set selectedUserId from the widget's selectedUserId
    selectedUserId = widget.selectedUserId;

    context.read<GetsoalBloc>().add(GetsoalEvent.getSoal(userId: selectedUserId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Untuk kembali ke halaman sebelumnya
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: BlocBuilder<GetsoalBloc, GetsoalState>(
                    builder: (context, state) {
                      return state.maybeWhen(orElse: () {
                        return const Center(child: Text('Data Soal belum ada'));
                      }, loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }, loaded: (data) {
                        // GetsoalLocalDatasource().getIdEndpoint();
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${data.data.nama}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: ColorName.primary),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Container(
                                                  height: 500,
                                                  width: double.infinity,
                                                  padding:
                                                      const EdgeInsets.all(18),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: ColorName.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(30),
                                                      topRight:
                                                          Radius.circular(30),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      ElevatedButton(
                                                        child: const Text(
                                                            'Pilih Tanggal'),
                                                        onPressed: () =>
                                                            _selectDate(
                                                                context),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        'Tanggal Terpilih: ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
                                                        style: const TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      ElevatedButton(
                                                        onPressed: () =>
                                                            _selectTime(
                                                                context),
                                                        child: const Text(
                                                            'Pilih Waktu'),
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Text(
                                                        'Waktu Terpilih: ${selectedTime.format(context)}',
                                                        style: const TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 5),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .bottomRight,
                                                          child: TextButton(
                                                              onPressed: () {
                                                                // Aksi yang dijalankan saat tombol ditekan
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              style: TextButton.styleFrom(
                                                                  backgroundColor:
                                                                      ColorName
                                                                          .primary),
                                                              child: const Text(
                                                                'Simpan',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white, // Warna teks tombol
                                                                ),
                                                              )),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          });
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors
                                          .blue, // Warna latar belakang tombol
                                    ),
                                    child: const Text(
                                      'Atur Jadwal',
                                      style: TextStyle(
                                        color:
                                            Colors.white, // Warna teks tombol
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: data.data.soal.length,
                                itemBuilder: (context, index) {
                                  return IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 45.0,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16.0),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(left: 10),
                                                  child: Text('${index + 1}.'),
                                                ),
                                                const Text(
                                                  '',
                                                  style: TextStyle(
                                                    color: ColorName.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5.0),
                                        const VerticalDivider(),
                                        const SizedBox(width: 5.0),
                                        Container(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context).size.width * 0.8,
                                          ),
                                          height: MediaQuery.of(context).size.height * 0.3,
                                          // width: MediaQuery.of(context).size.width ,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16.0, horizontal: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cleanText(data.data.soal[index].soal),
                                                style: const TextStyle(
                                                  color: ColorName.primary,
                                                ),
                                                overflow: TextOverflow.clip,
                                              ),
                                              const SizedBox(height: 18.0),
                                              Text(
                                                'Kategori : ${data.data.soal[index].tingkat}',
                                                style: const TextStyle(
                                                  color: ColorName.grey,
                                                ),
                                              ),
                                              const SizedBox(height: 18.0),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Action :',
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextButton(
                                                        onPressed: () {
                                                          // Aksi yang dijalankan saat tombol ditekan
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                const Color
                                                                    .fromARGB(
                                                                    0,
                                                                    255,
                                                                    255,
                                                                    255),
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return StatefulBuilder(
                                                                builder: (BuildContext
                                                                        context,
                                                                    StateSetter
                                                                        setState) {
                                                                  return Container(
                                                                    height: 838,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      color: ColorName
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(30),
                                                                        topRight:
                                                                            Radius.circular(30),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets.only(
                                                                          left:
                                                                              20,
                                                                          right:
                                                                              20,
                                                                          top:
                                                                              60,
                                                                          bottom:
                                                                              20.0),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Align(
                                                                              alignment: Alignment.topRight,
                                                                              child: IconButton(
                                                                                icon: const Icon(
                                                                                  Icons.keyboard_arrow_down_outlined,
                                                                                  color: ColorName.primary,
                                                                                ),
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                              ),
                                                                            ),
                                                                            const SizedBox(height: 20),
                                                                            const Text(
                                                                              'Edit Soal',
                                                                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorName.primary),
                                                                            ),
                                                                            const SizedBox(height: 10),
                                                                            TextFormField(
                                                                              decoration: const InputDecoration(
                                                                                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                                                                                labelText: 'Opsi A',
                                                                                border: OutlineInputBorder(),
                                                                              ),
                                                                              // ...
                                                                            ),
                                                                            const SizedBox(height: 10),
                                                                            Row(
                                                                              children: [
                                                                                // UploadFile(
                                                                                //   // fileName: ,
                                                                                //   onFileSelected: (File file) {
                                                                                //     // Periksa jenis file sebelum mengambil tindakan
                                                                                //     final isImage = [
                                                                                //       '.jpeg',
                                                                                //       '.png',
                                                                                //       '.gif',
                                                                                //       '.jpg'
                                                                                //     ].any((extension) => file.path.toLowerCase().endsWith(extension));
                                          
                                                                                //     if (isImage) {
                                                                                //       // Lakukan sesuatu dengan file gambar yang dipilih di sini
                                                                                //       if (kDebugMode) {
                                                                                //         print('Selected file: ${file.path}');
                                                                                //       }
                                                                                //       // Perbarui nama file di sini
                                                                                //       setState(() {
                                                                                //         fileName = file.path.split('/').last;
                                                                                //       });
                                                                                //     } else {
                                                                                //       // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                                                                                //       if (kDebugMode) {
                                                                                //         print('File yang dipilih harus file gambar');
                                                                                //       }
                                                                                //       // Misalnya, tampilkan pesan kesalahan
                                                                                //       showDialog(
                                                                                //         context: context,
                                                                                //         builder: (BuildContext context) {
                                                                                //           return AlertDialog(
                                                                                //             title: const Text('File yang dipilih bukan file gambar'),
                                                                                //             actions: <Widget>[
                                                                                //               TextButton(
                                                                                //                 onPressed: () {
                                                                                //                   Navigator.of(context).pop();
                                                                                //                 },
                                                                                //                 child: const Text('OK'),
                                                                                //               ),
                                                                                //             ],
                                                                                //           );
                                                                                //         },
                                                                                //       );
                                                                                //     }
                                                                                //   },
                                                                                // ),
                                                                                
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    height: 48,
                                                                                    decoration: BoxDecoration(
                                                                                      border: Border.all(
                                                                                        width: 2,
                                                                                        color: const Color.fromARGB(255, 238, 238, 238), // Warna garis border
                                                                                      ),
                                                                                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8), topRight: Radius.circular(8)), // Membuat garis border melingkar
                                                                                    ),
                                                                                    padding: const EdgeInsets.all(8),
                                                                                    child: Center(
                                                                                      child: Text(
                                                                                        fileName,
                                                                                        style: const TextStyle(color: Colors.black),
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                            const SizedBox(height: 20),
                                                                            TextFormField(
                                                                              decoration: const InputDecoration(
                                                                                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                                                                                labelText: 'Opsi B',
                                                                                border: OutlineInputBorder(),
                                                                              ),
                                                                              // ...
                                                                            ),
                                                                            const SizedBox(height: 10),
                                                                            Row(
                                                                              children: [
                                                                                // UploadFile(
                                                                                //   // fileName: ,
                                                                                //   onFileSelected: (File file) {
                                                                                //     // Periksa jenis file sebelum mengambil tindakan
                                                                                //     final isImage = [
                                                                                //       '.jpeg',
                                                                                //       '.png',
                                                                                //       '.gif',
                                                                                //       '.jpg'
                                                                                //     ].any((extension) => file.path.toLowerCase().endsWith(extension));
                                          
                                                                                //     if (isImage) {
                                                                                //       // Lakukan sesuatu dengan file gambar yang dipilih di sini
                                                                                //       // print(
                                                                                //       //     'Selected file: ${file.path}');
                                                                                //       // Perbarui nama file di sini
                                                                                //       setState(() {
                                                                                //         fileName = file.path.split('/').last;
                                                                                //       });
                                                                                //     } else {
                                                                                //       // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                                                                                //       if (kDebugMode) {
                                                                                //         print('File yang dipilih harus file gambar');
                                                                                //       }
                                                                                //       // Misalnya, tampilkan pesan kesalahan
                                                                                //       showDialog(
                                                                                //         context: context,
                                                                                //         builder: (BuildContext context) {
                                                                                //           return AlertDialog(
                                                                                //             title: const Text('File yang dipilih bukan file gambar'),
                                                                                //             actions: <Widget>[
                                                                                //               TextButton(
                                                                                //                 onPressed: () {
                                                                                //                   Navigator.of(context).pop();
                                                                                //                 },
                                                                                //                 child: const Text('OK'),
                                                                                //               ),
                                                                                //             ],
                                                                                //           );
                                                                                //         },
                                                                                //       );
                                                                                //     }
                                                                                //   },
                                                                                // ),
                                                                                
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    height: 48,
                                                                                    decoration: BoxDecoration(
                                                                                      border: Border.all(
                                                                                        width: 2,
                                                                                        color: const Color.fromARGB(255, 238, 238, 238), // Warna garis border
                                                                                      ),
                                                                                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8), topRight: Radius.circular(8)), // Membuat garis border melingkar
                                                                                    ),
                                                                                    padding: const EdgeInsets.all(8),
                                                                                    child: Center(
                                                                                      child: Text(
                                                                                        fileName,
                                                                                        style: const TextStyle(color: Colors.black),
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                            const SizedBox(height: 20),
                                                                            TextFormField(
                                                                              decoration: const InputDecoration(
                                                                                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                                                                                labelText: 'Opsi C',
                                                                                border: OutlineInputBorder(),
                                                                              ),
                                                                              // ...
                                                                            ),
                                                                            const SizedBox(height: 10),
                                                                            Row(
                                                                              children: [
                                                                                // UploadFile(
                                                                                //   // fileName: ,
                                                                                //   onFileSelected: (File file) {
                                                                                //     // Periksa jenis file sebelum mengambil tindakan
                                                                                //     final isImage = [
                                                                                //       '.jpeg',
                                                                                //       '.png',
                                                                                //       '.gif',
                                                                                //       '.jpg'
                                                                                //     ].any((extension) => file.path.toLowerCase().endsWith(extension));
                                          
                                                                                //     if (isImage) {
                                                                                //       // Lakukan sesuatu dengan file gambar yang dipilih di sini
                                                                                //       if (kDebugMode) {
                                                                                //         print('Selected file: ${file.path}');
                                                                                //       }
                                                                                //       // Perbarui nama file di sini
                                                                                //       setState(() {
                                                                                //         fileName = file.path.split('/').last;
                                                                                //       });
                                                                                //     } else {
                                                                                //       // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                                                                                //       if (kDebugMode) {
                                                                                //         print('File yang dipilih harus file gambar');
                                                                                //       }
                                                                                //       // Misalnya, tampilkan pesan kesalahan
                                                                                //       showDialog(
                                                                                //         context: context,
                                                                                //         builder: (BuildContext context) {
                                                                                //           return AlertDialog(
                                                                                //             title: const Text('File yang dipilih bukan file gambar'),
                                                                                //             actions: <Widget>[
                                                                                //               TextButton(
                                                                                //                 onPressed: () {
                                                                                //                   Navigator.of(context).pop();
                                                                                //                 },
                                                                                //                 child: const Text('OK'),
                                                                                //               ),
                                                                                //             ],
                                                                                //           );
                                                                                //         },
                                                                                //       );
                                                                                //     }
                                                                                //   },
                                                                                // ),
                                                                                
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    height: 48,
                                                                                    decoration: BoxDecoration(
                                                                                      border: Border.all(
                                                                                        width: 2,
                                                                                        color: const Color.fromARGB(255, 238, 238, 238), // Warna garis border
                                                                                      ),
                                                                                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8), topRight: Radius.circular(8)), // Membuat garis border melingkar
                                                                                    ),
                                                                                    padding: const EdgeInsets.all(8),
                                                                                    child: Center(
                                                                                      child: Text(
                                                                                        fileName,
                                                                                        style: const TextStyle(color: Colors.black),
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                            const SizedBox(height: 20),
                                                                            TextFormField(
                                                                              decoration: const InputDecoration(
                                                                                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                                                                                labelText: 'Opsi D',
                                                                                border: OutlineInputBorder(),
                                                                              ),
                                                                              // ...
                                                                            ),
                                                                            const SizedBox(height: 10),
                                                                            Row(
                                                                              children: [
                                                                                // UploadFile(
                                                                                //   // fileName: ,
                                                                                //   onFileSelected: (File file) {
                                                                                //     // Periksa jenis file sebelum mengambil tindakan
                                                                                //     final isImage = [
                                                                                //       '.jpeg',
                                                                                //       '.png',
                                                                                //       '.gif',
                                                                                //       '.jpg'
                                                                                //     ].any((extension) => file.path.toLowerCase().endsWith(extension));
                                          
                                                                                //     if (isImage) {
                                                                                //       // Lakukan sesuatu dengan file gambar yang dipilih di sini
                                                                                //       if (kDebugMode) {
                                                                                //         print('Selected file: ${file.path}');
                                                                                //       }
                                                                                //       // Perbarui nama file di sini
                                                                                //       setState(() {
                                                                                //         fileName = file.path.split('/').last;
                                                                                //       });
                                                                                //     } else {
                                                                                //       // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                                                                                //       if (kDebugMode) {
                                                                                //         print('File yang dipilih harus file gambar');
                                                                                //       }
                                                                                //       // Misalnya, tampilkan pesan kesalahan
                                                                                //       showDialog(
                                                                                //         context: context,
                                                                                //         builder: (BuildContext context) {
                                                                                //           return AlertDialog(
                                                                                //             title: const Text('File yang dipilih bukan file gambar'),
                                                                                //             actions: <Widget>[
                                                                                //               TextButton(
                                                                                //                 onPressed: () {
                                                                                //                   Navigator.of(context).pop();
                                                                                //                 },
                                                                                //                 child: const Text('OK'),
                                                                                //               ),
                                                                                //             ],
                                                                                //           );
                                                                                //         },
                                                                                //       );
                                                                                //     }
                                                                                //   },
                                                                                // ),
                                                                                
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    height: 48,
                                                                                    decoration: BoxDecoration(
                                                                                      border: Border.all(
                                                                                        width: 2,
                                                                                        color: const Color.fromARGB(255, 238, 238, 238), // Warna garis border
                                                                                      ),
                                                                                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8), topRight: Radius.circular(8)), // Membuat garis border melingkar
                                                                                    ),
                                                                                    padding: const EdgeInsets.all(8),
                                                                                    child: Center(
                                                                                      child: Text(
                                                                                        fileName,
                                                                                        style: const TextStyle(color: Colors.black),
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                            const SizedBox(height: 20),
                                                                            TextFormField(
                                                                              decoration: const InputDecoration(
                                                                                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                                                                                labelText: 'Opsi E',
                                                                                border: OutlineInputBorder(),
                                                                              ),
                                                                              // ...
                                                                            ),
                                                                            const SizedBox(height: 10),
                                                                            Row(
                                                                              children: [
                                                                                // UploadFile(
                                                                                //   // fileName: ,
                                                                                //   onFileSelected: (File file) {
                                                                                //     // Periksa jenis file sebelum mengambil tindakan
                                                                                //     final isImage = [
                                                                                //       '.jpeg',
                                                                                //       '.png',
                                                                                //       '.gif',
                                                                                //       '.jpg'
                                                                                //     ].any((extension) => file.path.toLowerCase().endsWith(extension));
                                          
                                                                                //     if (isImage) {
                                                                                //       // Lakukan sesuatu dengan file gambar yang dipilih di sini
                                                                                //       if (kDebugMode) {
                                                                                //         print('Selected file: ${file.path}');
                                                                                //       }
                                                                                //       // Perbarui nama file di sini
                                                                                //       setState(() {
                                                                                //         fileName = file.path.split('/').last;
                                                                                //       });
                                                                                //     } else {
                                                                                //       // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                                                                                //       if (kDebugMode) {
                                                                                //         print('File yang dipilih harus file gambar');
                                                                                //       }
                                                                                //       // Misalnya, tampilkan pesan kesalahan
                                                                                //       showDialog(
                                                                                //         context: context,
                                                                                //         builder: (BuildContext context) {
                                                                                //           return AlertDialog(
                                                                                //             title: const Text('File yang dipilih bukan file gambar'),
                                                                                //             actions: <Widget>[
                                                                                //               TextButton(
                                                                                //                 onPressed: () {
                                                                                //                   Navigator.of(context).pop();
                                                                                //                 },
                                                                                //                 child: const Text('OK'),
                                                                                //               ),
                                                                                //             ],
                                                                                //           );
                                                                                //         },
                                                                                //       );
                                                                                //     }
                                                                                //   },
                                                                                // ),
                                                                                
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    height: 48,
                                                                                    decoration: BoxDecoration(
                                                                                      border: Border.all(
                                                                                        width: 2,
                                                                                        color: const Color.fromARGB(255, 238, 238, 238), // Warna garis border
                                                                                      ),
                                                                                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8), topRight: Radius.circular(8)), // Membuat garis border melingkar
                                                                                    ),
                                                                                    padding: const EdgeInsets.all(8),
                                                                                    child: Center(
                                                                                      child: Text(
                                                                                        fileName,
                                                                                        style: const TextStyle(color: Colors.black),
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                            const SizedBox(height: 20),
                                                                            Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                const Text(
                                                                                  'Jawaban Benar :',
                                                                                  style: TextStyle(color: ColorName.primary),
                                                                                ),
                                                                                Row(
                                                                                  children: [
                                                                                    Radio<String>(
                                                                                      value: 'A',
                                                                                      groupValue: selectedOption,
                                                                                      onChanged: (String? value) {
                                                                                        setState(() {
                                                                                          selectedOption = value;
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    const Text('A'),
                                                                                    Radio<String>(
                                                                                      value: 'B',
                                                                                      groupValue: selectedOption,
                                                                                      onChanged: (String? value) {
                                                                                        setState(() {
                                                                                          selectedOption = value;
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    const Text('B'),
                                                                                    Radio<String>(
                                                                                      value: 'C',
                                                                                      groupValue: selectedOption,
                                                                                      onChanged: (String? value) {
                                                                                        setState(() {
                                                                                          selectedOption = value;
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    const Text('C'),
                                                                                    Radio<String>(
                                                                                      value: 'D',
                                                                                      groupValue: selectedOption,
                                                                                      onChanged: (String? value) {
                                                                                        setState(() {
                                                                                          selectedOption = value;
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    const Text('D'),
                                                                                    Radio<String>(
                                                                                      value: 'E',
                                                                                      groupValue: selectedOption,
                                                                                      onChanged: (String? value) {
                                                                                        setState(() {
                                                                                          selectedOption = value;
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    const Text('E'),
                                                                                  ],
                                                                                ),
                                                                              ],
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
                                                                                  style: TextButton.styleFrom(backgroundColor: ColorName.primary),
                                                                                  child: const Text(
                                                                                    'Simpan',
                                                                                    style: TextStyle(
                                                                                      color: Colors.white, // Warna teks tombol
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          );
                                                        },
                                                        style: TextButton
                                                            .styleFrom(
                                                          backgroundColor: Colors
                                                              .green, // Warna latar belakang tombol
                                                        ),
                                                        child: const Text(
                                                          'Jawaban',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .white, // Warna teks tombol
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          // Aksi yang dijalankan saat tombol ditekan
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                const Color
                                                                    .fromARGB(
                                                                    0,
                                                                    255,
                                                                    255,
                                                                    255),
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return SingleChildScrollView(
                                                                physics:
                                                                    const ClampingScrollPhysics(),
                                                                child:
                                                                    StatefulBuilder(
                                                                  builder: (BuildContext
                                                                          context,
                                                                      StateSetter
                                                                          setState) {
                                                                    return Container(
                                                                      height:
                                                                          700,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        color: ColorName
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(30),
                                                                          topRight:
                                                                              Radius.circular(30),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            20.0),
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Align(
                                                                              alignment: Alignment.topRight,
                                                                              child: IconButton(
                                                                                icon: const Icon(
                                                                                  Icons.keyboard_arrow_down_outlined,
                                                                                  color: Colors.black,
                                                                                ),
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                              ),
                                                                            ),
                                                                            const SizedBox(height: 20),
                                                                            const Text(
                                                                              'Edit Soal',
                                                                              style: TextStyle(
                                                                                fontSize: 20,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            const SizedBox(height: 20),
                                                                            TextFormField(
                                                                              decoration: const InputDecoration(
                                                                                labelText: 'Masukkan Soal',
                                                                                border: OutlineInputBorder(),
                                                                              ),
                                                                              // ...
                                                                            ),
                                                                            const SizedBox(height: 20),
                                                                            Row(
                                                                              children: [
                                                                                // UploadFile(
                                                                                //   // fileName: ,
                                                                                //   onFileSelected: (File file) {
                                                                                //     // Periksa jenis file sebelum mengambil tindakan
                                                                                //     final isImage = [
                                                                                //       '.jpeg',
                                                                                //       '.png',
                                                                                //       '.gif',
                                                                                //       '.jpg'
                                                                                //     ].any((extension) => file.path.toLowerCase().endsWith(extension));
                                          
                                                                                //     if (isImage) {
                                                                                //       // Lakukan sesuatu dengan file gambar yang dipilih di sini
                                                                                //       if (kDebugMode) {
                                                                                //         print('Selected file: ${file.path}');
                                                                                //       }
                                                                                //       // Perbarui nama file di sini
                                                                                //       setState(() {
                                                                                //         fileName = file.path.split('/').last;
                                                                                //       });
                                                                                //     } else {
                                                                                //       // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                                                                                //       if (kDebugMode) {
                                                                                //         print('File yang dipilih harus file gambar');
                                                                                //       }
                                                                                //       // Misalnya, tampilkan pesan kesalahan
                                                                                //       showDialog(
                                                                                //         context: context,
                                                                                //         builder: (BuildContext context) {
                                                                                //           return AlertDialog(
                                                                                //             title: const Text('File yang dipilih bukan file gambar'),
                                                                                //             actions: <Widget>[
                                                                                //               TextButton(
                                                                                //                 onPressed: () {
                                                                                //                   Navigator.of(context).pop();
                                                                                //                 },
                                                                                //                 child: const Text('OK'),
                                                                                //               ),
                                                                                //             ],
                                                                                //           );
                                                                                //         },
                                                                                //       );
                                                                                //     }
                                                                                //   },
                                                                                // ),
                                                                                
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    height: 48,
                                                                                    decoration: BoxDecoration(
                                                                                      border: Border.all(
                                                                                        width: 2,
                                                                                        color: const Color.fromARGB(255, 238, 238, 238), // Warna garis border
                                                                                      ),
                                                                                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8), topRight: Radius.circular(8)), // Membuat garis border melingkar
                                                                                    ),
                                                                                    padding: const EdgeInsets.all(8),
                                                                                    child: Center(
                                                                                      child: Text(
                                                                                        fileName,
                                                                                        style: const TextStyle(color: Colors.black),
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                            const SizedBox(height: 20),
                                                                            DropdownButton<String>(
                                                                              isExpanded: true,
                                                                              value: _selectedDifficulty,
                                                                              onChanged: (String? newValue) {
                                                                                setState(() {
                                                                                  _selectedDifficulty = newValue!;
                                                                                });
                                                                              },
                                                                              items: <String>[
                                                                                'Sulit',
                                                                                'Menengah',
                                                                                'Mudah'
                                                                              ].map<DropdownMenuItem<String>>((String value) {
                                                                                return DropdownMenuItem<String>(
                                                                                  value: value,
                                                                                  child: Text(value),
                                                                                );
                                                                              }).toList(),
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
                                                                                  style: TextButton.styleFrom(backgroundColor: ColorName.primary),
                                                                                  child: const Text(
                                                                                    'Simpan',
                                                                                    style: TextStyle(
                                                                                      color: Colors.white, // Warna teks tombol
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        style: TextButton
                                                            .styleFrom(
                                                          backgroundColor: Colors
                                                              .purple, // Warna latar belakang tombol
                                                        ),
                                                        child: const Text(
                                                          'Edit',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .white, // Warna teks tombol
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          // Aksi yang dijalankan saat tombol ditekan
                                                        },
                                                        style: TextButton
                                                            .styleFrom(
                                                          backgroundColor: Colors
                                                              .red, // Warna latar belakang tombol
                                                        ),
                                                        child: const Text(
                                                          'Hapus',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .white, // Warna teks tombol
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                padding: EdgeInsets.only(bottom: 65),
                              ),
                            ),
                          ],
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              right: 20,
              left: null,
              child: Align(
                alignment: Alignment.bottomRight,
                child: ScrollingFabAnimated(
                  width: 150,
                  color: Theme.of(context).cardColor,
                  icon: SizedBox(
                      width: Dimensions.iconSizeExtraLarge,
                      child: Image.asset(Images.addIcon)),
                  text: const Text(
                    'Add New',
                    // style: robotoRegular.copyWith(),
                  ),
                  onPress: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                      context: context,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Container(
                                height: 700,
                                decoration: const BoxDecoration(
                                  color: ColorName.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        'Edit Soal',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Masukkan Soal',
                                          border: OutlineInputBorder(),
                                        ),
                                        // ...
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          // UploadFile(
                                          //   // fileName: ,
                                          //   onFileSelected: (File file) {
                                          //     // Periksa jenis file sebelum mengambil tindakan
                                          //     final isImage = [
                                          //       '.jpeg',
                                          //       '.png',
                                          //       '.gif',
                                          //       '.jpg'
                                          //     ].any((extension) => file.path
                                          //         .toLowerCase()
                                          //         .endsWith(extension));

                                          //     if (isImage) {
                                          //       // Lakukan sesuatu dengan file gambar yang dipilih di sini
                                          //       if (kDebugMode) {
                                          //         print(
                                          //             'Selected file: ${file.path}');
                                          //       }
                                          //       // Perbarui nama file di sini
                                          //       setState(() {
                                          //         fileName =
                                          //             file.path.split('/').last;
                                          //       });
                                          //     } else {
                                          //       // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                                          //       if (kDebugMode) {
                                          //         print(
                                          //             'File yang dipilih harus file gambar');
                                          //       }
                                          //       // Misalnya, tampilkan pesan kesalahan
                                          //       showDialog(
                                          //         context: context,
                                          //         builder:
                                          //             (BuildContext context) {
                                          //           return AlertDialog(
                                          //             title: const Text(
                                          //                 'File yang dipilih bukan file gambar'),
                                          //             actions: <Widget>[
                                          //               TextButton(
                                          //                 onPressed: () {
                                          //                   Navigator.of(
                                          //                           context)
                                          //                       .pop();
                                          //                 },
                                          //                 child:
                                          //                     const Text('OK'),
                                          //               ),
                                          //             ],
                                          //           );
                                          //         },
                                          //       );
                                          //     }
                                          //   },
                                          // ),
                                          
                                          Expanded(
                                            child: Container(
                                              height: 48,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 2,
                                                  color: const Color.fromARGB(
                                                      255,
                                                      238,
                                                      238,
                                                      238), // Warna garis border
                                                ),
                                                borderRadius: const BorderRadius
                                                    .only(
                                                    bottomRight:
                                                        Radius.circular(8),
                                                    topRight: Radius.circular(
                                                        8)), // Membuat garis border melingkar
                                              ),
                                              padding: const EdgeInsets.all(8),
                                              child: Center(
                                                child: Text(
                                                  fileName,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      DropdownButton<String>(
                                        isExpanded: true,
                                        value: _selectedDifficulty,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            _selectedDifficulty = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'Sulit',
                                          'Menengah',
                                          'Mudah'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: TextButton(
                                            onPressed: () {
                                              // Aksi yang dijalankan saat tombol ditekan
                                              Navigator.pop(context);
                                            },
                                            style: TextButton.styleFrom(
                                                backgroundColor:
                                                    ColorName.primary),
                                            child: const Text(
                                              'Simpan',
                                              style: TextStyle(
                                                color: Colors
                                                    .white, // Warna teks tombol
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  animateIcon: true,
                  inverted: false,
                  scrollController: scrollController,
                  radius: 10.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
