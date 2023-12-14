import 'package:cbt_app/bloc/pengajuan/pengajuan_bloc.dart';
import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/common/constants/images.dart';
import 'package:cbt_app/common/widgets/menu_card.dart';
import 'package:cbt_app/common/widgets/search_input.dart';
import 'package:cbt_app/presentation/dosen/widget/data_mhs_ujian.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../bloc/endpoint/endpoint_bloc.dart';
import '../../../../../data/datasource/endpoint/endpoint_local_datasource.dart';

class ListMatkulPage extends StatefulWidget {
  const ListMatkulPage({super.key});

  @override
  State<ListMatkulPage> createState() => _ListMatkulPageState();
}

class _ListMatkulPageState extends State<ListMatkulPage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    context.read<EndpointBloc>().add(const EndpointEvent.getEndpoint());
    super.initState();
  }

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
                color: ColorName.primary),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            const SizedBox(height: 10.0),
            SearchInput(
              controller: searchController,
            ),
            const SizedBox(height: 40.0),
            Expanded(
              child: BlocBuilder<EndpointBloc, EndpointState>(
                builder: (context, state) {
                  return state.maybeWhen(orElse: () {
                    return Text('Data matkul belum di isi');
                  }, loading: () {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }, loaded: (data) {
                    EndpointLocalDatasource().saveDataEndpoint(data);
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: data.data.length,
                            itemBuilder: (context, index) {
                              // final userId = data.data[index].id;
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: MenuCard(
                                  label: data.data[index].nama,
                                  backgroundColor: const Color(0xff686BFF),
                                  onPressed: () {
                                    int selectedUserId = data.data[index].id;
                                    debugPrint(selectedUserId.toString());
                                    context.read<PengajuanBloc>().add(
                                        PengajuanEvent.pengajuan(
                                            userId: selectedUserId));

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DataMhsUjianTile(
                                                    selectedUserId:
                                                        selectedUserId)));
                                  },
                                  imagePath: Images.khs,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  });
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
