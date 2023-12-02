import 'package:cbt_app/common/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorName.light,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Informasi profil dosen (jika ada)
              // ...
        
              // Tombol Logout
              ElevatedButton(
                onPressed: () {
                  // Aksi logout
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
