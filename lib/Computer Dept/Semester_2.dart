import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dash_bar.dart';
import 'Sem.dart';

class Semester_2 extends StatefulWidget {
  const Semester_2({super.key});

  @override
  State<Semester_2> createState() => _Semester_2State();
}

class _Semester_2State extends State<Semester_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          // child: Sem(assets: Image.asset("images/Backgrounds/back1.png",),
          //   branch: 'Computer Science and Engineering',
          //   clr: Colors.black, sub1: 'Mathematics 2', sub2: 'Physics', sub3: 'Energy and Environmental Engineering',
          //   sub4: 'Communication Skills', sub5: '',Top: 80,Bottom: 40,Left: 20,Right: 20, path: null,),
        ),
    );
  }
}
