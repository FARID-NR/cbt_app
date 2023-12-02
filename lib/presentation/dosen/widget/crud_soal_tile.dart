import 'dart:io';

import 'package:cbt_app/common/utils/dimensions.dart';
import 'package:cbt_app/common/utils/images.dart';
import 'package:cbt_app/common/widgets/animated_floating_button.dart';
import 'package:cbt_app/common/widgets/upload_file.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/constants/colors.dart';

class CourseScheduleTile extends StatefulWidget {
  // final CourseScheduleModel data;
  const CourseScheduleTile({super.key});

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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Soal Jaringan',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorName.primary),
                      ),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context, 
                            builder: (BuildContext Context) {
                              return StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState) {
                                  return Container(
                                    height: 500,
                                    width: double.infinity,
                                    padding: EdgeInsets.all(18),
                                    decoration: BoxDecoration(
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
                                          child: Text('Pilih Tanggal'),
                                          onPressed: () => _selectDate(context),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          'Tanggal Terpilih: ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(height: 20),
                                        ElevatedButton(
                                          onPressed: () => _selectTime(context),
                                          child: Text('Pilih Waktu'),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          'Waktu Terpilih: ${selectedTime.format(context)}',
                                          style: TextStyle(fontSize: 18),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(
                                            bottom: 5
                                          ),
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: TextButton(
                                              onPressed: () {
                                                // Aksi yang dijalankan saat tombol ditekan
                                                Navigator.pop(
                                                  context
                                                );
                                              },
                                              child: Text(
                                                'Simpan',
                                                style: TextStyle(
                                                  color: Colors.white, // Warna teks tombol
                                                ),
                                              ),
                                              style: TextButton.styleFrom(
                                                backgroundColor:ColorName.primary
                                              )
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          );
                        },
                        child: Text(
                          'Atur Jadwal',
                          style: TextStyle(
                            color: Colors.white, // Warna teks tombol
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor:
                              Colors.blue, // Warna latar belakang tombol
                        ),
                      ),
                    
                    ],
                  ),
                ),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 45.0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text('1.'),
                              ),
                              Text(
                                '',
                                style: TextStyle(
                                  color: ColorName.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      VerticalDivider(),
                      SizedBox(width: 5.0),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kategori : Susah',
                              style: TextStyle(
                                color: ColorName.primary,
                              ),
                            ),
                            SizedBox(height: 18.0),
                            Text(
                              'Siapa nama penemu Atom ?',
                              style: TextStyle(
                                color: ColorName.grey,
                              ),
                            ),
                            SizedBox(height: 18.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Action :',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        // Aksi yang dijalankan saat tombol ditekan
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor:
                                              Color.fromARGB(0, 255, 255, 255),
                                          context: context,
                                          builder: (BuildContext Context) {
                                            return StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Container(
                                                  height: 838,
                                                  decoration: BoxDecoration(
                                                    color: ColorName.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(30),
                                                      topRight:
                                                          Radius.circular(30),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            right: 20,
                                                            top: 60,
                                                            bottom: 20.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: IconButton(
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_outlined,
                                                                color: ColorName
                                                                    .primary,
                                                              ),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(height: 20),
                                                          Text(
                                                            'Edit Soal',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: ColorName
                                                                    .primary),
                                                          ),
                                                          SizedBox(height: 10),
                                                          TextFormField(
                                                            decoration:
                                                                InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      vertical:
                                                                          5,
                                                                      horizontal:
                                                                          8),
                                                              labelText:
                                                                  'Opsi A',
                                                              border:
                                                                  OutlineInputBorder(),
                                                            ),
                                                            // ...
                                                          ),
                                                          SizedBox(height: 10),
                                                          Row(
                                                            children: [
                                                              UploadFile(
                                                                // fileName: ,
                                                                onFileSelected:
                                                                    (File
                                                                        file) {
                                                                  // Periksa jenis file sebelum mengambil tindakan
                                                                  final isImage = [
                                                                    '.jpeg',
                                                                    '.png',
                                                                    '.gif',
                                                                    '.jpg'
                                                                  ].any((extension) => file
                                                                      .path
                                                                      .toLowerCase()
                                                                      .endsWith(
                                                                          extension));

                                                                  if (isImage) {
                                                                    // Lakukan sesuatu dengan file gambar yang dipilih di sini
                                                                    print(
                                                                        'Selected file: ${file.path}');
                                                                    // Perbarui nama file di sini
                                                                    setState(
                                                                        () {
                                                                      fileName = file
                                                                          .path
                                                                          .split(
                                                                              '/')
                                                                          .last;
                                                                    });
                                                                  } else {
                                                                    // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                                                                    print(
                                                                        'File yang dipilih harus file gambar');
                                                                    // Misalnya, tampilkan pesan kesalahan
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('File yang dipilih bukan file gambar'),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: Text('OK'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  height: 48,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      width: 2,
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          238,
                                                                          238,
                                                                          238), // Warna garis border
                                                                    ),
                                                                    borderRadius: BorderRadius.only(
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                                8),
                                                                        topRight:
                                                                            Radius.circular(8)), // Membuat garis border melingkar
                                                                  ),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  child: Center(
                                                                    child: Text(
                                                                      fileName,
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(height: 20),
                                                          TextFormField(
                                                            decoration:
                                                                InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      vertical:
                                                                          5,
                                                                      horizontal:
                                                                          8),
                                                              labelText:
                                                                  'Opsi B',
                                                              border:
                                                                  OutlineInputBorder(),
                                                            ),
                                                            // ...
                                                          ),
                                                          SizedBox(height: 10),
                                                          Row(
                                                            children: [
                                                              UploadFile(
                                                                // fileName: ,
                                                                onFileSelected:
                                                                    (File
                                                                        file) {
                                                                  // Periksa jenis file sebelum mengambil tindakan
                                                                  final isImage = [
                                                                    '.jpeg',
                                                                    '.png',
                                                                    '.gif',
                                                                    '.jpg'
                                                                  ].any((extension) => file
                                                                      .path
                                                                      .toLowerCase()
                                                                      .endsWith(
                                                                          extension));

                                                                  if (isImage) {
                                                                    // Lakukan sesuatu dengan file gambar yang dipilih di sini
                                                                    print(
                                                                        'Selected file: ${file.path}');
                                                                    // Perbarui nama file di sini
                                                                    setState(
                                                                        () {
                                                                      fileName = file
                                                                          .path
                                                                          .split(
                                                                              '/')
                                                                          .last;
                                                                    });
                                                                  } else {
                                                                    // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                                                                    print(
                                                                        'File yang dipilih harus file gambar');
                                                                    // Misalnya, tampilkan pesan kesalahan
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('File yang dipilih bukan file gambar'),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: Text('OK'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  height: 48,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      width: 2,
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          238,
                                                                          238,
                                                                          238), // Warna garis border
                                                                    ),
                                                                    borderRadius: BorderRadius.only(
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                                8),
                                                                        topRight:
                                                                            Radius.circular(8)), // Membuat garis border melingkar
                                                                  ),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  child: Center(
                                                                    child: Text(
                                                                      fileName,
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(height: 20),
                                                          TextFormField(
                                                            decoration:
                                                                InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      vertical:
                                                                          5,
                                                                      horizontal:
                                                                          8),
                                                              labelText:
                                                                  'Opsi C',
                                                              border:
                                                                  OutlineInputBorder(),
                                                            ),
                                                            // ...
                                                          ),
                                                          SizedBox(height: 10),
                                                          Row(
                                                            children: [
                                                              UploadFile(
                                                                // fileName: ,
                                                                onFileSelected:
                                                                    (File
                                                                        file) {
                                                                  // Periksa jenis file sebelum mengambil tindakan
                                                                  final isImage = [
                                                                    '.jpeg',
                                                                    '.png',
                                                                    '.gif',
                                                                    '.jpg'
                                                                  ].any((extension) => file
                                                                      .path
                                                                      .toLowerCase()
                                                                      .endsWith(
                                                                          extension));

                                                                  if (isImage) {
                                                                    // Lakukan sesuatu dengan file gambar yang dipilih di sini
                                                                    print(
                                                                        'Selected file: ${file.path}');
                                                                    // Perbarui nama file di sini
                                                                    setState(
                                                                        () {
                                                                      fileName = file
                                                                          .path
                                                                          .split(
                                                                              '/')
                                                                          .last;
                                                                    });
                                                                  } else {
                                                                    // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                                                                    print(
                                                                        'File yang dipilih harus file gambar');
                                                                    // Misalnya, tampilkan pesan kesalahan
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('File yang dipilih bukan file gambar'),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: Text('OK'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  height: 48,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      width: 2,
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          238,
                                                                          238,
                                                                          238), // Warna garis border
                                                                    ),
                                                                    borderRadius: BorderRadius.only(
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                                8),
                                                                        topRight:
                                                                            Radius.circular(8)), // Membuat garis border melingkar
                                                                  ),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  child: Center(
                                                                    child: Text(
                                                                      fileName,
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(height: 20),
                                                          TextFormField(
                                                            decoration:
                                                                InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      vertical:
                                                                          5,
                                                                      horizontal:
                                                                          8),
                                                              labelText:
                                                                  'Opsi D',
                                                              border:
                                                                  OutlineInputBorder(),
                                                            ),
                                                            // ...
                                                          ),
                                                          SizedBox(height: 10),
                                                          Row(
                                                            children: [
                                                              UploadFile(
                                                                // fileName: ,
                                                                onFileSelected:
                                                                    (File
                                                                        file) {
                                                                  // Periksa jenis file sebelum mengambil tindakan
                                                                  final isImage = [
                                                                    '.jpeg',
                                                                    '.png',
                                                                    '.gif',
                                                                    '.jpg'
                                                                  ].any((extension) => file
                                                                      .path
                                                                      .toLowerCase()
                                                                      .endsWith(
                                                                          extension));

                                                                  if (isImage) {
                                                                    // Lakukan sesuatu dengan file gambar yang dipilih di sini
                                                                    print(
                                                                        'Selected file: ${file.path}');
                                                                    // Perbarui nama file di sini
                                                                    setState(
                                                                        () {
                                                                      fileName = file
                                                                          .path
                                                                          .split(
                                                                              '/')
                                                                          .last;
                                                                    });
                                                                  } else {
                                                                    // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                                                                    print(
                                                                        'File yang dipilih harus file gambar');
                                                                    // Misalnya, tampilkan pesan kesalahan
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('File yang dipilih bukan file gambar'),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: Text('OK'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  height: 48,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      width: 2,
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          238,
                                                                          238,
                                                                          238), // Warna garis border
                                                                    ),
                                                                    borderRadius: BorderRadius.only(
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                                8),
                                                                        topRight:
                                                                            Radius.circular(8)), // Membuat garis border melingkar
                                                                  ),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  child: Center(
                                                                    child: Text(
                                                                      fileName,
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(height: 20),
                                                          TextFormField(
                                                            decoration:
                                                                InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      vertical:
                                                                          5,
                                                                      horizontal:
                                                                          8),
                                                              labelText:
                                                                  'Opsi E',
                                                              border:
                                                                  OutlineInputBorder(),
                                                            ),
                                                            // ...
                                                          ),
                                                          SizedBox(height: 10),
                                                          Row(
                                                            children: [
                                                              UploadFile(
                                                                // fileName: ,
                                                                onFileSelected:
                                                                    (File
                                                                        file) {
                                                                  // Periksa jenis file sebelum mengambil tindakan
                                                                  final isImage = [
                                                                    '.jpeg',
                                                                    '.png',
                                                                    '.gif',
                                                                    '.jpg'
                                                                  ].any((extension) => file
                                                                      .path
                                                                      .toLowerCase()
                                                                      .endsWith(
                                                                          extension));

                                                                  if (isImage) {
                                                                    // Lakukan sesuatu dengan file gambar yang dipilih di sini
                                                                    print(
                                                                        'Selected file: ${file.path}');
                                                                    // Perbarui nama file di sini
                                                                    setState(
                                                                        () {
                                                                      fileName = file
                                                                          .path
                                                                          .split(
                                                                              '/')
                                                                          .last;
                                                                    });
                                                                  } else {
                                                                    // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                                                                    print(
                                                                        'File yang dipilih harus file gambar');
                                                                    // Misalnya, tampilkan pesan kesalahan
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('File yang dipilih bukan file gambar'),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: Text('OK'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  height: 48,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      width: 2,
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          238,
                                                                          238,
                                                                          238), // Warna garis border
                                                                    ),
                                                                    borderRadius: BorderRadius.only(
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                                8),
                                                                        topRight:
                                                                            Radius.circular(8)), // Membuat garis border melingkar
                                                                  ),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  child: Center(
                                                                    child: Text(
                                                                      fileName,
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(height: 20),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Jawaban Benar :',
                                                                style: TextStyle(
                                                                    color: ColorName
                                                                        .primary),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Radio<String>(
                                                                    value: 'A',
                                                                    groupValue:
                                                                        selectedOption,
                                                                    onChanged:
                                                                        (String?
                                                                            value) {
                                                                      setState(
                                                                          () {
                                                                        selectedOption =
                                                                            value;
                                                                      });
                                                                    },
                                                                  ),
                                                                  Text('A'),
                                                                  Radio<String>(
                                                                    value: 'B',
                                                                    groupValue:
                                                                        selectedOption,
                                                                    onChanged:
                                                                        (String?
                                                                            value) {
                                                                      setState(
                                                                          () {
                                                                        selectedOption =
                                                                            value;
                                                                      });
                                                                    },
                                                                  ),
                                                                  Text('B'),
                                                                  Radio<String>(
                                                                    value: 'C',
                                                                    groupValue:
                                                                        selectedOption,
                                                                    onChanged:
                                                                        (String?
                                                                            value) {
                                                                      setState(
                                                                          () {
                                                                        selectedOption =
                                                                            value;
                                                                      });
                                                                    },
                                                                  ),
                                                                  Text('C'),
                                                                  Radio<String>(
                                                                    value: 'D',
                                                                    groupValue:
                                                                        selectedOption,
                                                                    onChanged:
                                                                        (String?
                                                                            value) {
                                                                      setState(
                                                                          () {
                                                                        selectedOption =
                                                                            value;
                                                                      });
                                                                    },
                                                                  ),
                                                                  Text('D'),
                                                                  Radio<String>(
                                                                    value: 'E',
                                                                    groupValue:
                                                                        selectedOption,
                                                                    onChanged:
                                                                        (String?
                                                                            value) {
                                                                      setState(
                                                                          () {
                                                                        selectedOption =
                                                                            value;
                                                                      });
                                                                    },
                                                                  ),
                                                                  Text('E'),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
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
                                                                child: Text(
                                                                  'Simpan',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white, // Warna teks tombol
                                                                  ),
                                                                ),
                                                                style: TextButton.styleFrom(
                                                                    backgroundColor:
                                                                        ColorName
                                                                            .primary),
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
                                      child: Text(
                                        'Jawaban',
                                        style: TextStyle(
                                          color:
                                              Colors.white, // Warna teks tombol
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors
                                            .green, // Warna latar belakang tombol
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Aksi yang dijalankan saat tombol ditekan
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor:
                                              Color.fromARGB(0, 255, 255, 255),
                                          context: context,
                                          builder: (BuildContext Context) {
                                            return SingleChildScrollView(
                                              physics: ClampingScrollPhysics(),
                                              child: StatefulBuilder(
                                                builder: (BuildContext context,
                                                    StateSetter setState) {
                                                  return Container(
                                                    height: 700,
                                                    decoration: BoxDecoration(
                                                      color: ColorName.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(30),
                                                        topRight:
                                                            Radius.circular(30),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Column(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: IconButton(
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_outlined,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(height: 20),
                                                          Text(
                                                            'Edit Soal',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          SizedBox(height: 20),
                                                          TextFormField(
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Masukkan Soal',
                                                              border:
                                                                  OutlineInputBorder(),
                                                            ),
                                                            // ...
                                                          ),
                                                          SizedBox(height: 20),
                                                          Row(
                                                            children: [
                                                              UploadFile(
                                                                // fileName: ,
                                                                onFileSelected:
                                                                    (File
                                                                        file) {
                                                                  // Periksa jenis file sebelum mengambil tindakan
                                                                  final isImage = [
                                                                    '.jpeg',
                                                                    '.png',
                                                                    '.gif',
                                                                    '.jpg'
                                                                  ].any((extension) => file
                                                                      .path
                                                                      .toLowerCase()
                                                                      .endsWith(
                                                                          extension));

                                                                  if (isImage) {
                                                                    // Lakukan sesuatu dengan file gambar yang dipilih di sini
                                                                    print(
                                                                        'Selected file: ${file.path}');
                                                                    // Perbarui nama file di sini
                                                                    setState(
                                                                        () {
                                                                      fileName = file
                                                                          .path
                                                                          .split(
                                                                              '/')
                                                                          .last;
                                                                    });
                                                                  } else {
                                                                    // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                                                                    print(
                                                                        'File yang dipilih harus file gambar');
                                                                    // Misalnya, tampilkan pesan kesalahan
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('File yang dipilih bukan file gambar'),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: Text('OK'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  height: 48,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      width: 2,
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          238,
                                                                          238,
                                                                          238), // Warna garis border
                                                                    ),
                                                                    borderRadius: BorderRadius.only(
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                                8),
                                                                        topRight:
                                                                            Radius.circular(8)), // Membuat garis border melingkar
                                                                  ),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  child: Center(
                                                                    child: Text(
                                                                      fileName,
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(height: 20),
                                                          DropdownButton<
                                                              String>(
                                                            isExpanded: true,
                                                            value:
                                                                _selectedDifficulty,
                                                            onChanged: (String?
                                                                newValue) {
                                                              setState(() {
                                                                _selectedDifficulty =
                                                                    newValue!;
                                                              });
                                                            },
                                                            items: <String>[
                                                              'Sulit',
                                                              'Menengah',
                                                              'Mudah'
                                                            ].map<
                                                                DropdownMenuItem<
                                                                    String>>((String
                                                                value) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: value,
                                                                child:
                                                                    Text(value),
                                                              );
                                                            }).toList(),
                                                          ),

                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
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
                                                                child: Text(
                                                                  'Simpan',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white, // Warna teks tombol
                                                                  ),
                                                                ),
                                                                style: TextButton.styleFrom(
                                                                    backgroundColor:
                                                                        ColorName
                                                                            .primary),
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
                                      child: Text(
                                        'Edit',
                                        style: TextStyle(
                                          color:
                                              Colors.white, // Warna teks tombol
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors
                                            .purple, // Warna latar belakang tombol
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Aksi yang dijalankan saat tombol ditekan
                                      },
                                      child: Text(
                                        'Hapus',
                                        style: TextStyle(
                                          color:
                                              Colors.white, // Warna teks tombol
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors
                                            .red, // Warna latar belakang tombol
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
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
                  text: Text(
                    'Add New',
                    // style: robotoRegular.copyWith(),
                  ),
                  onPress: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Color.fromARGB(0, 255, 255, 255),
                      context: context,
                      builder: (BuildContext Context) {
                        return SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          child: StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Container(
                                height: 700,
                                decoration: BoxDecoration(
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
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        'Edit Soal',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: 'Masukkan Soal',
                                          border: OutlineInputBorder(),
                                        ),
                                        // ...
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          UploadFile(
                                            // fileName: ,
                                            onFileSelected: (File file) {
                                              // Periksa jenis file sebelum mengambil tindakan
                                              final isImage = [
                                                '.jpeg',
                                                '.png',
                                                '.gif',
                                                '.jpg'
                                              ].any((extension) => file.path
                                                  .toLowerCase()
                                                  .endsWith(extension));

                                              if (isImage) {
                                                // Lakukan sesuatu dengan file gambar yang dipilih di sini
                                                print(
                                                    'Selected file: ${file.path}');
                                                // Perbarui nama file di sini
                                                setState(() {
                                                  fileName =
                                                      file.path.split('/').last;
                                                });
                                              } else {
                                                // Jika bukan file gambar, tampilkan pesan kesalahan atau lakukan tindakan lain
                                                print(
                                                    'File yang dipilih harus file gambar');
                                                // Misalnya, tampilkan pesan kesalahan
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'File yang dipilih bukan file gambar'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('OK'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                          ),
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
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(8),
                                                    topRight: Radius.circular(
                                                        8)), // Membuat garis border melingkar
                                              ),
                                              padding: EdgeInsets.all(8),
                                              child: Center(
                                                child: Text(
                                                  fileName,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20),
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
                                                                EdgeInsets.only(
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
                                                                child: Text(
                                                                  'Simpan',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white, // Warna teks tombol
                                                                  ),
                                                                ),
                                                                style: TextButton.styleFrom(
                                                                    backgroundColor:
                                                                        ColorName
                                                                            .primary),
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
