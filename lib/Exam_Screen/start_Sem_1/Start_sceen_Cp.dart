import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class start_Screen_Cp extends StatefulWidget {
  const start_Screen_Cp({super.key, });

  @override
  State<start_Screen_Cp> createState() => _start_Screen_CpState();
}

class _start_Screen_CpState extends State<start_Screen_Cp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height : double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: InkWell(
            child: Center(
              child: Text(
                "Start Test",
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            )
        ),
      ),
    );
  }
}
