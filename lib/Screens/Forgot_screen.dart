import 'package:Remedial_App/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class Forgot_screen extends StatefulWidget {
  const Forgot_screen({super.key});

  @override
  State<Forgot_screen> createState() => _Forgot_screenState();
}

class _Forgot_screenState extends State<Forgot_screen> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
            body: Stack(
              alignment: Alignment.center,
              children:[
                Container(
                  color: Colors.black,
                  height: 1000.h,
                  width: 500.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children:[
                      SizedBox(height: 150.h,
                        width: 200.w,
                        child: RiveAnimation.asset("images/RiveAssets/lock.riv"),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10.w,right: 10.w,bottom: 10.h),
                        child: Text("Enter Your Details",style: GoogleFonts.poppins(
                          fontSize: 35.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        ),
                      ),
                  SizedBox(height: 20.h,),
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r),topRight: Radius.circular(30.r),),
                        ),
                        child: Padding(padding: EdgeInsets.only(top: 50.h,right: 15.w,left: 15.w,),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                                  boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(150, 110, 250,3),
                                    blurRadius: 20.r,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 350,
                                      padding: EdgeInsets.all(10.w),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText:"Enter Your email",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                                            borderSide: BorderSide(
                                              color: Colors.black
                                            ),
                                          ),
                                          prefixIcon: Icon(Icons.mail,color: Colors.black,)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              Text("OR",style: TextStyle(color: Colors.grey[600]),),
                              SizedBox(height: 10.h,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                                  boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(150, 110, 250,3),
                                    blurRadius: 20.r,
                                  ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 350,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText:"Enter Phone Number",
                                            hintStyle: TextStyle(color: Colors.grey),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10.r)),
                                              borderSide: BorderSide(
                                                  color: Colors.black
                                              ),
                                            ),
                                            prefixIcon: Icon(Icons.phone,color: Colors.black,)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40.h,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>login_page()));
                                },
                                child: Container(
                                  height: 50.h,
                                  width: 400.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                                      color: Colors.black,
                                      border: Border.all(
                                          color: Colors.white
                                      ),
                                      boxShadow: [BoxShadow(
                                        color: Colors.deepPurpleAccent,
                                        spreadRadius: 2.r,
                                        blurRadius: 6.r,
                                      )]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Submit",textAlign: TextAlign.center,style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25.sp,
                                        color: Colors.white
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ),
                    ]
                  )
                )
                ],
              ),
    );
  }
}
