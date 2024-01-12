import 'dart:io';

import 'package:cbt_app/bloc/get_edit_jawaban/get_edit_jawaban_bloc.dart';
import 'package:cbt_app/data/models/request/jawaban_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../bloc/jawaban/jawaban_bloc.dart';
import '../../common/constants/colors.dart';

class ButtonJawaban extends StatefulWidget {
  final int matkulId;
  const ButtonJawaban({super.key, required this.matkulId});

  @override
  State<ButtonJawaban> createState() => _ButtonJawabanState();
}

class _ButtonJawabanState extends State<ButtonJawaban> {
  TextEditingController? _jawabanA;
  TextEditingController? _jawabanB;
  TextEditingController? _jawabanC;
  TextEditingController? _jawabanD;
  TextEditingController? _jawabanE;
  String fileName = "Upload Gambar";
  String? selectedOption;
  // XFile? _imageFile;
  XFile? _imageFileA;
  XFile? _imageFileB;
  XFile? _imageFileC;
  XFile? _imageFileD;
  XFile? _imageFileE;
  late int matkulId;

  String? imageA;
  String? imageB;
  String? imageC;
  String? imageD;
  String? imageE;

  Future<XFile?> getImage(ImageSource source, String option) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo =
        await picker.pickImage(source: source, imageQuality: 50);

    if (photo != null) {
      setState(() {
        // Perbarui variabel gambar yang sesuai berdasarkan opsi yang dipilih
        if (option == 'A') {
          _imageFileA = photo;
        } else if (option == 'B') {
          _imageFileB = photo;
        } else if (option == 'C') {
          _imageFileC = photo;
        } else if (option == 'D') {
          _imageFileD = photo;
        } else if (option == 'E') {
          _imageFileE = photo;
        }
      });
    }
    return photo;
  }

  @override
  void initState() {
    _jawabanA = TextEditingController();
    _jawabanB = TextEditingController();
    _jawabanC = TextEditingController();
    _jawabanD = TextEditingController();
    _jawabanE = TextEditingController();
    selectedOption;
    matkulId = widget.matkulId;
    imageA;
    imageB;
    imageC;
    imageD;
    imageE;
    // context.read<JawabanBloc>().add(JawabanEvent.jawaban(soalId: widget.matkulId));
    super.initState();
  }

  // @override
  // void dispose() {
  //   _jawabanA?.dispose();
  //   // ...
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 838,
      decoration: const BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20.0),
        child: SingleChildScrollView(
          child: BlocBuilder<GetEditJawabanBloc, GetEditJawabanState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (data) {
                  
                  var opsiA = data.data.a.jawaban;
                  final opsiB = data.data.b.jawaban;
                  final opsiC = data.data.c.jawaban;
                  final opsiD = data.data.d.jawaban;
                  final opsiE = data.data.e.jawaban;

                  final gambarA = data.data.a.gambarJawaban;
                  final gambarB = data.data.b.gambarJawaban;
                  final gambarC = data.data.c.gambarJawaban;
                  final gambarD = data.data.d.gambarJawaban;
                  final gambarE = data.data.e.gambarJawaban;

                if (imageA == null && imageB == null && imageC == null && imageD == null && imageE == null) {
                  imageA = gambarA;
                  imageB = gambarB;
                  imageC = gambarC;
                  imageD = gambarD;
                  imageE = gambarE;
                }
                  

                  final answerA = data.data.a.isCorrect;
                  final answerB = data.data.b.isCorrect;
                  final answerC = data.data.c.isCorrect;
                  final answerD = data.data.d.isCorrect;
                  final answerE = data.data.e.isCorrect;

                if (selectedOption == null) {
                  if (answerA == 1) {
                    selectedOption = 'A';
                  } else if (answerB == 1) {
                    selectedOption = 'B';
                  } else if (answerC == 1) {
                    selectedOption = 'C';
                  }else if (answerD == 1) {
                    selectedOption = 'D';
                  }else if (answerE == 1) {
                    selectedOption = 'E';
                  }
                }
                  
                  
                  if (_jawabanA!.text.isEmpty && _jawabanB!.text.isEmpty && _jawabanC!.text.isEmpty && _jawabanD!.text.isEmpty && _jawabanE!.text.isEmpty) {
                    _jawabanA?.text = opsiA;
                    _jawabanB?.text = opsiB;
                    _jawabanC?.text = opsiC;
                    _jawabanD?.text = opsiD;
                    _jawabanE?.text = opsiE;
                     // Set nilai _jawabanA jika kosong
                  }
                  
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        'Jawaban',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ColorName.primary),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _jawabanA,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                          labelText: 'Opsi A',
                          border: OutlineInputBorder(),
                        ),
                        // ...
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: _imageFileA != null
                                ? Image.file(
                                    File(_imageFileA!.path.toString()),
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  )
                                : imageA != null
                              ? Image.network(
                                  imageA ?? 'Pilih Gambar',
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: const Color.fromARGB(255, 238, 238,
                                          238), // Warna garis border
                                    ),
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(8),
                                        topRight: Radius.circular(
                                            8)), // Membuat garis border melingkar
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Image.network(
                                      imageA ?? 'Pilih Gambar',
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    )
                                  ),
                                ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              XFile? selectedImage =
                                  await getImage(ImageSource.gallery, 'A');
                              if (selectedImage != null) {
                                setState(() {
                                  _imageFileA = selectedImage;
                                });
                              }
                            },
                            child: Container(
                              height: 48,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    topLeft: Radius.circular(8)),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.file_upload),
                                  SizedBox(width: 8),
                                  Text(
                                    "Pilih File",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _jawabanB,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                          labelText: 'Opsi B',
                          border: OutlineInputBorder(),
                        ),
                        // ...
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: _imageFileB != null
                                ? Image.file(
                                    File(_imageFileB!.path.toString()),
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  )
                                : imageB != null
                              ? Image.network(
                                  imageB ?? 'Pilih Gambar',
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: const Color.fromARGB(255, 238, 238,
                                          238), // Warna garis border
                                    ),
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(8),
                                        topRight: Radius.circular(
                                            8)), // Membuat garis border melingkar
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Image.network(
                                      imageB ?? 'Pilih Gambar',
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    )
                                  ),
                                ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              XFile? selectedImage =
                                  await getImage(ImageSource.gallery, 'B');
                              if (selectedImage != null) {
                                setState(() {
                                  _imageFileB = selectedImage;
                                });
                              }
                            },
                            child: Container(
                              height: 48,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    topLeft: Radius.circular(8)),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.file_upload),
                                  SizedBox(width: 8),
                                  Text(
                                    "Pilih File",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _jawabanC,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                          labelText: 'Opsi C',
                          border: OutlineInputBorder(),
                        ),
                        // ...
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: _imageFileC != null
                                ? Image.file(
                                    File(_imageFileC!.path.toString()),
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  )
                                : imageC != null
                              ? Image.network(
                                  imageC ?? 'Pilih Gambar',
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: const Color.fromARGB(255, 238, 238,
                                          238), // Warna garis border
                                    ),
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(8),
                                        topRight: Radius.circular(
                                            8)), // Membuat garis border melingkar
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Image.network(
                                      imageC ?? 'Pilih Gambar',
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    )
                                  ),
                                ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              XFile? selectedImage =
                                  await getImage(ImageSource.gallery, 'C');
                              if (selectedImage != null) {
                                setState(() {
                                  _imageFileC = selectedImage;
                                });
                              }
                            },
                            child: Container(
                              height: 48,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    topLeft: Radius.circular(8)),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.file_upload),
                                  SizedBox(width: 8),
                                  Text(
                                    "Pilih File",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _jawabanD,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                          labelText: 'Opsi D',
                          border: OutlineInputBorder(),
                        ),
                        // ...
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: _imageFileD != null
                                ? Image.file(
                                    File(_imageFileD!.path.toString()),
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  )
                                : imageD != null
                              ? Image.network(
                                  imageD ?? 'Pilih Gambar',
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: const Color.fromARGB(255, 238, 238,
                                          238), // Warna garis border
                                    ),
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(8),
                                        topRight: Radius.circular(
                                            8)), // Membuat garis border melingkar
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Image.network(
                                      imageD ?? 'Pilih Gambar',
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    )
                                  ),
                                ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              XFile? selectedImage =
                                  await getImage(ImageSource.gallery, 'D');
                              if (selectedImage != null) {
                                setState(() {
                                  _imageFileD = selectedImage;
                                });
                              }
                            },
                            child: Container(
                              height: 48,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    topLeft: Radius.circular(8)),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.file_upload),
                                  SizedBox(width: 8),
                                  Text(
                                    "Pilih File",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _jawabanE,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                          labelText: 'Opsi E',
                          border: OutlineInputBorder(),
                        ),
                        // ...
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: _imageFileE != null
                                ? Image.file(
                                    File(_imageFileE!.path.toString()),
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  )
                                : imageE != null
                              ? Image.network(
                                  imageE ?? 'Pilih Gambar',
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: const Color.fromARGB(255, 238, 238,
                                          238), // Warna garis border
                                    ),
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(8),
                                        topRight: Radius.circular(
                                            8)), // Membuat garis border melingkar
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Image.network(
                                      imageE ?? 'Pilih Gambar',
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    )
                                  ),
                                ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              XFile? selectedImage =
                                  await getImage(ImageSource.gallery, 'E');
                              if (selectedImage != null) {
                                setState(() {
                                  _imageFileE = selectedImage;
                                });
                              }
                            },
                            child: Container(
                              height: 48,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    topLeft: Radius.circular(8)),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.file_upload),
                                  SizedBox(width: 8),
                                  Text(
                                    "Pilih File",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                          RadioListTile<String>(
                            title: const Text('A'),
                            value: 'A',
                            groupValue: selectedOption,
                            onChanged: (String? value) {
                              setState(() {
                                selectedOption = value;
                              });
                            },
                          ),
                          // const Text('A'),
                          RadioListTile<String>(
                            title: const Text('B'),
                            value: 'B',
                            groupValue: selectedOption,
                            onChanged: (String? value) {
                              setState(() {
                                selectedOption = value;
                              });
                            },
                          ),
                          // const Text('B'),
                          RadioListTile<String>(
                            title: const Text('C'),
                            value: 'C',
                            groupValue: selectedOption,
                            onChanged: (String? value) {
                              setState(() {
                                selectedOption = value;
                              });
                            },
                          ),
                          // const Text('C'),
                          RadioListTile<String>(
                            title: const Text('D'),
                            value: 'D',
                            groupValue: selectedOption,
                            onChanged: (String? value) {
                              setState(() {
                                selectedOption = value;
                              });
                            },
                          ),
                          // const Text('D'),
                          RadioListTile<String>(
                            title: const Text('E'),
                            value: 'E',
                            groupValue: selectedOption,
                            onChanged: (String? value) {
                              setState(() {
                                selectedOption = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: BlocListener<JawabanBloc, JawabanState>(
                            listener: (context, state) {
                              state.maybeWhen(
                                  orElse: () {},
                                  loaded: (data) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.greenAccent,
                                        content: Text('Data Berhasil Di tambah'),
                                      ),
                                    );
                                    Navigator.pop(context);
                                  },
                                  error: (message) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text('$message'),
                                    ));
                                  });
                            },
                            child: BlocBuilder<JawabanBloc, JawabanState>(
                              builder: (context, state) {
                                return state.maybeWhen(orElse: () {
                                  return TextButton(
                                    onPressed: () {
                                      // Aksi yang dijalankan saat tombol ditekan
                                      if (_jawabanA!.text.isEmpty ||
                                          _jawabanB!.text.isEmpty ||
                                          _jawabanC!.text.isEmpty ||
                                          _jawabanD!.text.isEmpty ||
                                          _jawabanE!.text.isEmpty ||
                                          selectedOption!.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text('Opsi Wajib di isi'),
                                        ));
                                      } else {
                                        final requestModel = JawabanRequestModel(
                                          jawabanA: _jawabanA!.text,
                                          jawabanB: _jawabanB!.text,
                                          jawabanC: _jawabanC!.text,
                                          jawabanD: _jawabanD!.text,
                                          jawabanE: _jawabanE!.text,
                                          benar: selectedOption!,
                                          imageA: _imageFileA != null
                                              ? _imageFileA!
                                              : XFile(''),
                                          imageB: _imageFileB != null
                                              ? _imageFileB!
                                              : XFile(''),
                                          imageC: _imageFileC != null
                                              ? _imageFileC!
                                              : XFile(''),
                                          imageD: _imageFileD != null
                                              ? _imageFileD!
                                              : XFile(''),
                                          imageE: _imageFileE != null
                                              ? _imageFileE!
                                              : XFile(''),
                                        );

                                        context.read<JawabanBloc>().add(
                                            JawabanEvent.jawaban(
                                                requestModel, widget.matkulId));
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor: ColorName.primary),
                                    child: const Text(
                                      'Simpan',
                                      style: TextStyle(
                                        color: Colors.white, // Warna teks tombol
                                      ),
                                    ),
                                  );
                                }, loading: () {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                });
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }
              );
              
            },
          ),
        ),
      ),
    );
  }
}
