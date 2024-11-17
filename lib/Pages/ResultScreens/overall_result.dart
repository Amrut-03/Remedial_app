import 'package:Remedial_App/models/exam_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OverallResult extends StatelessWidget {
  OverallResult({super.key, required this.questionModel});

  List<QuestionModel> questionModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          'Overall Result',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemCount: questionModel.length,
            itemBuilder: (context, index) {
              String op = questionModel[index].correct_answer.toString();
              Map<String, String> M = {
                'A': questionModel[index].A.toString(),
                'B': questionModel[index].B.toString(),
                'C': questionModel[index].C.toString(),
                'D': questionModel[index].D.toString(),
              };
              return Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 20),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10.r,
                              spreadRadius: 5.r,
                              color: Colors.black45,
                              offset: Offset(7, 7))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      // leading: Text(
                      //   (index + 1).toString(),
                      //   style: TextStyle(color: Colors.black),
                      // ),
                      title: Text(
                          (index + 1).toString() +
                              ") " +
                              questionModel[index].question.toString(),
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      subtitle: Column(
                        children: [
                          ListTile(
                            leading: Text(
                              "Your Answer - ",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            horizontalTitleGap: 4,
                            title: Text(
                              M[questionModel[index].user_answer] == null
                                  ? 'Answer is not Selected'
                                  : M[questionModel[index]
                                          .user_answer
                                          .toString()]
                                      .toString(),
                              style: GoogleFonts.poppins(
                                  color: M[questionModel[index]
                                                  .user_answer
                                                  .toString()]
                                              .toString() ==
                                          M[questionModel[index]
                                                  .correct_answer
                                                  .toString()]
                                              .toString()
                                      ? Colors.green
                                      : Colors.red,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          ListTile(
                            leading: Text(
                              "Correct Answer - ",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            horizontalTitleGap: 4,
                            title: Text(
                              M[questionModel[index].correct_answer] == null
                                  ? 'Correct answer is not defined'
                                  : M[questionModel[index]
                                          .correct_answer
                                          .toString()]
                                      .toString(),
                              style: GoogleFonts.poppins(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    )),
              );
              // Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15.r),
              //       color: Colors.white,
              //     ),
              //     child: Text(
              //       'There is no data',
              //       style: GoogleFonts.poppins(
              //           color: Colors.black, fontWeight: FontWeight.w600),
              //     ),
              //   );
            },
          ),
        ),
      ),
    );
  }
}
