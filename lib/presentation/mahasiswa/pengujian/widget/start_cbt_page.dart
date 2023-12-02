import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/presentation/mahasiswa/cbt_page/cbt_screen.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorName.light,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ...
              Text(
                'Ujian Dimulai',
                style: TextStyle(
                  fontSize: 20,
                  color: ColorName.primary,
                  fontWeight: FontWeight.w900
                ),
              ),
              // Tombol Mulai
              ElevatedButton(
                onPressed: () {
                  // Aksi logout
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CbtScreen()));
                },
                child: Text('Mulai Ujian'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}