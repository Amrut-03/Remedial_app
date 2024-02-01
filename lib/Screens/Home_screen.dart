import 'package:Remedial_App/Branches/Civil.dart';
import 'package:Remedial_App/Branches/Computer.dart';
import 'package:Remedial_App/Branches/Electrical.dart';
import 'package:Remedial_App/Branches/Mechanical.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class Home_Screen extends StatefulWidget {
  Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

var data;

class _Home_ScreenState extends State<Home_Screen> {
  bool isLoding = true;
  bool is_image = true;

  get_user_data({required String docId}) async {
    setState(() {
      isLoding = true;
    });
    data =
        await FirebaseFirestore.instance.collection("users").doc(docId).get();
    setState(() {
      isLoding = false;
    });
    user_image();
  }

  user_image() {
    if (data['gender'] == "Male") {
      setState(() {
        is_image = false;
      });
    }
  }

  CarouselController carouselController = CarouselController();

  String email = FirebaseAuth.instance.currentUser!.email.toString();

  @override
  void initState() {
    get_user_data(docId: email);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Stack(children: [
        Column(children: [
          if (isLoding)
            Shimmer.fromColors(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 30.h, bottom: 20.h, left: 20.w, right: 10.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    shimmer_padding(
                        right: 10.w,
                        left: 10.w,
                        top: 10.h,
                        bottom: 0.h,
                        height: 130.h,
                        width: 350.w),
                    SizedBox(
                      height: 30,
                    ),
                    shimmer_padding(
                        right: 10.w,
                        left: 20.w,
                        top: 0.h,
                        bottom: 0.h,
                        height: 50.h,
                        width: 370.w),
                    SizedBox(
                      height: 20,
                    ),
                    shimmer_padding(
                        right: 10.w,
                        left: 10.w,
                        top: 10.h,
                        bottom: 10.w,
                        height: 170.h,
                        width: 350.w),
                    SizedBox(
                      height: 30,
                    ),
                    shimmer_padding(
                        right: 20.w,
                        left: 30.w,
                        top: 0.h,
                        bottom: 0.h,
                        height: 100.h,
                        width: 350.w),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              highlightColor: Colors.grey.shade100,
              baseColor: Colors.grey.shade500,
            )
          else
            Visibility(
              visible: !isLoding,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 30.h, bottom: 20.h, left: 10.w, right: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                      child: Container(
                        height: 130.h,
                        width: 350.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0.h),
                              child: Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r)),
                                ),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r)),
                                  child: is_image
                                      ? Image.asset(
                                          "images/icons/female_profile.png",
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          "images/icons/male_profile.png",
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.h),
                              child: Container(
                                height: 100.h,
                                width: 205.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: isLoding
                                          ? Text(" ")
                                          : Text(
                                              "Name: " + data["name"],
                                              style: GoogleFonts.roboto(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.w),
                                      child: Text(
                                        "Department:" + data["department"],
                                        style: GoogleFonts.roboto(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      margin: EdgeInsets.all(5.w),
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: 55.w, left: 55.w, top: 10.h, bottom: 10.h),
                        child: Text(
                          "WelCome For Preparation",
                          style: GoogleFonts.roboto(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 200.h,
                      width: 350.w,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: CarouselSlider(
                        items: [
                          // Text("Physics Test is Currently Available"),
                          Image.asset("images/icons/quize.png",
                              fit: BoxFit.cover),
                          Image.asset("images/icons/quize1.png",
                              fit: BoxFit.cover),
                          Image.asset("images/icons/quize2.png",
                              fit: BoxFit.cover),
                          Image.asset("images/icons/quize3.png",
                              fit: BoxFit.contain),
                          Image.asset("images/icons/quize4.png",
                              fit: BoxFit.cover),
                        ],
                        options: CarouselOptions(
                          height: 170.h,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                        carouselController: carouselController,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: InkWell(
                        onTap: () {
                          if (data['department'] ==
                              'Computer Science Engineering') {
                            Navigator.push(
                                context,
                                PageTransition(
                                  child: Computer(),
                                  type: PageTransitionType.bottomToTop,
                                  duration: Duration(milliseconds: 400),
                                ));
                          } else if (data['department'] ==
                              'Mechanical Engineering') {
                            Navigator.push(
                                context,
                                PageTransition(
                                  child: Mechanical(),
                                  type: PageTransitionType.bottomToTop,
                                  duration: Duration(milliseconds: 400),
                                ));
                          } else if (data['department'] ==
                              'Electrical Engineering') {
                            Navigator.push(
                                context,
                                PageTransition(
                                  child: Electrical(),
                                  type: PageTransitionType.bottomToTop,
                                  duration: Duration(milliseconds: 400),
                                ));
                          } else if (data['department'] ==
                              'Civil Engineering') {
                            Navigator.push(
                                context,
                                PageTransition(
                                  child: Civil(),
                                  type: PageTransitionType.bottomToTop,
                                  duration: Duration(milliseconds: 400),
                                ));
                          } else {
                            Text(
                              "Insert your branch details in your Profile page",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                                color: Colors.white,
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 100,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 30.w, right: 20.w),
                            child: Center(
                              child: Text(
                                data['department'],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ]),
      ]),
    );
  }

  Padding shimmer_padding(
      {required double height,
      required double width,
      required double right,
      required double left,
      required double top,
      required double bottom}) {
    return Padding(
      padding: EdgeInsets.only(right: right, top: top, bottom: bottom),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
        ),
      ),
    );
  }
}
