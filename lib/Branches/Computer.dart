import 'package:Remedial_App/Screens/floating_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../Computer Dept/Semester_1.dart';
import '../Computer Dept/Semester_2.dart';

class Computer extends StatefulWidget {
  Computer({super.key,});

  @override
  State<Computer> createState() => _ComputerState();
}

class _ComputerState extends State<Computer> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 20),
                    child: Stack(
                      children:[
                        Visibility(
                          visible: !isLoading,
                          child: Container(
                            height: 200,
                            width: 350,
                            child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                child: Stack(
                                  children: [
                                    Image.asset("images/Backgrounds/back1.png",fit: BoxFit.cover,),
                                    Padding(
                                      padding: EdgeInsets.only(top: 80,left:20,right: 20,bottom: 40),
                                      child: Text("Computer Science and Engineering",style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),),
                                    )
                                  ],
                                )
                            ),
                          ),
                        ),
                        if(isLoading)
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 200,
                              width: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Colors.white, // Use a background color matching your design
                              ),
                            ),
                          ),
                    ]
                    ),),

                  Stack(
                    children:[

                    Visibility(
                      visible: !isLoading,
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
                              "Choose your Semester",style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 25
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                      if(isLoading)
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Shimmer.fromColors(child: Container(
                            height: 60,
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                          ), baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100),
                        )
                  ]
                  ),
                  Stack(
                    children:[
                      Visibility(
                      visible: !isLoading,
                        child: Padding(
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
                      ),
                      if(isLoading)
                        Shimmer.fromColors(
                          child: Padding(padding: EdgeInsets.only(left: 30,right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          highlightColor: Colors.grey.shade100,
                          baseColor: Colors.grey.shade300,
                        )
                  ]
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Stack(
                        children:[
                          Visibility(
                            visible: !isLoading,
                            child: Padding(
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
                          ),
                          if(isLoading)
                            Shimmer.fromColors(
                              child: Padding(padding: EdgeInsets.only(left: 30,right: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    Container(
                                      height: 60,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              highlightColor: Colors.grey.shade100,
                              baseColor: Colors.grey.shade300,
                            )
                        ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Stack(
                        children:[
                          Visibility(
                            visible: !isLoading,
                            child: Padding(
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
                          ),
                          if(isLoading)
                            Shimmer.fromColors(
                              child: Padding(padding: EdgeInsets.only(left: 30,right: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    Container(
                                      height: 60,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              highlightColor: Colors.grey.shade100,
                              baseColor: Colors.grey.shade300,
                            )
                        ]
                    ),
                  ),
                  Stack(
                      children:[
                        Visibility(
                          visible: !isLoading,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30,right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                        ),
                        if(isLoading)
                          Shimmer.fromColors(
                            child: Padding(padding: EdgeInsets.only(left: 30,right: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            highlightColor: Colors.grey.shade100,
                            baseColor: Colors.grey.shade300,
                          )
                      ]
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

