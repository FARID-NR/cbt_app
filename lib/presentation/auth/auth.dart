import 'package:cbt_app/bloc/login/login_bloc.dart';
import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/common/widgets/buttons.dart';
import 'package:cbt_app/presentation/auth/widget/login_bottom_sheet_mhs.dart';
import 'package:cbt_app/presentation/auth/widget/login_button_sheet_dsn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants/images.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.logo,
              width: 115.0,
            ),
            const SizedBox(height: 8.0),
            const Text(
              'CBT UINAM',
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: ColorName.primary),
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Ujian Konferensi Online, Sistem Informasi",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: ColorName.grey,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8.0),
            Button.filled(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return BlocProvider(
                        create: (context) => LoginBloc(),
                        child: const LoginBottomSheetDsn(),
                      );
                    },
                  );
                },
                label: "CIVITAS AKADEMIK"),
            const SizedBox(
              height: 8.0,
            ),
            Button.outlined(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return LoginBottomSheet();
                    },
                  );
                },
                label: 'MAHASISWA'),
            const SizedBox(height: 32.0),
            const Text.rich(
              TextSpan(
                  text: "Dengan memilih salah satu, Anda menyetujuinya ",
                  children: [
                    TextSpan(
                        text: "Ketentuan Layanan & Kebijakan Privasi",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ColorName.primary))
                  ]),
              style: TextStyle(fontSize: 12, color: ColorName.grey),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
