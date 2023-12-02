import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/common/constants/icons.dart';
import 'package:cbt_app/common/constants/themes.dart';
import 'package:cbt_app/common/widgets/circular_button.dart';
import 'package:cbt_app/common/widgets/svg_icon.dart';
import 'package:cbt_app/presentation/dosen/pages/Creat/creat_page.dart';
import 'package:cbt_app/presentation/dosen/pages/dashboard_page.dart';
import 'package:cbt_app/presentation/dosen/pages/pengujian_page.dart';
import 'package:cbt_app/presentation/profile/profile_page.dart';
import 'package:cbt_app/presentation/dosen/widget/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DosenPage extends StatefulWidget {
  const DosenPage({super.key});

  @override
  State<DosenPage> createState() => _DosenPageState();
}

class _DosenPageState extends State<DosenPage> {

  int _selectedIndex = 0;
  

  void _onItemTapped (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

   final ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  final List<Widget> _pages = const [
    const DashboardPage(),
    const PengujianPage(),
    const CreatPage(),
    const ProfilePage()

  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: ZoomDrawer(
        //   controller: zoomDrawerController,
        //   borderRadius: 50.0,
        //   showShadow: true,
        //   angle: 0.0,
        //   style: DrawerStyle.defaultStyle,
        //   menuScreen: CustomDrawer(zoomDrawerController: zoomDrawerController, onTap: ,),
        //   menuBackgroundColor: Color(0xFFCED3ED),
        //   slideWidth: MediaQuery.of(context).size.width * 0.6,
        //   mainScreen: Container(
        //     decoration: BoxDecoration(color: ColorName.primary),
        //     // color: ColorName.primary,
        //     child: SafeArea(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Padding(
        //           padding: const EdgeInsets.all(kMobileScreenPadding),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Transform.translate(
        //                 offset: const Offset(-10, 0),
        //                 child: CircularButton(
        //                   child: const Icon(
        //                     Icons.menu_open, 
        //                     color: Colors.white,
        //                   ),
        //                   onTap: () {
        //                     zoomDrawerController.toggle!();
        //                   },
        //                 )
        //               ),
        //               const SizedBox(height: 10),
        //               Padding(
        //                 padding: const EdgeInsets.symmetric(vertical: 10),
        //                 child: Row(
        //                   children: [
        //                     const Icon(Icons.person_sharp, color: ColorName.white),
        //                     const SizedBox(width: 10,),
        //                     Text(
        //                       'Nur Farid',
        //                       style: TextStyle(
        //                         color: ColorName.white
        //                       ),
        //                     )
        //                     // Builder(
        //                     //   builder: (_) {
        //                     //     final AuthController _auth = Get.find();
        //                     //     final user = _auth.getUser();
        //                     //     String _label = '  Hello mate';
        //                     //     if (user != null) {
        //                     //       _label = '  Hello ${user.displayName}';
        //                     //     }
        //                     //     return Text(_label,
        //                     //         style: kDetailsTS.copyWith(
        //                     //             color: kOnSurfaceTextColor));
        //                     //   },
        //                     // ),
        //                   ],
        //                 ),
        //               ),
        //               const Text('What Do You Want To Improve Today ?',
        //                   style: TextStyle(
        //                      fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white
        //                   )
        //                 ),
        //               const SizedBox(height: 15),
        //             ],
        //           ),
        //         ),
        //         ],
        //       )
        //     ),
        //   )
        // ),


        body: _pages[_selectedIndex],
        bottomNavigationBar: ClipRRect(
          // borderRadius: ,
          child: BottomNavigationBar(
            backgroundColor: ColorName.primary,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: ColorName.primary,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: SvgIcon(
                  iconUrl: IconName.home,
                  height: 20,
                  color: _selectedIndex == 0
                      ? Colors.white
                      : Colors.grey.withOpacity(0.8),
                ),
                label: 'Dashboard'
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(
                  iconUrl: IconName.chart,
                  height: 20,
                  color: _selectedIndex == 1
                      ? Colors.white
                      : Colors.grey.withOpacity(0.8),
                ),
                label: 'Pengujian'
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(
                  iconUrl: IconName.creat,
                  height: 20,
                  color: _selectedIndex == 2
                      ? Colors.white
                      : Colors.grey.withOpacity(0.8),
                ),
                label: 'Mahasiswa'
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(
                  iconUrl: IconName.profile,
                  height: 20,
                  color: _selectedIndex == 3
                      ? Colors.white
                      : Colors.grey.withOpacity(0.8),
                ),
                label: 'Profile'
              ),
            ],
          ),
        ),
      ),
    );
  }
}

