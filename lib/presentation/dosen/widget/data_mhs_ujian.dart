import 'dart:convert';
import 'dart:io';

import 'package:cbt_app/bloc/dapat_ujian/dapat_ujian_bloc.dart';
import 'package:cbt_app/bloc/remedial/remedial_bloc.dart';
import 'package:cbt_app/common/global_variables.dart';
import 'package:cbt_app/data/datasource/dapat-ujian/dapat_ujian_local_datasource.dart';
import 'package:cbt_app/data/models/response/get_pengajuan_response_model.dart';
import 'package:cbt_app/presentation/base_widget/pdf_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;

import '../../../bloc/pengajuan/pengajuan_bloc.dart';
import '../../../common/constants/colors.dart';

class DataMhsUjianTile extends StatefulWidget {
  // final CourseScheduleModel data;
  final int selectedUserId;
  final int userId;
  const DataMhsUjianTile(
      {super.key, required this.selectedUserId, required this.userId});

  @override
  State<DataMhsUjianTile> createState() => _DataMhsUjianState();
}

class _DataMhsUjianState extends State<DataMhsUjianTile> {
  ScrollController scrollController = ScrollController();
  bool activated = false;
  bool endScroll = false;
  String? selectedOption;
  bool isClicked = false;
  bool? dapatUjian;

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Perubahan Berhasil'),
          content: Text('Status berhasil diubah.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  Map<String, bool> clickedStatus = {}; // Map untuk menyimpan status isClicked


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Untuk kembali ke halaman sebelumnya
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'List Pengajuan Mahasiswa',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: ColorName.primary),
          ),
        ),
        body: BlocBuilder<PengajuanBloc, PengajuanState>(
          builder: (context, state) {
            return state.maybeWhen(orElse: () {
              return const Text('Belum ada pengajuan baru');
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, loaded: (data) {
              return ListView.builder(
                itemCount: data.data.mahasiswa.length,
                itemBuilder: (context, index) {
                  final dataID = data.data.mahasiswa[index].id;

                  // final mahasiswa = data.data.mahasiswa[index];
                  final dosenId1 =
                      data.data.mahasiswa[index].penguji.penguji1.userId;
                  final dosenId2 =
                      data.data.mahasiswa[index].penguji.penguji2.userId;
                  final dosenId3 =
                      data.data.mahasiswa[index].penguji.penguji3.userId;

                  final matkulId1 =
                      data.data.mahasiswa[index].penguji.penguji1.matkulId;
                  final matkulId2 =
                      data.data.mahasiswa[index].penguji.penguji2.matkulId;
                  final matkulId3 =
                      data.data.mahasiswa[index].penguji.penguji3.matkulId;
                  final linkSK = data.data.mahasiswa[index].skKompren;

                  // if (linkSK == null) {
                  //   linkSK = data.data.mahasiswa[index].skKompren;
                  // }
                  // // bool canTakeExam = true;
                  // String buttonText = 'Tidak Dapat Ujian';
                

                  if (dosenId1 == widget.userId.toString() &&
                      matkulId1 == widget.selectedUserId.toString()) {
                    dapatUjian =
                        data.data.mahasiswa[index].penguji.penguji1.dapatUjian;
                  }

                  if (dosenId2 == widget.userId.toString() &&
                      matkulId2 == widget.selectedUserId.toString()) {
                    dapatUjian =
                        data.data.mahasiswa[index].penguji.penguji2.dapatUjian;
                  }

                  if (dosenId3 == widget.userId.toString() &&
                      matkulId3 == widget.selectedUserId.toString()) {
                    dapatUjian =
                        data.data.mahasiswa[index].penguji.penguji3.dapatUjian;
                  }

                  // print('ini adalah dosen 1 : $dosenId1');
                  // print('ini adalah user    : ${widget.userId}');
                  // print('ini adalah dosen 2 : $dosenId1');
                  // print('ini adalah user    : ${widget.userId}');
                  // print('ini adalah dosen 3 : $dosenId1');
                  // print('ini adalah user    : ${widget.userId}');
                  // print('ini adalah matkulId : $matkulId1');
                  // print('ini adalah selectedUserId : ${widget.selectedUserId}');
                  // print('ini adalah matkulId : $matkulId2');
                  // print('ini adalah selectedUserId : ${widget.selectedUserId}');
                  // print('ini adalah matkulId : $matkulId3');
                  // print('ini adalah selectedUserId : ${widget.selectedUserId}');

                  // print('ini adalah dapatUjian : $dapatUjian');

                  return IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 45.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.data.mahasiswa[index].nama,
                                style: const TextStyle(
                                  color: ColorName.primary,
                                ),
                              ),
                              const SizedBox(height: 18.0),
                              Text(
                                data.data.mahasiswa[index].username,
                                style: const TextStyle(
                                  color: ColorName.grey,
                                ),
                              ),
                              const SizedBox(height: 18.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PdfViewerScreen(url: linkSK)));
                                    },
                                    child: const Text(
                                      'Lihat SK Kompren',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: ColorName.primary,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  if (dapatUjian == true)
                                    TextButton(
                                      onPressed: () {
                                        // _toggleIsClickedStatus(widget.selectedUserId.toString(), dataID.toString());
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Perubahan Berhasil'),
                                              content: const Text(
                                                  'Status berhasil diubah.'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    context
                                                        .read<DapatUjianBloc>()
                                                        .add(DapatUjianEvent
                                                            .dapatUjian(
                                                                matkulId: widget
                                                                    .selectedUserId,
                                                                mhsId: dataID));
                                                    Navigator.of(context).pop();
                                                    Future<void>
                                                        _refreshData() async {
                                                      context
                                                          .read<PengajuanBloc>()
                                                          .add(PengajuanEvent
                                                              .pengajuan(
                                                                  userId: widget
                                                                      .selectedUserId));
                                                    }

                                                    _refreshData();
                                                  },
                                                  style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.greenAccent),
                                                  child: const Text(
                                                    'Tutup',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.greenAccent),
                                      child: Text(
                                        'Dapat Ujian',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  else
                                    TextButton(
                                      onPressed: () {
                                        // _toggleIsClickedStatus(widget.selectedUserId.toString(), dataID.toString());
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Perubahan Berhasil'),
                                              content: const Text(
                                                  'Status berhasil diubah.'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    context
                                                        .read<DapatUjianBloc>()
                                                        .add(DapatUjianEvent
                                                            .dapatUjian(
                                                                matkulId: widget
                                                                    .selectedUserId,
                                                                mhsId: dataID));
                                                    Navigator.of(context).pop();
                                                    Future<void>
                                                        _refreshData() async {
                                                      context
                                                          .read<PengajuanBloc>()
                                                          .add(PengajuanEvent
                                                              .pengajuan(
                                                                  userId: widget
                                                                      .selectedUserId));
                                                    }

                                                    _refreshData();
                                                  },
                                                  style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.red),
                                                  child: const Text(
                                                    'Tutup',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.red),
                                      child: Text(
                                        'Tidak Dapat Ujian',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            });
          },
        ),
      ),
    );
  }
}