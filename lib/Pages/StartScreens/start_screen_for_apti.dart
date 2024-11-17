import 'package:Remedial_App/Pages/TestsScreen/aptitude_interface.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../../Widgets/rules.dart';

class Aptistart_screen extends StatefulWidget {
  final String topicname;
  final int length;
  const Aptistart_screen({
    super.key,
    required this.topicname,
    required this.length,
  });

  @override
  State<Aptistart_screen> createState() => _Aptistart_screenState();
}

class _Aptistart_screenState extends State<Aptistart_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          rules(),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: AptitudeInterface(
                        topic: widget.topicname,
                      ),
                      type: PageTransitionType.leftToRight));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            child: Text(
              "Submit",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
