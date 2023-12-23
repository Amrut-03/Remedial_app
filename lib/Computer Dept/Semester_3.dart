import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dash_bar.dart';
import 'Sem.dart';

class Semester_3 extends StatefulWidget {
  const Semester_3({super.key});

  @override
  State<Semester_3> createState() => _Semester_3State();
}

class _Semester_3State extends State<Semester_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Sem(assets: Image.asset("images/Backgrounds/back1.png",),
        //   branch: 'Computer Science and Engineering',
        //   clr: Colors.black, sub1: 'Mathematics 3', sub2: 'Data Structures', sub3: 'Discrete Mathematics',
        //   sub4: 'Object-Oriented Programming', sub5: 'Computer Architecture and Organization',Top: 80,Bottom: 40,Left: 20,Right: 20,),
    );
  }
}
