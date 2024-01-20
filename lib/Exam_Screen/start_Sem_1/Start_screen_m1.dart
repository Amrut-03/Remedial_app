import 'package:Remedial_App/Exam_Screen/start_Sem_1/exam_m1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class start_Screen_m1 extends StatefulWidget {
  const start_Screen_m1({super.key, });

  @override
  State<start_Screen_m1> createState() => _start_Screen_m1State();
}

class _start_Screen_m1State extends State<start_Screen_m1> {
  late String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ExamM1(sem_num: 'sem2', subject: 'maths',)));
            },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: Text(
                  "Start Test",
                  style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  ),
                  ),
                ),
              )
          ),
        )
    );
  }
}
