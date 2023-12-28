import 'package:Remedial_App/Branches/Civil.dart';
import 'package:Remedial_App/Branches/Computer.dart';
import 'package:Remedial_App/Branches/Electrical.dart';
import 'package:Remedial_App/Branches/Mechanical.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../dash_bar.dart';
import 'package:carousel_slider/carousel_controller.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  bool isLoding = true;
  CarouselController carouselController = CarouselController();
  @override

  void initState() {
    Future.delayed(Duration(seconds: 2),(){
      setState(() {
        isLoding = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children:[
              Visibility(visible: !isLoding,
                child: Padding(
                  padding: EdgeInsets.only(top: 30.h,bottom: 20.h,left: 10.w,right: 10.w),
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.h),
                    child: Container(
                      height: 150.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        boxShadow: [BoxShadow(
                          color: Colors.deepPurpleAccent,
                          blurRadius: 6.r,
                          spreadRadius: 2.r,
                        )]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:EdgeInsets.all(8.0.h),
                            child: Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                                boxShadow: [BoxShadow(
                                  color: Colors.deepPurpleAccent,
                                  blurRadius: 6.r,
                                  spreadRadius: 2.r,
                                )]
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                                  child: Image.asset("images/icons/profile.png",)
                              )
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(10.h),
                          child: Container(
                            height: 100.h,
                            width: 200.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10.r)),
                              boxShadow: [BoxShadow(
                                color: Colors.deepPurpleAccent,
                                blurRadius: 6.r,
                                spreadRadius: 2.r,
                              )]
                            ),
                            child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
                                    child: Text("Name: Amrut Khochikar",style: GoogleFonts.roboto(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                                    child: Text("Branch: Computer Science and Engineering",style: GoogleFonts.roboto(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Padding(
                      padding: EdgeInsets.only(right: 55,left: 55,top: 10,bottom: 10),
                      child: Text("WelCome For Preparation",style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black,
                        boxShadow: [BoxShadow(
                            spreadRadius: 2,
                            color: Colors.deepPurpleAccent,
                            blurRadius: 6
                        )]
                    ),
                  ),
                  Container(
                    height: 180,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CarouselSlider(
                      items: [
                        Image.asset("images/icons/quize.png", fit: BoxFit.cover),
                        Image.asset("images/icons/quize1.png", fit: BoxFit.cover),
                        Image.asset("images/icons/quize2.png", fit: BoxFit.cover),
                        Image.asset("images/icons/quize3.png", fit: BoxFit.contain),
                        Image.asset("images/icons/quize4.png", fit: BoxFit.cover),
                      ],
                      options: CarouselOptions(
                        height: 170,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      carouselController: carouselController,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10),
                    child: Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.black,
                          boxShadow: [BoxShadow(
                              color: Colors.deepPurpleAccent,
                              spreadRadius: 2,
                              blurRadius: 6
                          )]
                      ),
                      child: Center(
                        child: Text(
                          "Choose your Branch",style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 25
                        ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Computer()));
                              },
                              child: Container(
                                height: 80,
                                width: 170,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                    boxShadow: [BoxShadow(
                                        color: Colors.deepPurpleAccent,
                                        spreadRadius: 2,
                                        blurRadius: 6
                                    )]
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30,right: 20),
                                    child: Text("Computer Engineering",style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Mechanical()));
                              },
                              child: Container(
                                height: 80,
                                width: 170,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  boxShadow: [BoxShadow(
                                    color: Colors.deepPurpleAccent,
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                  )]
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30,right: 20),
                                    child: Text("Mechanical Engineering",style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Civil()));
                                },
                                  child: Container(
                                    height: 80,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      boxShadow: [BoxShadow(
                                        color: Colors.deepPurpleAccent,
                                        spreadRadius: 2,
                                        blurRadius: 6
                                      )]
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 30,right: 20),
                                        child: Text("Civil Engineering",style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),),
                                      ),
                                    ),
                                  ),
                                ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Electrical()));
                                },
                                child: Container(
                                  height: 80,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                      boxShadow: [BoxShadow(
                                          color: Colors.deepPurpleAccent,
                                          spreadRadius: 2,
                                          blurRadius: 6
                                      )]
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 30,right: 20),
                                      child: Text("Electrical Engineering",style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  )
                ],
                            ),
                      ),
              ),
              if(isLoding)
              Shimmer.fromColors(child:
              Padding(
                padding: EdgeInsets.only(top: 30.h,bottom: 10.h,left: 10.w,right: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: 150.h,
                        width: 400.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20,left: 15,right: 15),
                    child: Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                      ),
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,bottom: 10),
                          child: Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10,right: 10,bottom: 10),
                          child: Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white
                            ),
                          ),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(left: 20,right: 20),
                    child: Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),
                    ),),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                          child: Container(
                            height: 80,
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                          ),),
                          Padding(padding: EdgeInsets.only(right: 20,top: 10,bottom: 10),
                            child: Container(
                              height: 80,
                              width: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                            ),),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 20,top: 10,bottom: 0),
                          child: Container(
                            height: 80,
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                          ),),
                        Padding(padding: EdgeInsets.only(right: 20,top: 10,bottom: 10),
                          child: Container(
                            height: 80,
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                          ),),
                      ],
                    ),
                  ],
                ),
              ), baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100),
              dash_bar()
    ]
          ),
    ]
      ),
    );
  }
}

