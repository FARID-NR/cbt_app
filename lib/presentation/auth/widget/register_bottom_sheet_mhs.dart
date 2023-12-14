import 'dart:io';

import 'package:cbt_app/bloc/register/register_bloc.dart';
import 'package:cbt_app/common/extensions/build_context_ext.dart';
import 'package:cbt_app/common/widgets/upload_file.dart';
import 'package:cbt_app/data/models/request/register_request_model.dart';
import 'package:cbt_app/presentation/auth/auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_siakad_app/data/models/request/auth_request_model.dart';

// import '../../../bloc/login/login_bloc.dart';
import '../../../common/constants/colors.dart';
import '../../../common/widgets/buttons.dart';
import '../../../common/widgets/custom_text_field.dart';

class RegisterBottomSheet extends StatefulWidget {
  const RegisterBottomSheet({
    super.key,
  });

  @override
  State<RegisterBottomSheet> createState() => _RegisterBottomSheetState();
}

class _RegisterBottomSheetState extends State<RegisterBottomSheet> {
  final TextEditingController namaLengkapController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isSKBeingChecked = false;

  File? _filePdf;

  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        _filePdf= File(result.files.first.path!);
        setState(() {}); // Perbarui tampilan setelah pemilihan file
      } else {
        // Pengguna membatalkan pemilihan
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }

  // Fungsi untuk menampilkan dialog verifikasi
  void _showVerificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Verifikasi Data'),
          content: Text('Silahkan tunggu data anda di verifikasi oleh admin.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (contex) => AuthPage()));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    namaLengkapController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      "Buat Akun",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 40.0),
                  ],
                ),
                const Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24.0),
                    const Text(
                      "Selamat Datang",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      "Buat akun agar bisa mengakses ujian khonferensif.",
                      style: TextStyle(
                        color: ColorName.grey,
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    CustomTextField(
                        controller: namaLengkapController,
                        label: 'Nama Lengkap'),
                    const SizedBox(height: 12.0),
                    CustomTextField(
                      controller: usernameController,
                      label: 'Username/NIM',
                    ),
                    const SizedBox(height: 12.0),
                    CustomTextField(
                      controller: passwordController,
                      label: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 12.0),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            pickFile();
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
                        Expanded(
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: const Color.fromARGB(
                                    255, 238, 238, 238), // Warna garis border
                              ),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(8),
                                  topRight: Radius.circular(
                                      8)), // Membuat garis border melingkar
                            ),
                            padding: EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                'Upload SK',
                                style: TextStyle(color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    BlocConsumer<RegisterBloc, RegisterState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          success: (state) {
                            // AuthLocalDatasource().saveAuthData(state);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Register Success'),
                                  content: Text('Data anda akan dicek oleh admin'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        context.pushReplacement(const AuthPage());
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                            
                          },
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return Button.filled(
                              onPressed: () {
                                if (_filePdf != null) {
                                  final dataRequest = RegisterRequestModel(
                                      nama: namaLengkapController.text,
                                      username: usernameController.text,
                                      password: passwordController.text,
                                      skKompren: _filePdf!
                                    );
                                  debugPrint(dataRequest.toString());
                                  context
                                      .read<RegisterBloc>()
                                      .add(RegisterEvent.register(dataRequest));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Pilih file SK terlebih dahulu'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              label: 'Buat Akun',
                            );
                          },
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: Text.rich(
                          TextSpan(text: 'Sudah Punya Akun ? ', children: [
                        TextSpan(
                            text: 'MASUK',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: ColorName.primary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                              })
                      ])),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
