import 'package:Remedial_App/Screens/Home_screen.dart';
import 'package:Remedial_App/Screens/login_page.dart';
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
  TextEditingController gender_con = TextEditingController();
  bool is_hide = true;
  bool is_hide2 = true;

  add_user(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String confirm_pass,
      required String department,
      required String gender}) async {
    if (password != confirm_pass) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Confirm Password is Different from Password🧐",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                ),
              ),
            );
          });
      return;
    }
    if (name == '' ||
        email == '' ||
        phone == '' ||
        password == '' ||
        department == '' ||
        gender == '' ||
        confirm_pass == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("All fields are Required🛑"),
      ));
      return;
    }
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(email_con.text)
          .set({
        "name": name,
        "email": email,
        "phone": phone,
        "gender": gender,
        "department": department,
        "password": password,
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home_Screen()));
    } catch (e) {
      print("succeful");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Colors.black,
      ),
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
                      icon: Icon(Icons.person,color: Colors.white,),
                      input: 'Enter Full Name',
                    ),
                    SizedBox(height: 20.h),
                    resusable_TextField(
                      name_con: email_con,
                      icon: Icon(Icons.email,color: Colors.white,),
                      input: 'Enter email',
                    ),
                    SizedBox(height: 20.h),
                    resusable_TextField(
                      name_con: phone_con,
                      icon: Icon(Icons.phone,color: Colors.white,),
                      input: 'Phone Number',
                    ),
                    SizedBox(height: 20.h),
                    resusable_TextField(
                      name_con: department_con,
                      icon: Icon(Icons.holiday_village,color: Colors.white,),
                      input: 'Department Name',
                    ),
                    SizedBox(height: 20.h),
                    resusable_TextField(
                      name_con: gender_con,
                      icon: Icon(Icons.male,color: Colors.white,),
                      input: 'Gender',
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: TextField(
                        style: TextStyle(
                            color: Colors.white
                        ),
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
                          prefixIcon: Icon(Icons.key,color: Colors.white,),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                is_hide = !is_hide;
                              });
                            },
                            icon: !is_hide
                                ? Icon(Icons.visibility,color: Colors.white,)
                                : Icon(Icons.visibility_off,color: Colors.white,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white
                        ),
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
                          prefixIcon: Icon(Icons.key,color: Colors.white,),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                is_hide2 = !is_hide2;
                              });
                            },
                            icon: !is_hide2
                                ? Icon(Icons.visibility,color: Colors.white,)
                                : Icon(Icons.visibility_off,color: Colors.white,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    ElevatedButton(
                      onPressed: () {
                        add_user(
                            name: name_con.text,
                            email: email_con.text,
                            phone: phone_con.text,
                            password: pass_con.text,
                            confirm_pass: confirm_pass_con.text,
                            department: department_con.text,
                            gender: gender_con.text);
                        Navigator.pop;
                      },
                      child: Text(
                        "Submit",
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
                    SizedBox(height: 10.h),
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
      padding: const EdgeInsets.only(left: 10,right: 10),
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
