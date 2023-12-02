import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/common/constants/themes.dart';
import 'package:cbt_app/presentation/dosen/pages/pengujian_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart'; // Import bloc yang ingin Anda gunakan

class CustomDrawer extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;
  final Function(int) onTap;
  const CustomDrawer({Key? key, required this.zoomDrawerController, required this.onTap}) : super(key: key);

// Ganti dengan instance Bloc Anda
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        // color: Color(0xFFCED3ED)
        color: ColorName.white
      ),
      padding: EdgeInsets.only(left: 10),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: Colors.black),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 10, left: 40),
                        child: CircleAvatar(
                          child: Image.asset(
                            'assets/images/logo2.png',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                          radius: 40,
                        ),
                      ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Text(
                      '60900120025',
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorName.primary
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                        Expanded(
                          child: ListView(
                            children: [
                              ExpansionTile(
                                title: Text(
                                  'Pengujian',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorName.primary
                                  ),
                                ),
                                children: <Widget>[
                                  ListTile(
                                    title: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add),
                                        Text(
                                          'Jaringan',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorName.primary
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      onTap(0);
                                      Navigator.pushReplacement(context, 
                                        MaterialPageRoute(builder: (context) => PengujianPage()));      
                                    },
                                  ),
                                  ListTile(
                                    title: Row(
                                      children: [
                                        Icon(Icons.add),
                                        Text(
                                          'Jaringan',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorName.primary
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                                  
                                    },
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(
                                  'Pengajuan',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorName.primary
                                  ),
                                ),
                                children: <Widget>[
                                  ListTile(
                                    title: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add),
                                        Text(
                                          'Jaringan',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorName.primary
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                                  
                                    },
                                  ),
                                  ListTile(
                                    title: Row(
                                      children: [
                                        Icon(Icons.add),
                                        Text(
                                          'Jaringan',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorName.primary
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                                  
                                    },
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(
                                  'Hasil Ujian',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorName.primary
                                  ),
                                ),
                                children: <Widget>[
                                  ListTile(
                                    title: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add),
                                        Text(
                                          'Jaringan',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorName.primary
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                                  
                                    },
                                  ),
                                  ListTile(
                                    title: Row(
                                      children: [
                                        Icon(Icons.add),
                                        Text(
                                          'Jaringan',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorName.primary
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                                  
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                  // SizedBox(height: 10,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
