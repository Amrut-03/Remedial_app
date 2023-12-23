import 'package:flutter/material.dart';
import '../Computer Dept/Sem.dart';
class Semester_1 extends StatefulWidget {
  const Semester_1({super.key});

  @override
  State<Semester_1> createState() => _Semester_1State();
}

class _Semester_1State extends State<Semester_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Sem(assets: Image.asset("images/Backgrounds/ele.png",),
      //   branch: 'Electrical Engineering',
      //   clr: Colors.white, sub1: '', sub2: '', sub3: '',
      //   sub4: '', sub5: '', Top: 140,Bottom: 20,Left: 60,Right: 20,),
    );
  }
}

