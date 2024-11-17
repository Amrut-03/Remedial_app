import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:Remedial_App/Pages/ResultScreens/overall_result.dart';
import 'package:Remedial_App/models/exam_model.dart';

class ResultPage extends StatefulWidget {
  final marks;
  List<QuestionModel> questionModel;
  ResultPage({
    Key? key,
    required this.questionModel,
    this.marks,
  }) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool is_loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        is_loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Center(
          child: Container(
            height: 500.h,
            width: 300.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                is_loading
                    ? Lottie.asset('images/lottie/checking.json')
                    : Text(
                        widget.marks.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 100.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                if (!is_loading)
                  if (widget.marks <= 10)
                    Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Text(
                        "You have to needed more Practice and More Study.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      ),
                    )
                  else if (widget.marks > 10 && widget.marks <= 15)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Text(
                          "You have to needed more Practice to ace good score",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    )
                  else if (widget.marks > 15 && widget.marks <= 20)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Text(
                          "You have to needed Practice to ace Excellent score\n"
                          "Best Luck for the Interviews.👍",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    )
                  else if (widget.marks > 20 && widget.marks <= 30)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Text(
                          "You are Passed in Test with high score,\n"
                          "Best Luck for the Interviews.👍",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                SizedBox(
                  height: 30,
                ),
                if (is_loading == false)
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100, 50),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OverallResult(
                                      questionModel: widget.questionModel,
                                    )));
                      },
                      child: Text(
                        'see result',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ))
                else
                  Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
