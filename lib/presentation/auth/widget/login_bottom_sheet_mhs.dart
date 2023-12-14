import 'package:cbt_app/data/datasource/login/login_local_datasource.dart';
import 'package:cbt_app/presentation/auth/widget/register_bottom_sheet_mhs.dart';
import 'package:cbt_app/presentation/mahasiswa/mahasiswa.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_siakad_app/data/models/request/auth_request_model.dart';

// import '../../../bloc/login/login_bloc.dart';
import '../../../bloc/login/login_bloc.dart';
import '../../../bloc/register/register_bloc.dart';
import '../../../common/constants/colors.dart';
import '../../../common/widgets/buttons.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../data/models/request/login_request_model.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({
    super.key,
  });

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 15,
            right: 15,
            left: 15,
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
                  "Masuk",
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
                  "Masukkan username dan password agar bisa mengakses ujian khonferensif.",
                  style: TextStyle(
                    color: ColorName.grey,
                  ),
                ),
                const SizedBox(height: 50.0),
                CustomTextField(
                  controller: usernameController,
                  label: 'Username',
                ),
                const SizedBox(height: 12.0),
                CustomTextField(
                  controller: passwordController,
                  label: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 30.0),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    state.maybeWhen(
                        orElse: () {},
                        loaded: (data) {
                          LoginLocalDatasource().saveLoginData(data);
                          if (data.data.roles == 'mahasiswa') {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const MahasiswaPage();
                            }));
                          } else if (data.data.roles != "mahasiswa") {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Mahasiswa'),
                                  content:
                                      const Text('Akun anda tidak terdaftar'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        error: (message) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Mahasiswa'),
                                content:
                                    const Text('Username atau Password salah'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        });
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                        return Button.filled(
                          onPressed: () {
                            final requestModel = LoginRequestModel(
                              username: usernameController.text,
                              password: passwordController.text,
                            );
                            context
                                .read<LoginBloc>()
                                .add(LoginEvent.login(requestModel));
                          },
                          label: 'Masuk',
                        );
                      }, loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      });
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child:
                      Text.rich(TextSpan(text: 'Belum Punya Akun ', children: [
                    TextSpan(
                        text: 'Buat Akun',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ColorName.primary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return BlocProvider(
                                create: (context) => RegisterBloc(),
                                child: const RegisterBottomSheet(),
                              );
                            }));
                          })
                  ])),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
