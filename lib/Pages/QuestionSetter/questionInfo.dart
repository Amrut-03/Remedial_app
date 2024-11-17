import 'package:Remedial_App/Pages/ListOfTopicsSubjects/CSSubjects.dart';
import 'package:Remedial_App/Pages/ListOfTopicsSubjects/aptiTopics.dart';
import 'package:Remedial_App/Pages/QuestionSetter/questionSetter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Questioninfo extends StatefulWidget {
  const Questioninfo({super.key});

  @override
  State<Questioninfo> createState() => _QuestioninfoState();
}

class _QuestioninfoState extends State<Questioninfo> {
  final TextEditingController collectionController = TextEditingController();
  final TextEditingController questionLengthController =
      TextEditingController();
  String questionType = "Aptitude";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        title: Text(
          'Set Questions Papers',
          style: GoogleFonts.poppins(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Question Information',
            textAlign: TextAlign.start,
            style: GoogleFonts.poppins(
                fontSize: 18.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: collectionController,
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxHeight: 60.h,
                ),
                labelText: 'Test Name',
                labelStyle: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  color: Colors.white,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Colors.white, width: 1.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.w,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // TextField(
          //   style: TextStyle(
          //     color: Colors.white,
          //   ),
          //   controller: questionLengthController,
          //   decoration: InputDecoration(
          //     constraints: BoxConstraints(
          //       maxHeight: 60.h,
          //     ),
          //     labelText: 'Test Length',
          //     labelStyle: GoogleFonts.poppins(
          //       fontSize: 15.sp,
          //       color: Colors.white,
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(10.r),
          //       borderSide: BorderSide(color: Colors.white, width: 1.w),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(10.r),
          //       borderSide: BorderSide(
          //         color: Colors.black,
          //         width: 1.w,
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              height: 50.h,
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
                        "Aptitude",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                      value: 'Aptitude',
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "CS fundamentals",
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      ),
                      value: 'CS fundamentals',
                    ),
                  ],
                  value: questionType,
                  onChanged: ((String? value) {
                    setState(
                      () {
                        questionType = value!;
                      },
                    );
                  }),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection(questionType == "Aptitude"
                      ? "Aptitude Tests List"
                      : "CS Fundamentals Tests List")
                  .doc(collectionController.text)
                  .set({});
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Questionsetter(
                    collectionName: collectionController.text,
                    questionType: questionType,
                  ),
                ),
              );
            },
            child: Text(
              "Submit",
              style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 10,
              backgroundColor: Colors.black,
              minimumSize: Size(350.w, 40.h),
              shadowColor: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
