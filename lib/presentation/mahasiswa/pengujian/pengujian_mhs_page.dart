import 'package:cbt_app/bloc/download_sk/download_sk_bloc.dart';
import 'package:cbt_app/bloc/hasil-ujian/hasil_ujian_bloc.dart';
import 'package:cbt_app/bloc/pengajuan/pengajuan_bloc.dart';
import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/common/constants/images.dart';
import 'package:cbt_app/common/widgets/menu_card.dart';
import 'package:cbt_app/common/widgets/search_input.dart';
import 'package:cbt_app/presentation/mahasiswa/pengujian/widget/start_cbt_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/dashboard-mhs/dashboard_mhs_bloc.dart';
import '../../../bloc/ujian/ujian_bloc.dart';

class PengujianMhsPage extends StatefulWidget {
  const PengujianMhsPage({super.key});

  @override
  State<PengujianMhsPage> createState() => _PengujianMhsPageState();
}

class _PengujianMhsPageState extends State<PengujianMhsPage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    context.read<DashboardMhsBloc>().add(const DashboardMhsEvent.getDashMhs());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(20.0), children: [
      const Text(
        'Pengujian',
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: ColorName.primary),
      ),
      const SizedBox(height: 10.0),
      SearchInput(
        controller: searchController,
      ),
      const SizedBox(height: 40.0),
      BlocBuilder<DashboardMhsBloc, DashboardMhsState>(
        builder: (context, state) {
         return state.maybeWhen(
            orElse: (){
              return Text('Loading...');
            },
            loading: (){
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            loaded: (data){
              // final matkulId1 = data.data.penguji.penguji1.matkulId;
              final matkulId2 = data.data.penguji.penguji2.matkulId;
              final matkulId3 = data.data.penguji.penguji3.matkulId;
              final userId = data.data.mahasiswa.id.toString();
              return Column(
                children: [
                  MenuCard(
                    label: data.data.penguji.penguji1.matkulNama,
                    backgroundColor: const Color(0xff686BFF),
                    onPressed: () {
                      final matkulId = data.data.penguji.penguji1.matkulId;
                      
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartPage(matkulId: matkulId, userId: userId)));
                      context.read<HasilUjianBloc>().add(HasilUjianEvent.hasil(matkulId));
                      context.read<UjianBloc>().add(UjianEvent.getUjian(matkulId: matkulId));
                      // context.read<>()
                    },
                    imagePath: Images.khs,
                  ),
                  SizedBox(height: 20,),
                  MenuCard(
                    label: data.data.penguji.penguji2.matkulNama,
                    backgroundColor: const Color(0xff686BFF),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartPage(matkulId: matkulId2, userId: userId,)));
                      context.read<HasilUjianBloc>().add(HasilUjianEvent.hasil(matkulId2));
                      context.read<UjianBloc>().add(UjianEvent.getUjian(matkulId: matkulId2));
                    },
                    imagePath: Images.khs,
                  ),
                  SizedBox(height: 20,),
                  MenuCard(
                    label: data.data.penguji.penguji3.matkulNama,
                    backgroundColor: const Color(0xff686BFF),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartPage(matkulId: matkulId3, userId: userId,)));
                      context.read<HasilUjianBloc>().add(HasilUjianEvent.hasil(matkulId3));
                      context.read<UjianBloc>().add(UjianEvent.getUjian(matkulId: matkulId3));
                    },
                    imagePath: Images.khs,
                  ),
                  SizedBox(height: 20,),
                ],
              );
            }
          );
          
        },
      ),
    ]);
  }
}
