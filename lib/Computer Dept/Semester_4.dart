import 'package:Remedial_App/Computer%20Dept/reusable_container.dart';
import 'package:Remedial_App/Computer%20Dept/shimmer_reusable.dart';
import 'package:Remedial_App/Exam_Screen/cse_start_Sem_4/start_screen_bhr.dart';
import 'package:Remedial_App/Exam_Screen/cse_start_Sem_4/start_screen_daa.dart';
import 'package:Remedial_App/Exam_Screen/cse_start_Sem_4/start_screen_dldm.dart';
import 'package:Remedial_App/Exam_Screen/cse_start_Sem_4/start_screen_m4.dart';
import 'package:Remedial_App/Exam_Screen/cse_start_Sem_4/start_screen_os.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class Semester_4 extends StatefulWidget {
  const Semester_4({
    super.key,
  });

  @override
  State<Semester_4> createState() => _Semester_4State();
}

class _Semester_4State extends State<Semester_4> {
  bool isLoading = true;

  @override

  void initState() {
    Future.delayed(Duration(seconds: 2),(){
      setState(() {
        isLoading = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,iconTheme: IconThemeData(
          color: Colors.white
      ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Stack(children: [
                  Visibility(
                    visible: !isLoading,
                    child: Container(
                      height: 200,
                      width: 350,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Stack(
                            children: [
                              Image.asset(
                                "images/Backgrounds/back1.png",
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 80, left: 20, right: 20, bottom: 40),
                                child: Text(
                                  "Computer Science and Engineering",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  if (isLoading)
                    Shimmer.fromColors(
                      highlightColor: Colors.grey.shade100,
                      baseColor: Colors.grey.shade500,
                      child: Container(
                        height: 200,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors
                              .white, // Use a background color matching your design
                        ),
                      ),
                    ),
                ]),
              ),
              Stack(children: [
                Visibility(
                  visible: !isLoading,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.deepPurpleAccent,
                                spreadRadius: 2,
                                blurRadius: 6)
                          ]),
                      child: Center(
                        child: Text(
                          "Choose your Backlog Subject",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                if (isLoading)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Shimmer.fromColors(
                        child: Container(
                          height: 60,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                        ),
                      highlightColor: Colors.grey.shade100,
                      baseColor: Colors.grey.shade500,),
                  )
              ]),
              Stack(children: [
                reusable_container(
                    subject: 'Design Analysis of Algorithms',
                    Onclick: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => start_screen_daa()))),
                if (isLoading)
                  shimmer_resuable(isLoading: isLoading),
              ]),
              Stack(children: [
                reusable_container(
                    subject: 'Operating System',
                    Onclick: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => start_screen_os()))),
                if (isLoading)
                  shimmer_resuable(isLoading: isLoading),
              ]),
              Stack(children: [
                reusable_container(
                    subject: 'Basic Human Rights',
                    Onclick: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => start_screen_bhr()))),
                if (isLoading)
                  shimmer_resuable(isLoading: isLoading),
              ]),
              Stack(children: [
                reusable_container(
                    subject: 'Mathematics 4',
                    Onclick: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => start_screen_m4()))),
                if (isLoading)
                  shimmer_resuable(isLoading: isLoading),
              ]),
              Stack(children: [
                reusable_container(
                    subject: 'Digital Logic Design and Microprocessor',
                    Onclick: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => start_screen_dldm()))),
                if (isLoading)
                  shimmer_resuable(isLoading: isLoading),
              ]),
            ],
          ),
        ),
      ),
    );

  }
}
