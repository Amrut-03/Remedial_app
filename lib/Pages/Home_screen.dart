import 'package:Remedial_App/Pages/Advertises/advertise_services.dart';
import 'package:Remedial_App/Pages/ListOfTopicsSubjects/CSSubjects.dart';
import 'package:Remedial_App/Pages/ListOfTopicsSubjects/aptiTopics.dart';
import 'package:Remedial_App/Pages/ProfileScreens/profile.dart';
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
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(children: [
            if (isLoding)
              Shimmer.fromColors(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 20.h, bottom: 20.h, left: 20.w, right: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      shimmer_padding(
                          right: 10.w,
                          left: 10.w,
                          top: 10.h,
                          bottom: 0.h,
                          height: 130.h,
                          width: 350.w),
                      SizedBox(
                        height: 15.h,
                      ),
                      shimmer_padding(
                          right: 10.w,
                          left: 20.w,
                          top: 0.h,
                          bottom: 0.h,
                          height: 50.h,
                          width: 370.w),
                      SizedBox(
                        height: 20.h,
                      ),
                      shimmer_padding(
                          right: 10.w,
                          left: 10.w,
                          top: 10.h,
                          bottom: 10.w,
                          height: 170.h,
                          width: 350.w),
                      SizedBox(
                        height: 20.h,
                      ),
                      shimmer_padding(
                          right: 20.w,
                          left: 30.w,
                          top: 0.h,
                          bottom: 0.h,
                          height: 100.h,
                          width: 350.w),
                      SizedBox(
                        height: 20.h,
                      ),
                      // shimmer_padding(
                      //     right: 20.w,
                      //     left: 30.w,
                      //     top: 0.h,
                      //     bottom: 0.h,
                      //     height: 50.h,
                      //     width: 350.w),
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
                        height: 30.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.white,
                              content: Text(
                                'Double tap on Profile Photo.',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              )));
                        },
                        onDoubleTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => profilePage()));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 10.h, left: 10.w, right: 10.w),
                          child: Container(
                            height: 130.h,
                            width: 350.w,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r)),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.r)),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.r)),
                                        child: (data['profile_url'] == null)
                                            ? Image.asset(
                                                "images/icons/male_profile.png",
                                                fit: BoxFit.cover,
                                              )
                                            : Image.network(data['profile_url'],
                                                fit: BoxFit.cover)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.h),
                                  child: Container(
                                    height: 100.h,
                                    width: 205.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.r)),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(5.w),
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
                                            data['department'] != null
                                                ? "Department:" +
                                                    data["department"]
                                                : '',
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
                      ),
                      SizedBox(height: 10.h),
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
                          child: FutureBuilder(
                            future: AdvertiseServices.fetchData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return CarouselSlider(
                                  items: [
                                    Container(
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            snapshot.data!.data![1].urlimage
                                                .toString(),
                                            fit: BoxFit.cover,
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20.w,
                                                  right: 20.w,
                                                  top: 120.h),
                                              child: Text(
                                                snapshot.data!.data![1].subtitle
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            snapshot.data!.data![0].urlimage
                                                .toString(),
                                            fit: BoxFit.cover,
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 120.h),
                                              child: Text(
                                                snapshot.data!.data![0].subtitle
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            snapshot.data!.data![2].urlimage
                                                .toString(),
                                            fit: BoxFit.cover,
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                top: 20.h,
                                                right: 20.w,
                                                left: 170.w,
                                              ),
                                              child: Text(
                                                snapshot.data!.data![2].subtitle
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                    //
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
                                        Duration(milliseconds: 1000),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                  carouselController: carouselController,
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          )),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                  child: CssubjectsList(),
                                  type: PageTransitionType.bottomToTop,
                                  duration: Duration(milliseconds: 400),
                                ));
                          },
                          child: Container(
                            height: 100.h,
                            width: 350.w,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r)),
                            ),
                            child: Center(
                              child: Text(
                                "Computer Science Fundamentals",
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
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                  child: AptitopicsList(),
                                  type: PageTransitionType.bottomToTop,
                                  duration: Duration(milliseconds: 400),
                                ));
                          },
                          child: Container(
                            height: 100.h,
                            width: 350.w,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r)),
                            ),
                            child: Center(
                              child: Text(
                                "Aptitude Tests",
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
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
          ]),
        ]),
      ),
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
