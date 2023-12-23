import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dash_bar.dart';

class Sem extends StatelessWidget {

  final String branch;
  final String sub1;
  final String sub2;
  final String sub3;
  final String sub4;
  final String sub5;
  final Image assets;
  final Color clr;
  final double Top;
  final double Bottom;
  final double Left;
  final double Right;

  const Sem({
    super.key, required this.assets, required this.branch,
    required this.clr, required this.sub1, required this.sub2,
    required this.sub3, required this.sub4, required this.sub5,
    required this.Top, required this.Bottom, required this.Left,
    required this.Right,
  });


  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                            assets,
                            Padding(
                              padding: EdgeInsets.only(top: Top,bottom: Bottom,right: Right,left: Left),
                              child: Text(branch,style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: clr
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
                          child: Text(sub1,style: GoogleFonts.poppins(
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
                          child: Text(sub2,style: GoogleFonts.poppins(
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
                          child: Text(sub3,textAlign: TextAlign.center,style: GoogleFonts.poppins(
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
                          child: Text(sub4,style: GoogleFonts.poppins(
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
                          child: Text(sub5,textAlign: TextAlign.center,style: GoogleFonts.poppins(
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
    );
  }
}
