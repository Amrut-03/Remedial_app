import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dash_bar.dart';
import 'Sem.dart';

class Semester_4 extends StatefulWidget {
  const Semester_4({super.key});

  @override
  State<Semester_4> createState() => _Semester_4State();
}

class _Semester_4State extends State<Semester_4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Sem(assets: Image.asset("images/Backgrounds/back1.png",),
        //   branch: 'Computer Science and Engineering',
        //   clr: Colors.black, sub1: 'Mathematics 4', sub2: 'Design Algorithm and Analysis', sub3: 'Operating System',
        //   sub4: 'Basic Human Rights', sub5: 'Digital Logic and Design Microprocessor',Top: 80,Bottom: 40,Left: 20,Right: 20,),
    );
  }
}
