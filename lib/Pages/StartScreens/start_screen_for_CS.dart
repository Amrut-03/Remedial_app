import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../../Widgets/rules.dart';
import '../TestsScreen/CSfundamental_interface.dart';

class CS_start_screen extends StatefulWidget {
  final String subjectName;
  const CS_start_screen({
    super.key,
    required this.subjectName,
  });

  @override
  State<CS_start_screen> createState() => _CS_start_screenState();
}

class _CS_start_screenState extends State<CS_start_screen> {
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
                      child: CSFundamentalInterface(
                        subject: widget.subjectName,
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
