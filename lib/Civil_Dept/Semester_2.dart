import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Branches/Computer.dart';
import '../Computer Dept/Sem.dart';
import '../dash_bar.dart';

class Semester_2 extends StatefulWidget {
  const Semester_2({super.key});

  @override
  State<Semester_2> createState() => _Semester_2State();
}

class _Semester_2State extends State<Semester_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Sem(assets: Image.asset("images/Backgrounds/civil.png",),
      //   branch: 'Civil Engineering',
      //   clr: Colors.white, sub1: '', sub2: '', sub3: '',
      //   sub4: '', sub5: '' ,Top: 20, Bottom: 40,Left: 120,Right: 20,),
    );
  }
}
