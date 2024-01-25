import 'package:Remedial_App/Computer Dept/reusable_container.dart';
import 'package:Remedial_App/Computer Dept/shimmer_reusable.dart';
import 'package:Remedial_App/Exam_Screen/cse_start_Sem_1/Start_sceen_Cp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../Exam_Screen/cse_start_Sem_1/Start_sceen_mech.dart';
import '../Exam_Screen/cse_start_Sem_1/Start_screen_che.dart';
import '../Exam_Screen/cse_start_Sem_1/Start_screen_m1.dart';

class semester_1 extends StatefulWidget {
  const semester_1({
    super.key,
  });

  @override
  State<semester_1> createState() => _semester_1State();
}

class _semester_1State extends State<semester_1> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate an asynchronous operation for 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    subject: 'Mechanics',
                    Onclick: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => start_screen_mech()))),
                if (isLoading)
                  shimmer_resuable(isLoading: isLoading)
              ]),
              Stack(children: [
                reusable_container(
                    subject: 'C Programming',
                    Onclick: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => start_screen_cp()))),
                if (isLoading)
                  shimmer_resuable(isLoading: isLoading),
              ]),
              Stack(children: [
                reusable_container(
                    subject: 'Chemistry',
                    Onclick: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => start_screen_che()))),
                if (isLoading)
                  shimmer_resuable(isLoading: isLoading)
              ]),
              Stack(children: [
                reusable_container(
                    subject: 'Mathematics 1',
                    Onclick: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => start_screen_m1()))),
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



