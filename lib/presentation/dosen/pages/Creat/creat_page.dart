import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/common/constants/images.dart';
import 'package:cbt_app/common/widgets/menu_card.dart';
import 'package:cbt_app/common/widgets/search_input.dart';
import 'package:cbt_app/presentation/dosen/pages/Creat/widget/list_makul.dart';
import 'package:cbt_app/presentation/dosen/pages/Creat/widget/list_matkul_hasil.dart';
import 'package:flutter/material.dart';

class CreatPage extends StatefulWidget {
  const CreatPage({super.key});

  @override
  State<CreatPage> createState() => _CreatPageState();
}

class _CreatPageState extends State<CreatPage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(20.0), children: [
      const Text(
        'Mahasiswa',
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
      MenuCard(
        label: 'Pengajuan',
        backgroundColor: const Color(0xff686BFF),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ListMatkulPage()));
        },
        imagePath: Images.jadwal,
      ),
      const SizedBox(height: 40.0),
      MenuCard(
        label: 'Hasil Penilaian',
        backgroundColor: const Color(0xff686BFF),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ListMatkulHasilPage()));
        },
        imagePath: Images.nMatkul,
      ),
    ]);
  }
}
