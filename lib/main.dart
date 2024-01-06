import 'package:cbt_app/bloc/add_soal/add_soal_bloc.dart';
import 'package:cbt_app/bloc/batal_kirim/batal_kirim_bloc.dart';
import 'package:cbt_app/bloc/daftar_soal/dafttar_soal_bloc.dart';
import 'package:cbt_app/bloc/dapat_ujian/dapat_ujian_bloc.dart';
import 'package:cbt_app/bloc/dashboard/dashboard_bloc.dart';
import 'package:cbt_app/bloc/edit_soal/edit_soal_bloc.dart';
import 'package:cbt_app/bloc/endpoint/endpoint_bloc.dart';
import 'package:cbt_app/bloc/get_edit_jawaban/get_edit_jawaban_bloc.dart';
import 'package:cbt_app/bloc/hapus_soal/hapus_soal_bloc.dart';
import 'package:cbt_app/bloc/hasil-ujian/hasil_ujian_bloc.dart';
import 'package:cbt_app/bloc/kirim_sk/kirim_sk_bloc.dart';
import 'package:cbt_app/bloc/lihat_nilai/lihat_nilai_bloc.dart';
import 'package:cbt_app/bloc/login/login_bloc.dart';
import 'package:cbt_app/bloc/pengajuan/pengajuan_bloc.dart';
import 'package:cbt_app/bloc/penilaian/penilaian_bloc.dart';
import 'package:cbt_app/bloc/register/register_bloc.dart';
import 'package:cbt_app/bloc/remedial/remedial_bloc.dart';
import 'package:cbt_app/bloc/submit_answer/submit_answer_bloc.dart';
import 'package:cbt_app/bloc/timer/timer_bloc.dart';
import 'package:cbt_app/data/datasource/login/login_local_datasource.dart';
import 'package:cbt_app/data/datasource/ujian/ujian_remote_datasource.dart';
import 'package:cbt_app/data/models/response/jawaban_response_model.dart';
import 'package:cbt_app/presentation/auth/splash.dart';
import 'package:cbt_app/presentation/dosen/pages/dosen.dart';
import 'package:cbt_app/presentation/mahasiswa/mahasiswa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

import 'bloc/dashboard-mhs/dashboard_mhs_bloc.dart';
import 'bloc/download_sk/download_sk_bloc.dart';
import 'bloc/get-soal/getsoal_bloc.dart';
import 'bloc/jawaban/jawaban_bloc.dart';
import 'bloc/ujian/ujian_bloc.dart';

// Buat variabel global untuk FlutterLocalNotificationsPlugin
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Meminta izin akses penyimpanan saat aplikasi dimulai
  var storageStatus = await Permission.storage.status;
  if (!storageStatus.isGranted) {
    // Jika izin belum diberikan, minta izin
    await Permission.storage.request();
  }

  // Menjalankan aplikasi Flutter setelah izin diberikan
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
        BlocProvider<DashboardBloc>(create: (context) => DashboardBloc()),
        BlocProvider<EndpointBloc>(create: (context) => EndpointBloc()),
        BlocProvider<GetsoalBloc>(create: (context) => GetsoalBloc()),
        BlocProvider<PengajuanBloc>(create: (context) => PengajuanBloc()),
        BlocProvider<PenilaianBloc>(create: (context) => PenilaianBloc()),
        BlocProvider<LihatNilaiBloc>(create: (context) => LihatNilaiBloc()),
        BlocProvider<DashboardMhsBloc>(create: (context) => DashboardMhsBloc()),
        BlocProvider<AddSoalBloc>(create: (context) => AddSoalBloc()),
        BlocProvider<JawabanBloc>(create: (context) => JawabanBloc()),
        BlocProvider<EditSoalBloc>(create: (context) => EditSoalBloc()),
        BlocProvider<TimerBloc>(create: (context) => TimerBloc()),
        BlocProvider<HapusSoalBloc>(create: (context) => HapusSoalBloc()),
        BlocProvider<RemedialBloc>(create: (context) => RemedialBloc()),
        BlocProvider<DapatUjianBloc>(create: (context) => DapatUjianBloc()),
        BlocProvider<UjianBloc>(create: (context) => UjianBloc(UjianRemoteDatasource())),
        BlocProvider<DaftarSoalBloc>(create: (context) => DaftarSoalBloc()),
        BlocProvider<SubmitAnswerBloc>(create: (context) => SubmitAnswerBloc()),
        BlocProvider<HasilUjianBloc>(create: (context) => HasilUjianBloc()),
        BlocProvider<DownloadSkBloc>(create: (context) => DownloadSkBloc()),
        BlocProvider<GetEditJawabanBloc>(create: (context) => GetEditJawabanBloc()),
        BlocProvider<KirimSkBloc>(create: (context) => KirimSkBloc()),
        BlocProvider<BatalKirimBloc>(create: (context) => BatalKirimBloc()),
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
                  future: LoginLocalDatasource()
                      .getRoles(), // Ambil nilai roles dengan menggunakan Future
                  builder: (context, roleSnapshot) {
                    if (roleSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator(); // Tampilkan loading jika masih menunggu data roles
                    } else {
                      String userRole = roleSnapshot.data ??
                          ''; // Pastikan untuk mengambil nilai dari snapshot.data

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
