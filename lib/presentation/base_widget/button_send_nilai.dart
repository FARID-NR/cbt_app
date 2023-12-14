import 'package:flutter/material.dart';

import '../../common/constants/colors.dart';

class ButtonSendNilai extends StatefulWidget {
  const ButtonSendNilai({super.key});

  @override
  State<ButtonSendNilai> createState() => _ButtonSendNilaiState();
}

class _ButtonSendNilaiState extends State<ButtonSendNilai> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Kirim Nilai',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text('Nilai Akhir (Konversi Remedial)'),
            TextFormField(
              decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
              // ...
            ),
            SizedBox(height: 20),
            Text('Keterangan Surat'),
            TextFormField(
              decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
              // ...
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {
                    // Aksi yang dijalankan saat tombol ditekan
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                      color: Colors.white, // Warna teks tombol
                    ),
                  ),
                  style:
                      TextButton.styleFrom(backgroundColor: ColorName.primary)),
            ),
          ],
        ),
      ),
    );
  }
}
