import 'package:cbt_app/bloc/endpoint/endpoint_bloc.dart';
import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/common/constants/images.dart';
import 'package:cbt_app/common/widgets/menu_card.dart';
import 'package:cbt_app/common/widgets/search_input.dart';
import 'package:cbt_app/data/datasource/endpoint/endpoint_local_datasource.dart';
import 'package:cbt_app/presentation/dosen/widget/crud_soal_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/get-soal/getsoal_bloc.dart';
import '../../../bloc/get_edit_jawaban/get_edit_jawaban_bloc.dart';

class PengujianPage extends StatefulWidget {
  const PengujianPage({super.key});

  @override
  State<PengujianPage> createState() => _PengujianPageState();
}

class _PengujianPageState extends State<PengujianPage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    context.read<EndpointBloc>().add(const EndpointEvent.getEndpoint());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
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
          Expanded(
            child: BlocBuilder<EndpointBloc, EndpointState>(
              builder: (context, state) {
                return state.maybeWhen(orElse: () {
                  return const Text('Data Belum Ada');
                }, loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }, loaded: (data) {
                  EndpointLocalDatasource().saveDataEndpoint(data);
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            final userId = data.data[index].id;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: MenuCard(
                                label: data.data[index].nama,
                                backgroundColor: const Color(0xff686BFF),
                                onPressed: () {
                                  int selectedUserId = userId;

                                  // Trigger the event with the updated selectedUserId
                                  context.read<GetsoalBloc>().add(
                                      GetsoalEvent.getSoal(
                                          userId: selectedUserId));

                                  // context.read<GetEditJawabanBloc>().add(
                                  //     GetEditJawabanEvent.getJawaban());

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CourseScheduleTile(
                                                selectedUserId: selectedUserId,
                                              )));
                                },
                                imagePath: Images.khs,
                              ),
                            );
                          },
                          itemCount: data.data.length,
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
    );
  }
}
