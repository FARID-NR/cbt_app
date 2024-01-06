// import 'package:flutter/material.dart';

// class Test extends StatelessWidget {
//   const Test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//           onPressed: () {
//             // Tindakan ketika tombol 'Download SK' ditekan
//             final nilaiAsliString = data.data.nilaiAsli;
//             // final nilaiAngka = int.tryParse(nilaiAsliString) ?? 0;
//             final requestModel = DownloadSkRequestModel(
//                 dosenPenguji: data.data.matkul.user.nama,
//                 mataKuliahId: data.data.matkul.id.toString(),
//                 mataKuliah: data.data.matkul.nama,
//                 namaMahasiswa: data.data.mahasiswa.nama,
//                 nimMahasiswa: data.data.mahasiswa.username,
//                 nilaiAngka: nilaiAsliString);
//             context
//                 .read<DownloadSkBloc>()
//                 .add(DownloadSkEvent.download_sk(requestModel));
//           },
//           child: const Text('Download PDF'),
//         )
//   }
// }