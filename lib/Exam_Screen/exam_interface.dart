import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screens/result.dart';

class ExamInterface extends StatefulWidget {
  String sem_num;
  String subject;
  ExamInterface({super.key,required this.subject,required this.sem_num});
  @override
  State<ExamInterface> createState() => _ExamInterfaceState();
}

class _ExamInterfaceState extends State<ExamInterface> {

  List <String> options = [];
  var questions_data;
  bool is_loading = true;

  get_exam_data({required String docId})async{

    setState(() {
      is_loading = true;
    });
    options.clear();
    questions_data = await FirebaseFirestore.instance.collection(widget.sem_num+"_"+widget.subject).doc(docId).get();
    options.add(questions_data["option_1"]);
    options.add(questions_data["option_2"]);
    options.add(questions_data["option_3"]);
    options.add(questions_data["option_4"]);
    correct_ans.add(questions_data["answer"]);
    setState(() {
      is_loading = false;
    });
  }

  List<String>user_answer = [];
  List<String>correct_ans = [];
  int question_num = 1;
  int question_len = 50;
  String current_opts = " ";
  List <String> temp = ["A","B","C","D"];

  next_page() {
    if (question_num == question_len) {
      int res = 0;
      user_answer.add(current_opts);
      for (int i = 0; i < question_len; i++)
        if (user_answer[i] == correct_ans[i])
          res++;

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => ResultPage(marks: res)));
    } else {
      setState(() {
        question_num++;
        user_answer.add(current_opts);
        current_opts = " ";
        get_exam_data(docId: question_num.toString());
      });
    }
  }

  @override
  void initState() {
    get_exam_data(docId: question_num.toString());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Stack(
        children: [
          if(!is_loading)
            SafeArea(
              child: Center(
                child: Container(
                  height: 680.h,
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
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:EdgeInsets.all(20.w),
                        child: Text(
                          "50/"+question_num.toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 150.h,
                            width: 340.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black,
                                    width: 2
                                ),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(questions_data["question"],textAlign: TextAlign.center,
                                      style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),),
                                  ),
                                  SizedBox(height: 20,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SingleChildScrollView(
                        child: Container(
                          height: 350.h,
                          width: 320.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: !is_loading ? ListView.builder(
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        temp[index] + ") ",
                                        style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Container(
                                          width: 200,
                                          child: Text(
                                            options[index],
                                            style: GoogleFonts.ubuntu(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                            ),
                                          ),),
                                    ],
                                  ),
                                );
                              }) : CircularProgressIndicator(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          next_page();
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 50),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        child: Text(
                          "next",
                          style: GoogleFonts.ubuntu(
                            fontSize: 25,
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
      )
    );
  }
}
