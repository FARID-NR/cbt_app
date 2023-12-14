import 'package:cbt_app/common/utils/dimensions.dart';
import 'package:cbt_app/common/utils/images.dart';
import 'package:cbt_app/common/widgets/animated_floating_button.dart';
import 'package:cbt_app/presentation/base_widget/button_add_soal.dart';
import 'package:cbt_app/presentation/base_widget/button_atur_jadwal.dart';
import 'package:cbt_app/presentation/base_widget/button_edit.dart';
import 'package:cbt_app/presentation/base_widget/button_jawaban.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  String message = "";
  bool activated = false;
  bool endScroll = false;
  // late int selectedUserId;

  String cleanText(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>'), '');
  }

 Future<void> _refreshData() async {
    // Trigger bloc event to fetch updated data
    context.read<GetsoalBloc>().add(GetsoalEvent.getSoal(userId: widget.selectedUserId));
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
        body: RefreshIndicator(
          onRefresh: _refreshData,
          child: Column(
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
                      final selectedUserId = data.data.id;
                      return Stack(
                        children: [
                          Column(
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
                                                  return ButtonAturTimer();
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
                                                        const EdgeInsets.only(
                                                            left: 10),
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
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                            ),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.3,
                                            // width: MediaQuery.of(context).size.width ,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16.0, horizontal: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  cleanText(
                                                      data.data.soal[index].soal),
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
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {
                                                            final matkulId = data.data.id;
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
                                                                    return ButtonJawaban(matkulId: matkulId);
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
                                                                return ButtonEdit();
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
                                  final matkulId = data.data.id;
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor:
                                        const Color.fromARGB(0, 255, 255, 255),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ButtonAddSoal(matkulId: matkulId);
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
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ), // ini stack
      ),
    );
  }
}
