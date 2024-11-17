import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:Remedial_App/models/exam_model.dart';
import 'package:intl/intl.dart';

import '../result.dart';

// ignore: must_be_immutable
class AptitudeInterface extends StatefulWidget {
  String topic;
  AptitudeInterface({
    Key? key,
    required this.topic,
  }) : super(key: key);
  @override
  State<AptitudeInterface> createState() => _AptitudeInterfaceState();
}

class _AptitudeInterfaceState extends State<AptitudeInterface> {
  List<QuestionModel> questionModel = [];
  List<String> options = [];
  var questions_data;
  bool is_loading = true;
  int _timerDurationInSeconds = 30 * 60;
  late Timer _timer;
  late DateTime startTime;

  get_exam_data({required String docId}) async {
    setState(() {
      is_loading = true;
    });
    options.clear();
    questions_data = await FirebaseFirestore.instance
        .collection(widget.topic)
        .doc(docId)
        .get();
    options.add(questions_data["option_1"]);
    options.add(questions_data["option_2"]);
    options.add(questions_data["option_3"]);
    options.add(questions_data["option_4"]);
    correct_ans.add(questions_data["answer"]);
    setState(() {
      is_loading = false;
    });
  }

  static List<String> user_answer = [];
  List<String> correct_ans = [];
  int question_num = 1;
  int question_len = 20;
  String current_opts = " ";
  List<String> temp = ["A", "B", "C", "D"];
  int result = 0;

  next_page() {
    if (question_num == question_len) {
      int res = 0;
      user_answer.add(current_opts);
      for (int i = 0; i < question_len; i++) {
        print("+++++++++++++++++++++++++++++++++++++++++++++++");
        print(correct_ans[i]);
        print(user_answer[i]);
        print("+++++++++++++++++++++++++++++++++++++++++++++++");
        if (user_answer[i] == correct_ans[i]) {
          res++;
        }
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            marks: res,
            questionModel: questionModel,
          ),
        ),
      );
      result = res;
    } else {
      setState(() {
        question_num++;
        user_answer.add(current_opts);
        current_opts = " ";
        get_exam_data(docId: question_num.toString());
      });
    }
  }

  String docId = FirebaseAuth.instance.currentUser!.email.toString();

  getresult({
    required String topic,
    required int marks,
  }) {
    final user = FirebaseAuth.instance.currentUser;
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    // final totaltime = now.difference(startTime).inSeconds;
    // if (question_len == question_num) {
    //   FirebaseFirestore.instance
    //       .collection('Aptitude Tests List')
    //       .doc(topic)
    //       .set({
    //     docId: {"marks": marks, "Time": totaltime}
    //   });
    // }
    FirebaseFirestore.instance.collection('users').doc(user!.email).set({
      "result": {
        formattedDate: {"marks": marks, "topic": topic}
      }
    }, SetOptions(merge: true));
  }

  @override
  void initState() {
    startTime = DateTime.now();
    get_exam_data(docId: question_num.toString());
    correct_ans.clear();
    user_answer.clear();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timerDurationInSeconds > 0) {
        setState(() {
          _timerDurationInSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                'Are you sure?',
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w600, color: Colors.black),
              ),
              content: Text(
                'Do you want to exit the exam? Your progress will be lost.',
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w400, color: Colors.black),
              ),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w400, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    'Exit',
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w400, color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${_timerDurationInSeconds ~/ 60}:${(_timerDurationInSeconds % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.deepPurpleAccent,
          body: Stack(
            children: [
              if (!is_loading)
                SafeArea(
                  child: Center(
                    child: Container(
                      height: 650.h,
                      width: 350.w,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10.r,
                              spreadRadius: 5.r,
                              color: Colors.black45,
                              offset: Offset(7, 7))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: Colors.black, width: 2.w),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "20/" + question_num.toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 150.h,
                            width: 340.w,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2.w),
                                borderRadius: BorderRadius.circular(20.r),
                                color: Colors.white),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.w),
                                    child: Text(
                                      questions_data["question"],
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          SingleChildScrollView(
                            child: Container(
                              height: 350.h,
                              width: 340.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 2.w),
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Colors.white),
                              child: !is_loading
                                  ? ListView.builder(
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return RadioListTile(
                                          value: temp[index],
                                          groupValue: current_opts,
                                          onChanged: (value) {
                                            setState(() {
                                              current_opts = value.toString();
                                            });
                                          },
                                          title: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                temp[index] + ") ",
                                                style: GoogleFonts.ubuntu(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20.sp,
                                                ),
                                              ),
                                              Container(
                                                width: 200.w,
                                                child: Text(
                                                  options[index],
                                                  style: GoogleFonts.ubuntu(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      })
                                  : CircularProgressIndicator(),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              questionModel.add(QuestionModel(
                                question: questions_data['question'],
                                correct_answer: questions_data['answer'],
                                user_answer: current_opts,
                                A: questions_data['option_1'],
                                B: questions_data['option_2'],
                                C: questions_data['option_3'],
                                D: questions_data['option_4'],
                              ));
                              next_page();
                              getresult(topic: widget.topic, marks: result);
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(100.w, 50.h),
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            child: Text(
                              "next",
                              style: GoogleFonts.ubuntu(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else
                Center(child: CircularProgressIndicator())
            ],
          ),
        ));
  }
}
