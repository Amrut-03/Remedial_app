import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../../Screens/rules.dart';
import '../exam_interface.dart';

class start_screen_dm extends StatefulWidget {
  const start_screen_dm({
    super.key,
  });

  @override
  State<start_screen_dm> createState() => _start_screen_dmState();
}

class _start_screen_dmState extends State<start_screen_dm> {
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
                    child: ExamInterface(subject: 'dm', sem_num: 'sem3'),
                    type: PageTransitionType.leftToRight));
          },style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
          ),child: Text("Submit",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),),
        ],
      ),
    );
  }
}
