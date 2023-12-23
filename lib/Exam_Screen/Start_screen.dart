import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class start_Screen extends StatefulWidget {
  const start_Screen({super.key, });
  @override
  State<start_Screen> createState() => _start_ScreenState();
}

class _start_ScreenState extends State<start_Screen> {
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
