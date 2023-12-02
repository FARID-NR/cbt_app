import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/common/constants/images.dart';
import 'package:cbt_app/common/widgets/menu_card.dart';
import 'package:cbt_app/common/widgets/search_input.dart';
import 'package:cbt_app/presentation/dosen/pages/dosen.dart';
import 'package:cbt_app/presentation/dosen/widget/crud_soal_tile.dart';
import 'package:cbt_app/presentation/dosen/widget/data_mhs_selesai.dart';
import 'package:cbt_app/presentation/dosen/widget/data_mhs_ujian.dart';
import 'package:flutter/material.dart';

class ListMatkulHasilPage extends StatefulWidget {
  const ListMatkulHasilPage({super.key});

  @override
  State<ListMatkulHasilPage> createState() => _ListMatkulHasilPageState();
}

class _ListMatkulHasilPageState extends State<ListMatkulHasilPage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
               // Untuk kembali ke halaman sebelumnya
              Navigator.pop(context);
            },
          ),
          title: const Text(
              'Mata Kuliah',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ColorName.primary
              ),
            ),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              SearchInput(
                controller: searchController,
              ),
              const SizedBox(height: 40.0),
              MenuCard(
                label: 'Jaringan',
                backgroundColor: const Color(0xff686BFF),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DataMhsSelesaiTile()));
                },
                imagePath: Images.khs,
              ),
            ]
          ),
        ),
      ),
    );
  }
}