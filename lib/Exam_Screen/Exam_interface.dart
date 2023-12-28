import 'package:Remedial_App/Computer%20Dept/Sem_2_sub/question_physics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Exam_interface extends StatefulWidget {
  const Exam_interface({super.key});

  @override
  State<Exam_interface> createState() => _Exam_interfaceState();
}

class _Exam_interfaceState extends State<Exam_interface> {
  bool isPressedA = false;
  bool isPressedB = false;
  bool isPressedC = false;
  bool isPressedD = false;

  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = question_data[currentQuestionIndex];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              height: 50,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(currentQuestion.num,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),),
                    Text("/50",style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),),
                  ],
                ),
              ),
            ),),

            Padding(
              padding:EdgeInsets.all(5.h),
              child: Container(
                height: 150.h,
                width: 350.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.r),),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.w,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.h),
                  child: Text(currentQuestion.questions,
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),
            Padding(
              padding:EdgeInsets.all(5.h),
              child: Container(
                height: 60.h,
                width: 350.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.w,
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.h),
                      child: Text("A) ",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.h),
                      child: Text(currentQuestion.options[0],style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),),
                    ),
                    Padding(
                      padding:EdgeInsets.all(5.h),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            isPressedA = true;
                            isPressedD =false;
                            isPressedC = false;
                            isPressedB = false;
                          });
                        },
                        child: Ink(
                          child: Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color : isPressedA ? Colors.black:Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.black,
                              )
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:EdgeInsets.all(5.h),
              child: Container(
                height: 60.h,
                width: 350.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.w,
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.h),
                      child: Text("B) ",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.h),
                      child: Text(currentQuestion.options[1],style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),),
                    ),
                    Padding(
                      padding:EdgeInsets.all(5.h),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            isPressedA = false;
                            isPressedD =false;
                            isPressedC = false;
                            isPressedB = true;
                          });
                        },
                        child: Ink(
                          child: Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color : isPressedB ? Colors.black:Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.black,
                                )
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:EdgeInsets.all(5.h),
              child: Container(
                height: 60.h,
                width: 350.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.w,
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.h),
                      child: Text("C) ",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.h),
                      child: Text(currentQuestion.options[2],style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),),
                    ),
                    Padding(
                      padding:EdgeInsets.all(5.h),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            isPressedA = false;
                            isPressedD =false;
                            isPressedC = true;
                            isPressedB = false;
                          });
                        },
                        child: Ink(
                          child: Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color : isPressedC ? Colors.black:Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.black,
                                )
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:EdgeInsets.all(5.h),
              child: Container(
                height: 60.h,
                width: 350.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.w,
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.h),
                      child: Text("D) ",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.h),
                      child: Text(currentQuestion.options[3],style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),),
                    ),
                    Padding(
                      padding:EdgeInsets.all(5.h),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            isPressedA = false;
                            isPressedD =true;
                            isPressedC = false;
                            isPressedB = false;
                          });
                        },
                        child: Ink(
                          child: Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color : isPressedD ? Colors.black:Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.black,
                                )
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      if (currentQuestionIndex > 0) {
                        setState(() {
                          currentQuestionIndex--;
                          isPressedA = isPressedB = isPressedC = isPressedD = false;
                        });
                      }
                    },
                      child: Container(
                        height: 60.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(20.r)),
                            border: Border.all(
                              width: 2.w,
                            )
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Row(
                            children: [
                              Icon(Icons.navigate_before,color: Colors.white,),
                              Text("previous",textAlign: TextAlign.center,style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                          if (currentQuestionIndex < question_data.length - 1) {
                            setState(() {
                              currentQuestionIndex++;
                              isPressedA = isPressedB = isPressedC =
                                  isPressedD = false;

                            });
                          }
                      },
                        child: Container(
                          height: 60.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(20.r)),
                              border: Border.all(
                                width: 2.w,
                              )
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 45.w),
                            child: Row(
                              children: [
                                Text("Next",textAlign: TextAlign.center,style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                ),),
                                Icon(Icons.navigate_next,color: Colors.white,),
                              ],
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
