import 'package:Remedial_App/Widgets/bottomNavigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWidget extends StatefulWidget {
  final String collectionName;
  final int length;
  const MyWidget({
    super.key,
    required this.length,
    required this.collectionName,
  });
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  // Create lists of controllers for each TextField
  late final List<TextEditingController> questionControllers;
  late final List<TextEditingController> optionAControllers;
  late final List<TextEditingController> optionBControllers;
  late final List<TextEditingController> optionCControllers;
  late final List<TextEditingController> optionDControllers;
  late final List<TextEditingController> answerControllers;
  late List<String?> selectedOptions;

  @override
  void initState() {
    super.initState();
    // Initialize the controllers based on widget.length
    questionControllers =
        List.generate(widget.length, (index) => TextEditingController());
    optionAControllers =
        List.generate(widget.length, (index) => TextEditingController());
    optionBControllers =
        List.generate(widget.length, (index) => TextEditingController());
    optionCControllers =
        List.generate(widget.length, (index) => TextEditingController());
    optionDControllers =
        List.generate(widget.length, (index) => TextEditingController());
    answerControllers =
        List.generate(widget.length, (index) => TextEditingController());
    selectedOptions = List<String?>.generate(widget.length, (index) => null);
  }

  @override
  void dispose() {
    // Dispose all the controllers to avoid memory leaks
    for (var controller in questionControllers) {
      controller.dispose();
    }
    for (var controller in optionAControllers) {
      controller.dispose();
    }
    for (var controller in optionBControllers) {
      controller.dispose();
    }
    for (var controller in optionCControllers) {
      controller.dispose();
    }
    for (var controller in optionDControllers) {
      controller.dispose();
    }
    for (var controller in answerControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  questionlist(
      {required String questionNum,
      required String question,
      required String optionA,
      required String optionB,
      required String optionC,
      required String optionD,
      required String answer}) async {
    await FirebaseFirestore.instance
        .collection(widget.collectionName)
        .doc(questionNum)
        .set({
      'question': question,
      'option_1': optionA,
      'option_2': optionB,
      'option_3': optionC,
      'option_4': optionD,
      'answer': answer,
    });
  }

  void submitAll() async {
    for (int i = 0; i < widget.length; i++) {
      await questionlist(
        questionNum: (i + 1).toString(),
        question: questionControllers[i].text,
        optionA: optionAControllers[i].text,
        optionB: optionBControllers[i].text,
        optionC: optionCControllers[i].text,
        optionD: optionDControllers[i].text,
        answer: selectedOptions[i] ?? 'No answer selected',
      );
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BottomNavBar()));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ...List.generate(widget.length, (index) {
        return Column(
          children: [
            Text(
              (index + 1).toString(),
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: questionControllers[index],
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxHeight: 60.h,
                ),
                labelText: 'Question',
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
            SizedBox(height: 10),
            TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: optionAControllers[index],
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxHeight: 60.h,
                ),
                labelText: 'Option A',
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
            SizedBox(height: 10),
            TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: optionBControllers[index],
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxHeight: 60.h,
                ),
                labelText: 'Option B',
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
            SizedBox(height: 10),
            TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: optionCControllers[index],
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxHeight: 60.h,
                ),
                labelText: 'Option C',
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
            SizedBox(height: 10),
            TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: optionDControllers[index],
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxHeight: 60.h,
                ),
                labelText: 'Option D',
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
            SizedBox(height: 10),
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
                        "A",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                      value: 'A',
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "B",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                      value: 'B',
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "C",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                      value: 'C',
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "D",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                      value: 'D',
                    ),
                  ],
                  value: selectedOptions[index],
                  hint: Text(
                    'Select an answer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  onChanged: ((String? value) {
                    setState(
                      () {
                        selectedOptions[index] = value;
                      },
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        );
      }),
      ElevatedButton(
        onPressed: submitAll,
        child: Text(
          "Submit All",
          style: GoogleFonts.poppins(
            fontSize: 25.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
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
    ]);
  }
}
