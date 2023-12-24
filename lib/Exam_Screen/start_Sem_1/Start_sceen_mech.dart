import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class start_Screen_mech extends StatefulWidget {
  const start_Screen_mech({super.key, });

  @override
  State<start_Screen_mech> createState() => _start_Screen_mechState();
}

class _start_Screen_mechState extends State<start_Screen_mech> {
  late String path;

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
