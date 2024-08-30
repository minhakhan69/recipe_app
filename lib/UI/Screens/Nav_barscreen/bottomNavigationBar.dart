import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:cook_together/UI/Screens/create_screen/create_screen.dart';
import 'package:cook_together/UI/Screens/home_screen/home_screen.dart';
import 'package:cook_together/UI/Screens/profile_screen/profile_screen.dart';
import 'package:cook_together/UI/Screens/setting_screen/settin_screen.dart';
import 'package:flutter/material.dart';

import '../search_screen/search_screen.dart';

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({super.key});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  int Selectedindex = 0;
  List<Widget> Screens = [
    HomeScreen(),
    SearchScreen(),
    CreateScreen(),
    SettinScreen(),
    ProfileScreen(),


  ];
  List<TabItem> items = [
    TabItem(
      icon: Icons.home,
      // title: 'Home',
    ),
    TabItem(
      icon: Icons.search_sharp,
      title: 'Search',
    ),
    TabItem(
      icon: Icons.favorite_border,
      title: 'favorite',
    ),
    TabItem(
      icon: Icons.settings,
      title: 'settings',
    ),
    TabItem(
      icon: Icons.account_box,
      title: 'profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[Selectedindex],
      bottomNavigationBar: Container(
        child: BottomBarInspiredOutside(
          animated: true,
          itemStyle: ItemStyle.circle,
          isAnimated: true,
          chipStyle: ChipStyle(
            notchSmoothness: NotchSmoothness.sharpEdge,
            background: Colors.pink,
          ),
          items: items,
          backgroundColor: Colors.pink,
          indexSelected: Selectedindex,
          color: Colors.black,
          colorSelected: Colors.white,
          onTap: (int index) => setState(() {
            Selectedindex = index;
          }),
        ),
      ),
    );
  }
}
