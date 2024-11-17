import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class rules extends StatelessWidget {
  const rules({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Container(
              height: 510.h,
              width: 350.w,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white,
                      width: 2.w
                  )
              ),
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  children: [
                    Text("Rules and Instructions\n",style: GoogleFonts.poppins(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text("1. The examination will comprise of Objective type Multiple Choice Questions (MCQs).\n\n"
                        "2. All questions are compulsory and each carries One mark. \n\n"
                        "3. The Subjects or topics covered in the exam will be as per the Syllabus.\n\n"
                        "4. There will be NO NEGATIVE MARKING for the wrong answers.\n\n"
                        "5. The examination does not require using any paper, pen, pencil and calculator.\n\n"
                        "6. Every student will take the examination on a Smart Phone.\n",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                          color: Colors.white
                      ),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
