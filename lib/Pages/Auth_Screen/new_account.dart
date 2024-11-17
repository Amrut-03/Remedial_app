import 'package:Remedial_App/Widgets/bottomNavigation_bar.dart';
import 'package:Remedial_App/Pages/Auth_Screen/login_page.dart';
import 'package:Remedial_App/Pages/ProfileScreens/upload_profile_img.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class New_account extends StatefulWidget {
  const New_account({super.key});

  @override
  State<New_account> createState() => _New_accountState();
}

class _New_accountState extends State<New_account> {
  TextEditingController name_con = TextEditingController();
  TextEditingController email_con = TextEditingController();
  TextEditingController phone_con = TextEditingController();
  TextEditingController department_con = TextEditingController();
  TextEditingController pass_con = TextEditingController();
  TextEditingController confirm_pass_con = TextEditingController();
  bool is_hide = true;
  bool is_hide2 = true;
  String ling = 'Gender';
  String branch = 'Department';
  bool is_click = true;
  bool is_tap = true;

  // add_user({
  //   required String url,
  //   required String name,
  //   required String email,
  //   required String phone,
  //   required String password,
  //   required String confirm_pass,
  // }) async {
  //   if (password != confirm_pass) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         backgroundColor: Colors.white,
  //         content: Text(
  //           "Confirm Password is Different from Password.",
  //           style: GoogleFonts.poppins(
  //             color: Colors.black,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         )));
  //     return;
  //   }
  //   if (name == '' ||
  //       email == '' ||
  //       phone == '' ||
  //       password == '' ||
  //       branch == '' ||
  //       ling == '' ||
  //       confirm_pass == '') {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       backgroundColor: Colors.white,
  //       content: Text(
  //         "All fields are Required.",
  //         style: GoogleFonts.poppins(
  //           color: Colors.black,
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //     ));
  //     return;
  //   }
  //   try {
  //     await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(email: email, password: password);
  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(email_con.text)
  //         .set({
  //       "name": name,
  //       "email": email,
  //       "phone": phone,
  //       "gender": ling,
  //       "department": branch,
  //       "password": password,
  //       'role': 'student',
  //       'profile_url': url
  //     });
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => BottomNavBar()));
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       backgroundColor: Colors.white,
  //       content: Text(
  //         e.message!,
  //         style: GoogleFonts.poppins(
  //           color: Colors.black,
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //     ));
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Create New Account",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.h),
                    resusable_TextField(
                      name_con: name_con,
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      input: 'Enter Full Name',
                    ),
                    SizedBox(height: 20.h),
                    resusable_TextField(
                      name_con: email_con,
                      icon: const Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      input: 'Enter email',
                    ),
                    SizedBox(height: 20.h),
                    resusable_TextField(
                      name_con: phone_con,
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      input: 'Phone Number',
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 60.h,
                      width: 390.w,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: Colors.white,
                            width: 1.w,
                          )),
                      child: ListTile(
                        leading: Icon(
                          Icons.holiday_village,
                          color: Colors.white,
                        ),
                        title: DropdownButton(
                          dropdownColor: Colors.black,
                          iconSize: 30,
                          enableFeedback: true,
                          iconEnabledColor: Colors.transparent,
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                "Department",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                              value: 'Department',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Electrical Engineering",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.sp),
                              ),
                              value: 'Electrical Engineering',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Civil Engineering",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.sp),
                              ),
                              value: 'Civil Engineering',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Mechanical Engineering",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.sp),
                              ),
                              value: 'Mechanical Engineering',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Computer Science Engineering",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.sp),
                              ),
                              value: 'Computer Science Engineering',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Electronics and Telecommunication",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.sp),
                              ),
                              value: 'Electronics and Telecommunication',
                            ),
                          ],
                          value: branch,
                          onChanged: ((String? value) {
                            setState(
                              () {
                                branch = value!;
                                is_click = false;
                              },
                            );
                          }),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 60.h,
                      width: 390.w,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          )),
                      child: ListTile(
                        leading: Icon(
                          Icons.male,
                          color: Colors.white,
                        ),
                        title: DropdownButton(
                          dropdownColor: Colors.black,
                          iconSize: 30,
                          enableFeedback: true,
                          iconEnabledColor: Colors.transparent,
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                "Gender",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                              value: 'Gender',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Male",
                                style: TextStyle(color: Colors.white),
                              ),
                              value: 'Male',
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Female",
                                style: TextStyle(color: Colors.white),
                              ),
                              value: 'Female',
                            ),
                          ],
                          value: ling,
                          onChanged: ((String? value) {
                            setState(
                              () {
                                ling = value!;
                                is_tap = false;
                              },
                            );
                          }),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        obscureText: is_hide,
                        controller: pass_con,
                        decoration: InputDecoration(
                          constraints: BoxConstraints(
                            maxHeight: 60.h,
                          ),
                          labelText: 'New Password',
                          labelStyle: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.w)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.w,
                              )),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                is_hide = !is_hide;
                              });
                            },
                            icon: !is_hide
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        obscureText: is_hide2,
                        controller: confirm_pass_con,
                        decoration: InputDecoration(
                          constraints: BoxConstraints(
                            maxHeight: 60.h,
                          ),
                          labelText: 'Confirm Password',
                          labelStyle: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.w)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.w,
                              )),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                is_hide2 = !is_hide2;
                              });
                            },
                            icon: !is_hide2
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileImageUpload(
                                      name: name_con.text,
                                      email: email_con.text,
                                      phone: phone_con.text,
                                      department: department_con.text,
                                      pass: pass_con.text,
                                      branch: branch,
                                      ling: ling,
                                      confirm_pass: confirm_pass_con.text,
                                    )));
                      },
                      child: Text(
                        "Proceed",
                        style: GoogleFonts.poppins(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: Colors.black,
                        minimumSize: Size(350.w, 50.h),
                        shadowColor: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Colors.grey,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => login_page()),
                        );
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          //fontWeight: FontWeight.,
                          color: Colors.white,
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
    );
  }
}

class resusable_TextField extends StatefulWidget {
  const resusable_TextField({
    super.key,
    required this.name_con,
    required this.icon,
    required this.input,
  });

  final TextEditingController name_con;
  final Icon icon;
  final String input;

  @override
  State<resusable_TextField> createState() => _resusable_TextFieldState();
}

class _resusable_TextFieldState extends State<resusable_TextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: TextField(
        style: TextStyle(
          color: Colors.white,
        ),
        controller: widget.name_con,
        decoration: InputDecoration(
          constraints: BoxConstraints(
            maxHeight: 60.h,
          ),
          labelText: widget.input,
          labelStyle: GoogleFonts.poppins(
            fontSize: 15.sp,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.white, width: 1.w)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.w,
              )),
          prefixIcon: widget.icon,
        ),
      ),
    );
  }
}
