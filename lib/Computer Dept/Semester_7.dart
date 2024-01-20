import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screens/floating_bar.dart';

class Semester_7 extends StatelessWidget {
  const Semester_7({
    super.key,
  });

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
                          "Choose your Backlog Subject",style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20
                        ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 10),
                    child: InkWell(
                      onTap: (){

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
                            child: Text('Artificial Intelligence',style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                    child: InkWell(
                      onTap: (){
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
                            child: Text('Cloud Computing',style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                    child: InkWell(
                      onTap: (){
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
                            child: Text('Big Data Analytics',textAlign: TextAlign.center,style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                    child: InkWell(
                      onTap: (){
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
                            child: Text('Block chain Technology',style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                    child: InkWell(
                      onTap: (){
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
                            child: Text('Deep Learning',textAlign: TextAlign.center,style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  dash_bar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
