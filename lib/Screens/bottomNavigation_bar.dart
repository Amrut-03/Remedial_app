import 'package:Remedial_App/Branches/Computer.dart';
import 'package:Remedial_App/Screens/Home_screen.dart';
import 'package:Remedial_App/Screens/profile.dart';
import 'package:Remedial_App/Setting_Screen/setting_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List pages = [Home_Screen(), profilePage(), setting(), Computer()];

  int current_page_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      bottomNavigationBar: CurvedNavigationBar(
          animationDuration: Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          backgroundColor: Colors.transparent,
          color: Colors.black,
          onTap: (index) async {
            setState(() {
              current_page_index = index;
            });
          },
          items: [
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.person, color: Colors.white),
            Icon(Icons.settings, color: Colors.white),
          ]),
      body: pages[current_page_index],
    );
  }
}
