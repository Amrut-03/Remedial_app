import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class feedback extends StatefulWidget {
  const feedback({super.key});

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  TextEditingController feedback_con = TextEditingController();

  add_feedback({required String feedback}) async {
    await FirebaseFirestore.instance
        .collection('feedback')
        .doc(emailId)
        .set({'feedback': feedback});
    await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          'Feedback sent Succesfully',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, color: Colors.black),
        )));
  }

  String emailId = FirebaseAuth.instance.currentUser!.email!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Feedback',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 30.sp,
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 400.h,
              width: 370.w,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30.r)),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: Text(
                    'Give Feedback',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 25.sp,
                    ),
                  )),
                  Divider(
                    color: Colors.white,
                    indent: 80.w,
                    endIndent: 80.w,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: TextField(
                      controller: feedback_con,
                      minLines: 3,
                      maxLines: 10,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        constraints: BoxConstraints(maxHeight: 300.h),
                        hintText: 'Enter your feedback here,',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          color: Colors.white60,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                                color: Colors.deepPurpleAccent, width: 2)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      add_feedback(feedback: feedback_con.text);
                    },
                    style: ElevatedButton.styleFrom(
                      maximumSize: Size(150.w, 60.h),
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      'Submit',
                      style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
