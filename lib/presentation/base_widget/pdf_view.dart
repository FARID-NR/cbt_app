import 'dart:io';

import 'package:cbt_app/bloc/pengajuan/pengajuan_bloc.dart';
import 'package:cbt_app/presentation/dosen/widget/data_mhs_ujian.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../../data/models/response/get_pengajuan_response_model.dart';

class PdfViewerScreen extends StatefulWidget {
  final String? url;

  const PdfViewerScreen({Key? key, this.url}) : super(key: key);

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {

  @override
  void initState() {
    super.initState();
  }

  Future<String> downloadAndSavePDF() async {
    final response = await http.get(Uri.parse(widget.url!));
    final documentDirectory = await getApplicationDocumentsDirectory();
    final file = File('${documentDirectory.path}/sk_kompren.pdf');
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PDF Viewer'),
        ),
        body: BlocBuilder<PengajuanBloc, PengajuanState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Center(
                  child: Text('PDF Belum Diunggah'),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              loaded: (data) {
                var sk;
                for (var i = 0; i < data.data.mahasiswa.length; i++) {
                  sk = data.data.mahasiswa[i].skKompren;
                }
                print('ini adalah SK : $sk');
                
                return FutureBuilder(
                  future: downloadAndSavePDF(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('Error saat mengunduh PDF'),
                        );
                      } else {
                        return Container(
                          child: PDFView(
                            filePath: snapshot.data,
                          ),
                        );
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );  
                    }
                  },
                );
              }
            );
            
          },
        ));
  }
}
