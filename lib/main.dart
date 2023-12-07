import 'package:cbt_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:cbt_app/bloc/endpoint/endpoint_bloc.dart';
import 'package:cbt_app/bloc/login/login_bloc.dart';
import 'package:cbt_app/bloc/register/register_bloc.dart';
import 'package:cbt_app/data/datasource/login/login_local_datasource.dart';
import 'package:cbt_app/presentation/auth/splash.dart';
import 'package:cbt_app/presentation/dosen/pages/dosen.dart';
import 'package:cbt_app/presentation/mahasiswa/mahasiswa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/get-soal/getsoal_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc()
        ),
        BlocProvider<DashboardBloc>(
          create: (context) => DashboardBloc()
        ),
        BlocProvider<EndpointBloc>(
          create: (context) => EndpointBloc()
        ),
        BlocProvider<GetsoalBloc>(
          create: (context) => GetsoalBloc()
        ),
      ],
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
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // Tampilkan loading jika masih menunggu data
                    } else if (snapshot.hasData && snapshot.data!) {
                      return FutureBuilder<String>(
                        future: LoginLocalDatasource().getRoles(), // Ambil nilai roles dengan menggunakan Future
                        builder: (context, roleSnapshot) {
                          if (roleSnapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator(); // Tampilkan loading jika masih menunggu data roles
                          } else {
                            String userRole = roleSnapshot.data ?? ''; // Pastikan untuk mengambil nilai dari snapshot.data

                            if (userRole == 'dosen') {
                              return const DosenPage(); // Jika roles adalah 'dosen', tampilkan DosenPage
                            } else {
                              return const MahasiswaPage(); // Jika roles bukan 'dosen', tampilkan MahasiswaPage
                            }
                          }
                        },
                      );
                    } else {
                      return const SplashPage(); // Jika pengguna belum login, tampilkan SplashPage
                    }
                  },
                ),
              ),
      ),
    );
  }
}
