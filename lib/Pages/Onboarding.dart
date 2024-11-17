import 'dart:ui';
import 'package:Remedial_App/Pages/Auth_Screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              RiveAnimation.asset("images/icons/msg.riv"),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.w, sigmaY: 10.h),
                  child: SizedBox(),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 50.h),
                        SizedBox(
                          width: 260.w,
                          child: Column(
                            children: [
                              Text(
                                "Get Ready for Prepare",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 45.sp),
                              ),
                              SizedBox(height: 30.h),
                              Text(
                                  " It provides a range of questions, "
                                  "adapts to individual Preparation needs, "
                                  "and includes time-based simulations for realistic exam preparation. "
                                  "Boost your confidence and improve your performance with this convenient and efficient study tool."
                                  "Finally you can able to give Remedial exam and clear that easily",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 110.h, width: 100.w),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  minimumSize: Size(200.w, 50.h),
                                  shadowColor: Colors.deepPurpleAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.r),
                                        topRight: Radius.circular(45.r),
                                        bottomRight: Radius.circular(10.r),
                                        bottomLeft: Radius.circular(45.r)),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => login_page()));
                                },
                                child: Text(
                                  "Get Start ➔",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
