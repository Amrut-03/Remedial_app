import 'package:Remedial_App/Computer%20Dept/Sem_1_sub/M_1.dart';
import 'package:Remedial_App/Exam_Screen/Start_screen.dart';
import 'package:Remedial_App/dash_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Branches/Computer.dart';
import 'Sem.dart';

class Semester_1 extends StatefulWidget {
  const Semester_1({super.key});

  @override
  State<Semester_1> createState() => _Semester_1State();
}

class _Semester_1State extends State<Semester_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Sem(assets: Image.asset("images/Backgrounds/back1.png",),
        branch: 'Computer Science and Engineering',
        clr: Colors.black, sub1: 'Mathematics 1', sub2: 'Chemistry', sub3: 'Mechanics',
        sub4: 'C Programming', sub5: '', Top: 80,Bottom: 40,Left: 20,Right: 20,),
    );
  }
}

