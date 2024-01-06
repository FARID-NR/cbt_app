import 'package:cbt_app/bloc/kirim_sk/kirim_sk_bloc.dart';
import 'package:cbt_app/bloc/remedial/remedial_bloc.dart';
import 'package:cbt_app/data/datasource/endpoint/endpoint_local_datasource.dart';
import 'package:cbt_app/presentation/base_widget/button_lihat_nilai.dart';
import 'package:cbt_app/presentation/base_widget/button_send_nilai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../bloc/batal_kirim/batal_kirim_bloc.dart';
import '../../../bloc/penilaian/penilaian_bloc.dart';
import '../../../common/constants/colors.dart';

class DataMhsSelesaiTile extends StatefulWidget {
  // final CourseScheduleModel data;
  final int userId;
  final int matkulId;
  const DataMhsSelesaiTile({super.key, required this.matkulId, required this.userId});

  @override
  State<DataMhsSelesaiTile> createState() => _DataMhsSelesaiTile();
}

class _DataMhsSelesaiTile extends State<DataMhsSelesaiTile> {
  ScrollController scrollController = ScrollController();
  String message = "";
  bool activated = false;
  bool endScroll = false;
  String? selectedOption;
  int? jumlahBenar;
  int? jumlahSalah;
  dynamic nilaiUjian;
  bool? remedial;
  int? nilaiRemedial;
  String? sk;
  String? keterangan;
  int? mhsId;

  // String matkulId = '${EndpointLocalDatasource().getIdEndpoint()}';

  @override
  void initState() {
    mhsId;
    super.initState();
  }

  Future<void> _refreshData() async {
    context.read<BatalKirimBloc>().add(BatalKirimEvent.batalKirim(matkulId: widget.matkulId, mhsId: mhsId!));
  } 

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
                _refreshData();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<PenilaianBloc, PenilaianState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    // Untuk kembali ke halaman sebelumnya
                    Navigator.pop(context);
                  },
                ),
                title: const Text(
                  'Data Mahasiswa Ujian',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ColorName.primary),
                ),
              ),
              body: const Center(
                child: Text('Data Mahasiswa Ujian Belum ada'),
              )
            );
          }, 
          loading: () {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    // Untuk kembali ke halaman sebelumnya
                    Navigator.pop(context);
                  },
                ),
                title: const Text(
                  'Data Mahasiswa Ujian',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ColorName.primary),
                ),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }, 
          loaded: (data) {
            
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    // Untuk kembali ke halaman sebelumnya
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  'Data Ujian ${data.data.matkul.nama}',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ColorName.primary),
                ),
              ),
              body: ListView.builder(
                itemCount: data.data.mahasiswa.length,
                itemBuilder: (context, index) {
                  final idMatkul = widget.matkulId;
                  final idMhs = data.data.mahasiswa[index].id;
                  debugPrint(idMatkul.toString());
                  debugPrint(idMhs.toString());
                  final dosenPenguji = data.data.dosen.nama;
                  final matkulId = data.data.matkul.id;
                  final matkul = data.data.matkul.nama;
                  final mahasiswa = data.data.mahasiswa[index].nama;
                  final mhsId = data.data.mahasiswa[index].id;
                  final nim = data.data.mahasiswa[index].username;
                  final dosenPengujiId1 = data.data.mahasiswa[index].penguji.penguji1.userId;
                  final dosenPengujiId2 = data.data.mahasiswa[index].penguji.penguji2.userId;
                  final dosenPengujiId3 = data.data.mahasiswa[index].penguji.penguji3.userId;
                  final matkulId1 = data.data.mahasiswa[index].penguji.penguji1.matkulId;
                  final matkulId2 = data.data.mahasiswa[index].penguji.penguji2.matkulId;
                  final matkulId3 = data.data.mahasiswa[index].penguji.penguji3.matkulId;
                  final jumlahBenarTst = data.data.mahasiswa[index].nilai.nilaiPenguji1.jumlahBenar;
                  


                  if (dosenPengujiId1 == widget.userId.toString() && matkulId1 == widget.matkulId.toString()) {
                    jumlahBenar = data.data.mahasiswa[index].nilai.nilaiPenguji1.jumlahBenar;
                    jumlahSalah = data.data.mahasiswa[index].nilai.nilaiPenguji1.jumlahSalah;
                    nilaiUjian = data.data.mahasiswa[index].nilai.nilaiPenguji1.nilaiUjian;
                    remedial = data.data.mahasiswa[index].nilai.nilaiPenguji1.remidial;
                    nilaiRemedial = data.data.mahasiswa[index].nilai.nilaiPenguji1.nilaiRemidial;
                    sk = data.data.mahasiswa[index].nilai.nilaiPenguji1.sk;
                    keterangan = data.data.mahasiswa[index].nilai.nilaiPenguji1.keterangan;
                  } 
                  
                  if (dosenPengujiId2 == widget.userId.toString() && matkulId2 == widget.matkulId.toString()) {
                    jumlahBenar = data.data.mahasiswa[index].nilai.nilaiPenguji2.jumlahBenar;
                    jumlahSalah = data.data.mahasiswa[index].nilai.nilaiPenguji2.jumlahSalah;
                    nilaiUjian = data.data.mahasiswa[index].nilai.nilaiPenguji2.nilaiUjian;
                    remedial = data.data.mahasiswa[index].nilai.nilaiPenguji2.remidial;
                    nilaiRemedial = data.data.mahasiswa[index].nilai.nilaiPenguji2.nilaiRemidial;
                    sk = data.data.mahasiswa[index].nilai.nilaiPenguji2.sk;
                    keterangan = data.data.mahasiswa[index].nilai.nilaiPenguji2.keterangan;
                  } 
                  if (dosenPengujiId3 == widget.userId.toString() && matkulId3 == widget.matkulId.toString()) {
                    jumlahBenar = data.data.mahasiswa[index].nilai.nilaiPenguji3.jumlahBenar;
                    jumlahSalah = data.data.mahasiswa[index].nilai.nilaiPenguji3.jumlahSalah;
                    nilaiUjian = data.data.mahasiswa[index].nilai.nilaiPenguji3.nilaiUjian;
                    remedial = data.data.mahasiswa[index].nilai.nilaiPenguji3.remidial;
                    nilaiRemedial = data.data.mahasiswa[index].nilai.nilaiPenguji3.nilaiRemidial;
                    sk = data.data.mahasiswa[index].nilai.nilaiPenguji3.sk;
                    keterangan = data.data.mahasiswa[index].nilai.nilaiPenguji3.keterangan;
                  }

                  return IntrinsicHeight(
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
                                  child: Text('${index + 1}.'),
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
                              const SizedBox(height: 10.0),
                              Text(
                                data.data.mahasiswa[index].username,
                                style: const TextStyle(
                                  color: ColorName.primary,
                                ),
                              ),
                              const SizedBox(height: 18.0),
                              if (jumlahBenar == 0 && jumlahSalah == 0)
                                
                                const Text(
                                  'Belum Mengerjakan',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )
                              else if (remedial == true)
                                const Text(
                                  'Remedial',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                )
                              else 
                                const Text(
                                  'Tidak Remedial',
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                ),
                              SizedBox(height: 18.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Action :',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                if (jumlahBenar == 0 && jumlahSalah == 0)
                                  const Text(
                                    'Tidak Ada Action'
                                  )
                                else
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          // Aksi yang dijalankan saat tombol ditekan
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Color.fromARGB(
                                                0, 255, 255, 255),
                                            context: context,
                                            builder: (BuildContext Context) {
                                              return StatefulBuilder(
                                                builder: (BuildContext context,
                                                    StateSetter setState) {
                                                  return ButtonViewScore(
                                                      idMatkul: idMatkul,
                                                      idMhs: idMhs);
                                                },
                                              );
                                            },
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors
                                              .blueAccent, // Warna latar belakang tombol
                                        ),
                                        child: const Text(
                                          'Lihat Nilai',
                                          style: TextStyle(
                                            color: Colors
                                                .white, // Warna teks tombol
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      // if ()
                                      TextButton(
                                        onPressed: () {
                                          // Aksi yang dijalankan saat tombol ditekan
                                          context.read<RemedialBloc>().add(RemedialEvent.remedial(matkulId: widget.matkulId, mhsId: idMhs));
                                          _showSuccessDialog();

                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors
                                              .red, // Warna latar belakang tombol
                                        ),
                                        child: remedial == true
                                         ? const Text(
                                            'Remedial Lagi',
                                            style: TextStyle(
                                              color: Colors
                                                  .white, // Warna teks tombol
                                              fontSize: 12
                                            ),
                                          )
                                         : const Text(
                                            'Remedial',
                                              style: TextStyle(
                                                color: Colors
                                                    .white, // Warna teks tombol
                                                fontSize: 12
                                              ),
                                          )
                                      ),
                                      const SizedBox(width: 10),
                                    if (sk == '' && keterangan == '')
                                      TextButton(
                                        onPressed: () {
                                          // Aksi yang dijalankan saat tombol ditekan
                                          // context.read<KirimSkBloc>().add(KirimSkEvent.kirimSK());
                                          showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (BuildContext Context) {
                                                return StatefulBuilder(builder:
                                                    (BuildContext context,
                                                        StateSetter setState) {
                                                  return ButtonSendNilai(
                                                    dosenPenguji: dosenPenguji,
                                                    matkulId: matkulId,
                                                    matkul: matkul,
                                                    mahasiswa: mahasiswa,
                                                    nim: nim,
                                                  );
                                                });
                                              });
                                          
                                          Future<void> _refreshData() async {
                                            
                                            context.read<PenilaianBloc>().add(PenilaianEvent.penilaian(matkulId.toString()));
                                          }
                                          _refreshData();
                                              
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors
                                              .green, // Warna latar belakang tombol
                                        ),
                                        child: const Text(
                                          'Kirim Nilai',
                                          style: TextStyle(
                                            color: Colors
                                                .white,
                                            fontSize: 12
                                          ),
                                        ),
                                      )
                                    else
                                      TextButton(
                                        onPressed: () {


                                          context.read<BatalKirimBloc>().add(BatalKirimEvent.batalKirim(matkulId: matkulId, mhsId: mhsId));

                                          Future<void> _refreshData() async {
                                            
                                            context.read<PenilaianBloc>().add(PenilaianEvent.penilaian(matkulId.toString()));
                                          } 

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
                                                        _refreshData();
                                                      },
                                                      child: Text('Tutup'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                          _showSuccessDialog();
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.amber
                                        ),
                                        child: const Text(
                                          'Batal Kirim',
                                          style: TextStyle(
                                            color: Colors
                                                .white, // Warna teks tombol
                                            fontSize: 12
                                          ),
                                        )
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
                  );
                },
              ),
            );
          });
        },
      ),
    );
  }
}
