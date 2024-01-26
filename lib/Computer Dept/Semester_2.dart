import 'package:Remedial_App/Computer%20Dept/reusable_container.dart';
import 'package:Remedial_App/Computer%20Dept/shimmer_reusable.dart';
import 'package:Remedial_App/Exam_Screen/cse_start_Sem_2/start_screen_cs.dart';
import 'package:Remedial_App/Exam_Screen/cse_start_Sem_2/start_screen_eee.dart';
import 'package:Remedial_App/Exam_Screen/cse_start_Sem_2/start_screen_m2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../Exam_Screen/cse_start_Sem_2/start_screen_physics.dart';

class Semester_2 extends StatefulWidget {
  const Semester_2({
    super.key,
  });

  @override
  State<Semester_2> createState() => _Semester_2State();
}

class _Semester_2State extends State<Semester_2> {
  bool isLoading = true;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Stack(children: [
          if (!isLoading)
            Visibility(
              visible: !isLoading,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
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
                    Padding(
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
                    reusable_container(
                        subject: 'Communication Skill',
                        Onclick: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => start_screen_cs()))),
                    reusable_container(
                        subject: 'Energy and Environment Engineering',
                        Onclick: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => start_screen_eee()))),
                    reusable_container(
                        subject: 'Physics',
                        Onclick: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => start_screen_phy()))),
                    reusable_container(
                        subject: 'Mathematics 2',
                        Onclick: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => start_screen_m2()))),
                  ],
                ),
              ),
            )
          else
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    highlightColor: Colors.grey.shade100,
                    baseColor: Colors.grey.shade500,
                    child: Column(
                      children: [
                        container(
                          height: 200,
                          width: 350,
                          rad: 20,
                        ),
                        SizedBox(height: 20),
                        container(
                          height: 60,
                          width: 350,
                          rad: 20,
                        ),
                        SizedBox(height: 30),
                        container(
                          height: 40,
                          width: 300,
                          rad: 20,
                        ),
                        SizedBox(height: 30),
                        container(
                          height: 40,
                          width: 300,
                          rad: 20,
                        ),
                        SizedBox(height: 30),
                        container(
                          height: 40,
                          width: 300,
                          rad: 20,
                        ),
                        SizedBox(height: 30),
                        container(
                          height: 40,
                          width: 300,
                          rad: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ]),
      ),
    );
  }
}

class container extends StatelessWidget {
  final double height;
  final double width;
  final double rad;
  const container({
    super.key,
    required this.height,
    required this.width,
    required this.rad,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(rad)),
          color: Colors.white),
    );
  }
}
