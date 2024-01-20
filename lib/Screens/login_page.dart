import 'package:Remedial_App/Screens/Forgot_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Remedial_App/Screens/new_account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Home_screen.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController email_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  bool is_hide = true;

  user_login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email_controller.text, password: pass_controller.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home_Screen()));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                child: Text(
                  "Login to your Account",
                  style: GoogleFonts.poppins(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 200.h,
                width: 250.w,
                child: Image.asset("images/icons/102.png"),
              ),
              Container(
                height: 500.h,
                width: 450.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 50.h, left: 20.w, right: 20.w, bottom: 20.h),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200)),
                        ),
                        child: TextField(
                          controller: email_controller,
                          decoration: InputDecoration(
                            constraints: BoxConstraints(
                              maxHeight: 60.h,
                            ),
                            labelText: 'Enter Email',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 2.w)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: Colors.deepPurpleAccent,
                                width: 2.w,
                              ),
                            ),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200)),
                        ),
                        child: TextFormField(
                          obscureText: is_hide,
                          controller: pass_controller,
                          decoration: InputDecoration(
                              constraints: BoxConstraints(
                                maxHeight: 60.h,
                              ),
                              labelText: 'Enter Password',
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.w)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: Colors.deepPurpleAccent,
                                  width: 2.w,
                                ),
                              ),
                              prefixIcon: Icon(Icons.key),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    is_hide = !is_hide;
                                  });
                                },
                                icon: !is_hide
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GestureDetector(
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Forgot_screen()),
                          );
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      GestureDetector(
                        child: Text(
                          "Create New Account",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => New_account()));
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ElevatedButton(
                        onPressed: () => user_login(),
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: Colors.black,
                          minimumSize: Size(350.w, 50.h),
                          shadowColor: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      // Divider(
                      //   color: Colors.black,
                      // ),
                      // Container(
                      //   child: Center(
                      //     child: Text(
                      //       "OR",
                      //       style: TextStyle(color: Colors.grey),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 30.h,
                      // ),
                      // Row(
                      //   children: [
                      //     SizedBox(
                      //       width: 20.w,
                      //     ),
                      //     GestureDetector(
                      //       onTap: () {},
                      //       child: Container(
                      //         height: 60.h,
                      //         width: 150.w,
                      //         decoration: BoxDecoration(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(20.r)),
                      //             color: Colors.black,
                      //             border: Border.all(color: Colors.white),
                      //             boxShadow: [
                      //               BoxShadow(
                      //                 color: Colors.deepPurpleAccent,
                      //                 spreadRadius: 2.r,
                      //                 blurRadius: 6.r,
                      //               )
                      //             ]),
                      //         child: Padding(
                      //             padding: EdgeInsets.all(8.h),
                      //             child: Image.asset(
                      //               "images/icons/Google.png",
                      //             )),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 30.w,
                      //     ),
                      //     GestureDetector(
                      //       onTap: () {},
                      //       child: Container(
                      //         height: 60.h,
                      //         width: 150.w,
                      //         decoration: BoxDecoration(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(20.r)),
                      //             color: Colors.black,
                      //             border: Border.all(color: Colors.white),
                      //             boxShadow: [
                      //               BoxShadow(
                      //                 color: Colors.deepPurpleAccent,
                      //                 spreadRadius: 2.r,
                      //                 blurRadius: 6.r,
                      //               )
                      //             ]),
                      //         child: Padding(
                      //             padding: EdgeInsets.all(8.h),
                      //             child: Image.asset(
                      //               "images/icons/LinkedIn.png",
                      //             )),
                      //       ),
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
