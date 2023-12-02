import 'package:cbt_app/common/constants/colors.dart';
import 'package:flutter/material.dart';

class DashboardMhsPage extends StatefulWidget {
  const DashboardMhsPage({super.key});

  @override
  State<DashboardMhsPage> createState() => _DashboardMhsPageState();
}

class _DashboardMhsPageState extends State<DashboardMhsPage> {
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
        const SizedBox(height: 10.0),
        // SearchInput(
        //   controller: searchController,
        // ),
        // const SizedBox(height: 40.0),
        // MenuCard(
        //   label: 'Kartu Hasil\nStudi',
        //   backgroundColor: const Color(0xff686BFF),
        //   onPressed: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => const KhsPage()));
        //   },
        //   imagePath: Images.khs,
        // ),
        // const SizedBox(height: 40.0),
        // MenuCard(
        //   label: 'Nilai\nMata Kuliah',
        //   backgroundColor: const Color(0xffFFB023),
        //   onPressed: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => const NilaiMkPage()));
        //   },
        //   imagePath: Images.nMatkul,
        // ),
        // const SizedBox(height: 40.0),
        // MenuCard(
        //   label: 'Jadwal\nMata Kuliah',
        //   backgroundColor: const Color(0xffFF68F0),
        //   onPressed: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => const JadwalMatkulPage()));
        //   },
        //   imagePath: Images.jadwal,
        // ),
      ],
    );
  }
}