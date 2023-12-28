import 'package:Remedial_App/Exam_Screen/start_Sem_2/start_screen_cs.dart';
import 'package:Remedial_App/Exam_Screen/start_Sem_2/start_screen_eee.dart';
import 'package:Remedial_App/Exam_Screen/start_Sem_2/start_screen_phy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../Exam_Screen/start_Sem_2/start_screen_m2.dart';
import '../dash_bar.dart';

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
    Future.delayed(Duration(seconds: 2),(){
      setState(() {
        isLoading = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !isLoading,
                      child: Padding(padding: EdgeInsets.only(bottom: 20),
                        child: Container(
                          height: 200,
                          width: 350,
                          child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              child: Stack(
                                children: [
                                  Image.asset("images/Backgrounds/back1.png"),
                                  Padding(
                                    padding: EdgeInsets.only(top: 80,bottom: 40,left: 20,right: 20),
                                    child: Text('Computer Science and Engineering',style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                    ),),
                                  )
                                ],
                              )
                          ),
                        ),),
                    ),
                    if(isLoading)
                      Shimmer.fromColors(child:
                      Padding(padding: EdgeInsets.only(bottom: 20),
                        child: Container(
                          height: 200.h,
                          width: 350.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                        ),), baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100),
                    Visibility(visible: !isLoading,
                      child: Padding(padding: EdgeInsets.all(20),
                        child: Container(
                          height: 60,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.black,
                              boxShadow: [BoxShadow(
                                  color: Colors.deepPurpleAccent,
                                  spreadRadius: 2,
                                  blurRadius: 6
                              )]
                          ),
                          child: Center(
                            child: Text(
                              "Choose your Backlog Subject",style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if(isLoading)
                    Shimmer.fromColors(child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        height: 60,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                      ),
                    ), baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100),
                    Visibility(
                      visible: !isLoading,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 10),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>start_screen_m2()));
                          },
                          child: Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                boxShadow: [BoxShadow(
                                  color: Colors.deepPurpleAccent,
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                )]
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30,right: 20),
                                child: Text('Mathematics 2',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if(isLoading)
                      Shimmer.fromColors(child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                        ),
                      ), baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100),
                    Visibility(
                      visible: !isLoading,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>start_screen_phy()));
                          },
                          child: Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                boxShadow: [BoxShadow(
                                    color: Colors.deepPurpleAccent,
                                    spreadRadius: 2,
                                    blurRadius: 6
                                )]
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30,right: 20),
                                child: Text('Physics',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if(isLoading)
                      Shimmer.fromColors(child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                        ),
                      ), baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100),
                    Visibility(
                      visible: !isLoading,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>start_screen_eee()));
                          },
                          child: Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                boxShadow: [BoxShadow(
                                    color: Colors.deepPurpleAccent,
                                    spreadRadius: 2,
                                    blurRadius: 6
                                )]
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30,right: 10),
                                child: Text('Energy and Environment Engineering',textAlign: TextAlign.center,style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if(isLoading)
                      Shimmer.fromColors(child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                        ),
                      ), baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100),
                    Visibility(
                      visible: !isLoading,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>start_screen_cs()));
                          },
                          child: Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                boxShadow: [BoxShadow(
                                    color: Colors.deepPurpleAccent,
                                    spreadRadius: 2,
                                    blurRadius: 6
                                )]
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30,right: 20),
                                child: Text('Communication Skills',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if(isLoading)
                      Shimmer.fromColors(child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                        ),
                      ), baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100),
                    SizedBox(height: 10,),
                    dash_bar(),
                  ],
                ),
              ),
          ],
        ),
      )
    );
  }
}
