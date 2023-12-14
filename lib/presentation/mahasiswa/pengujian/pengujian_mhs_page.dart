import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/common/constants/images.dart';
import 'package:cbt_app/common/widgets/menu_card.dart';
import 'package:cbt_app/common/widgets/search_input.dart';
import 'package:cbt_app/presentation/mahasiswa/pengujian/widget/start_cbt_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/dashboard-mhs/dashboard_mhs_bloc.dart';

class PengujianMhsPage extends StatefulWidget {
  const PengujianMhsPage({super.key});

  @override
  State<PengujianMhsPage> createState() => _PengujianMhsPageState();
}

class _PengujianMhsPageState extends State<PengujianMhsPage> {
  final searchController = TextEditingController();

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
              return Column(
                children: [
                  MenuCard(
                    label: data.data.penguji.penguji1.matkulNama,
                    backgroundColor: const Color(0xff686BFF),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartPage()));
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
                              builder: (context) => const StartPage()));
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
                              builder: (context) => const StartPage()));
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
