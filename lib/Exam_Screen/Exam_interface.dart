

import 'package:Remedial_App/Computer%20Dept/Sem_1_sub/M_1.dart';
import 'package:flutter/material.dart';

import '../Computer Dept/Sem_2_sub/M_2.dart';

class Exam_interface extends StatefulWidget {
  final String path;
  const Exam_interface({super.key, required this.path,});

  @override
  State<Exam_interface> createState() => _Exam_interfaceState();
}

class _Exam_interfaceState extends State<Exam_interface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
      ),
    );
  }
}
