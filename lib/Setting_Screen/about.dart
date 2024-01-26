import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "About",
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: 700,
              width: 370,
              color: Colors.black,
              // decoration: BoxDecoration(
              //     color: Colors.black, borderRadius: BorderRadius.circular(30)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text_reuse(
                        text: 'Remedial Exam App',
                        size: 25,
                      ),
                      text_reuse(
                        text:
                            'I am developed an app to assist our university students in preparing for Remedial Exams. '
                            '📚 Remedial Exams are conducted for students with backlogs in any branch, '
                            'featuring multiple-choice questions (MCQs) based on their backlog subjects. '
                            'The passing criteria is 20 marks out of 50. 📝 This exam is exclusively conducted by our university, '
                            'Dr. Babasaheb Ambedkar Technological University, Lonere. 🏛️',
                        size: 20,
                      ),
                      Divider(
                        color: Colors.white,
                        indent: 10,
                        endIndent: 10,
                      ),
                      text_reuse(
                        text: 'Contact Information',
                        size: 25,
                      ),
                      text_reuse(
                        text: 'Email - amrutkhochikar@gmail.com\n'
                            'Mob No. - 9172518904',
                        size: 20,
                      ),
                      //Divider(color: Colors.white,indent: 10,endIndent: 10,),
                      text_reuse(
                        text:
                            'LinkedIn - https://www.linkedin.com/in/amrut-khochikar/\n'
                            'Whatsapp No. - 9172518904',
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class text_reuse extends StatelessWidget {
  final String text;
  final double size;
  const text_reuse({
    super.key,
    required this.text,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: size,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
