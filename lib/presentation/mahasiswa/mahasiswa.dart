import 'package:cbt_app/common/constants/colors.dart';
import 'package:cbt_app/common/constants/icons.dart';
import 'package:cbt_app/common/widgets/svg_icon.dart';
import 'package:cbt_app/presentation/mahasiswa/pengujian/pengujian_mhs_page.dart';
import 'package:cbt_app/presentation/profile/profile_page.dart';
import 'package:cbt_app/presentation/mahasiswa/dashboard_mhs_page.dart';
import 'package:flutter/material.dart';

class MahasiswaPage extends StatefulWidget {
  const MahasiswaPage({super.key});

  @override
  State<MahasiswaPage> createState() => _MahasiswaPageState();
}

class _MahasiswaPageState extends State<MahasiswaPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = const [
    DashboardMhsPage(),
    PengujianMhsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
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
                    label: 'Dashboard'),
                BottomNavigationBarItem(
                    icon: SvgIcon(
                      iconUrl: IconName.chart,
                      height: 20,
                      color: _selectedIndex == 1
                          ? Colors.white
                          : Colors.grey.withOpacity(0.8),
                    ),
                    label: 'Pengujian'),
                BottomNavigationBarItem(
                    icon: SvgIcon(
                      iconUrl: IconName.profile,
                      height: 20,
                      color: _selectedIndex == 3
                          ? Colors.white
                          : Colors.grey.withOpacity(0.8),
                    ),
                    label: 'Profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
