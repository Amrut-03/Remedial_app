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
