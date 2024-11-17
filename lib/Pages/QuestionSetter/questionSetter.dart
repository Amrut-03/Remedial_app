import 'package:Remedial_App/Pages/QuestionSetter/questionlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Questionsetter extends StatefulWidget {
  final String collectionName;
  final String questionType;
  const Questionsetter({
    super.key,
    required this.collectionName,
    required this.questionType,
  });

  @override
  State<Questionsetter> createState() => _QuestionsetterState();
}

class _QuestionsetterState extends State<Questionsetter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        title: Text(
          'Admin Account',
          style: GoogleFonts.poppins(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: MyWidget(
              length: widget.questionType == "Aptitude" ? 20 : 30,
              collectionName: widget.collectionName,
            ),
          ),
        ),
      ),
    );
  }
}
