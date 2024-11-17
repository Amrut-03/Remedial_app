import 'package:Remedial_App/Pages/Home_screen.dart';
import 'package:Remedial_App/Pages/ProfileScreens/profile.dart';
import 'package:Remedial_App/Pages/SettingScreens/setting_screen.dart';
import 'package:Remedial_App/Pages/notes_screen/notesScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List pages = [Home_Screen(), profilePage(), setting(), NotesInterface()];

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
          Icon(Icons.menu_book_sharp, color: Colors.white),
        ],
      ),
      body: pages[current_page_index],
    );
  }
}
