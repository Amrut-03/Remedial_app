import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Computer Dept/Sem.dart';
import '../Screens/floating_bar.dart';

class Semester_7 extends StatefulWidget {
  const Semester_7({super.key});

  @override
  State<Semester_7> createState() => _Semester_7State();
}

class _Semester_7State extends State<Semester_7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Sem(assets: Image.asset("images/Backgrounds/mech.png",),
        //   branch: 'Mechanical Engineering',
        //   clr: Colors.white, sub1: '', sub2: '', sub3: '',
        //   sub4: '', sub5: '' ,Top: 140, Bottom: 20,Left: 45,Right: 20,),
    );
  }
}
