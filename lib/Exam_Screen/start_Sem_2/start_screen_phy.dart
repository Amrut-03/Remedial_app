import 'package:Remedial_App/Exam_Screen/sem2_physics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class start_screen_phy extends StatelessWidget {
  const start_screen_phy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height : double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ExamPhysics(sem_num: 'sem2',subject: 'physics' ,)));
          },
          child: Center(
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Start Test",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
          ),
            )
        ),
    );
  }
}
