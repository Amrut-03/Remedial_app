import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../../Screens/rules.dart';
import '../exam_interface.dart';

class start_screen_m2 extends StatefulWidget {
  const start_screen_m2({
    super.key,
  });

  @override
  State<start_screen_m2> createState() => _start_screen_m2State();
}

class _start_screen_m2State extends State<start_screen_m2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          rules(),
          SizedBox(height: 30),
          ElevatedButton(onPressed: (){
            Navigator.push(
                context,
                PageTransition(
                    child: ExamInterface(subject: 'm2', sem_num: 'sem2'),
                    type: PageTransitionType.leftToRight));
          },style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
          ),child: Text("Submit",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),),
        ],
      ),
    );
  }
}
