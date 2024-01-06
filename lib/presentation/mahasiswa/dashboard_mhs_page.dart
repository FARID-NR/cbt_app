import 'package:cbt_app/bloc/endpoint/endpoint_bloc.dart';
import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/common/widgets/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/dashboard-mhs/dashboard_mhs_bloc.dart';
import '../../common/constants/images.dart';

class DashboardMhsPage extends StatefulWidget {
  const DashboardMhsPage({super.key});

  @override
  State<DashboardMhsPage> createState() => _DashboardMhsPageState();
}

class _DashboardMhsPageState extends State<DashboardMhsPage> {

  @override
  void initState() {
    context.read<DashboardMhsBloc>().add(const DashboardMhsEvent.getDashMhs());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ColorName.primary,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const SampleMapPage())
                    // );
                  },
                  icon: const Icon(
                    Icons.map,
                    color: ColorName.green,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const AbsensiPage())
                    // );
                  },
                  icon: const Icon(
                    Icons.qr_code_scanner,
                    color: ColorName.primary,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: ColorName.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 50.0),
        BlocBuilder<DashboardMhsBloc, DashboardMhsState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return const SizedBox();
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              loaded: (data) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang Peserta Ujian Kompren',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: ColorName.primary),
                    ),
                    Text(
                      'Nama : ${data.data.mahasiswa.nama}',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: ColorName.primary),
                    ),
                    Text(
                      'NIM    : ${data.data.mahasiswa.username}',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: ColorName.primary),
                    ),
                    SizedBox(height: 20),
                    MenuCard(
                      label: data.data.penguji.penguji1.matkulNama, 
                      backgroundColor: const Color(0xff686BFF),              
                      onPressed: () {
                    
                       }, 
                      imagePath: Images.khs
                    ),
                    SizedBox(height: 20),
                    MenuCard(
                      label: data.data.penguji.penguji2.matkulNama, 
                      backgroundColor: const Color(0xff686BFF),              
                      onPressed: () {
                    
                       }, 
                      imagePath: Images.khs
                    ),
                    SizedBox(height: 20),
                    MenuCard(
                      label: data.data.penguji.penguji3.matkulNama, 
                      backgroundColor: const Color(0xff686BFF),              
                      onPressed: () {
                    
                       }, 
                      imagePath: Images.khs
                    ),

                  ],
                );
              }
            );
            
          },
        )
      ],
    );
  }
}
