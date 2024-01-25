import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Remedial_App/Civil_Dept/Semester_1.dart';
import 'package:Remedial_App/Civil_Dept/Semester_2.dart';
import 'package:Remedial_App/Civil_Dept/Semester_3.dart';
import 'package:Remedial_App/Civil_Dept/Semester_4.dart';
import 'package:Remedial_App/Civil_Dept/Semester_5.dart';
import 'package:Remedial_App/Civil_Dept/Semester_6.dart';
import 'package:Remedial_App/Civil_Dept/Semester_7.dart';
import '../Screens/floating_bar.dart';

class Civil extends StatefulWidget {
  Civil({super.key,});

  @override
  State<Civil> createState() => _CivilState();
}

class _CivilState extends State<Civil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 20),
                      child: Container(
                        height: 200,
                        width: 350,
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Stack(
                              children: [
                                Image.asset("images/Backgrounds/civil.png",fit: BoxFit.cover,),
                                Padding(
                                  padding: EdgeInsets.only(top: 20,left:120,right: 20,bottom: 40),
                                  child: Text("Civil Engineering",style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),),
                                )
                              ],
                            )
                        ),
                      ),),
                    Padding(padding: EdgeInsets.all(20),
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
                            "Choose your Semester",style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 25
                          ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Semester_1()));
                            },
                            child: Container(
                              height: 60,
                              width: 150,
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
                                  child: Text("1 Semester",style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Semester_2()));
                            },
                            child: Container(
                              height: 60,
                              width: 150,
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
                                  child: Text("2 Semester",style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Semester_3()));
                            },
                            child: Container(
                              height: 60,
                              width: 150,
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
                                  child: Text("3 Semester",style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Semester_4()));
                            },
                            child: Container(
                              height: 60,
                              width: 150,
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
                                  child: Text("4 Semester",style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>Semester_5()));
                            },
                            child: Container(
                              height: 60,
                              width: 150,
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
                                  child: Text("5 Semester",style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Semester_6()));
                            },
                            child: Container(
                              height: 60,
                              width: 150,
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
                                  child: Text("6 Semester",style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Semester_7()));
                            },
                            child: Container(
                              height: 60,
                              width: 150,
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
                                  child: Text("7 Semester",style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
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

