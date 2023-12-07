import 'package:cbt_app/common/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/dashboard/dashboard_bloc.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  void initState() {
    context.read<DashboardBloc>().add(const DashboardEvent.getDash());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        // padding: const EdgeInsets.all(20.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Perkuliahan",
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
          const SizedBox(height: 40.0),
          BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: (){
                  // return const Text('Data kosong');
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Column(
                            children: [
                              Text(
                                'Jumlah Matkul',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '0',
                                style: TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Column(
                            children: [
                              Text(
                                'Jumlah Mahasiswa',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '0',
                                style: TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator(),);
                },
                loaded: (data) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              const Text(
                                'Jumlah Matkul',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '${data.data.jumlahMatkul}',
                                style: const TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              const Text(
                                'Jumlah Mahasiswa',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '${data.data.jumlahMahasiswa}',
                                style: const TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  );
                }
              );
              
            },
          )
        ],
      ),
    );
  }
}
