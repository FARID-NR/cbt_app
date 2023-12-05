import 'package:cbt_app/bloc/login/login_bloc.dart';
import 'package:cbt_app/bloc/register/register_bloc.dart';
import 'package:cbt_app/data/datasource/login/login_local_datasource.dart';
import 'package:cbt_app/presentation/auth/splash.dart';
import 'package:cbt_app/presentation/dosen/pages/dosen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) => LoginBloc(),
          child: FutureBuilder<bool>(
            future: LoginLocalDatasource().isLogin(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!) {
                return const DosenPage();
              } else {
                return const SplashPage();
              }
            },
          ),
        ),
      ),
    );
  }
}
