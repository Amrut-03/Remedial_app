import 'package:Remedial_App/Branches/Civil.dart';
import 'package:Remedial_App/Branches/Computer.dart';
import 'package:Remedial_App/Branches/Electrical.dart';
import 'package:Remedial_App/Branches/Mechanical.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../dash_bar.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 30,bottom: 20,left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 150,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [BoxShadow(
                    color: Colors.deepPurpleAccent,
                    blurRadius: 6,
                    spreadRadius: 2,
                  )]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [BoxShadow(
                            color: Colors.deepPurpleAccent,
                            blurRadius: 6,
                            spreadRadius: 2,
                          )]
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Image.asset("images/icons/profile.png",)
                        )
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10),
                    child: Container(
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [BoxShadow(
                          color: Colors.deepPurpleAccent,
                          blurRadius: 6,
                          spreadRadius: 2,
                        )]
                      ),
                      child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                              child: Text("Name: Amrut Khochikar",style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Text("Branch: Computer Science and Engineering",style: GoogleFonts.roboto(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Padding(
                padding: EdgeInsets.only(right: 55,left: 55,top: 10,bottom: 10),
                child: Text("WelCome For Preparation",style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black,
                  boxShadow: [BoxShadow(
                      spreadRadius: 2,
                      color: Colors.deepPurpleAccent,
                      blurRadius: 6
                  )]
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                  height: 170,
                  width: 170,
                  margin: EdgeInsets.all(10),
                  child: Image.asset("images/icons/quize.png",fit: BoxFit.cover,),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [BoxShadow(
                      color: Colors.deepPurpleAccent,
                      spreadRadius: 2,
                      blurRadius: 6,
                    )]
                  ),
                ),
                  Container(
                    height: 170,
                    width: 170,
                    margin: EdgeInsets.all(10),
                    child: Image.asset("images/icons/quize1.png",fit: BoxFit.cover,),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [BoxShadow(
                          color: Colors.deepPurpleAccent,
                          spreadRadius: 2,
                          blurRadius: 6,
                        )]
                    ),
                  ),
                  Container(
                    height: 170,
                    width: 170,
                    margin: EdgeInsets.all(10),
                    child: Image.asset("images/icons/quize2.png",fit: BoxFit.cover,),

                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [BoxShadow(
                          color: Colors.deepPurpleAccent,
                          spreadRadius: 2,
                          blurRadius: 6,
                        )]
                    ),
                  ),
                  Container(
                    height: 170,
                    width: 170,
                    margin: EdgeInsets.all(10),
                    child: Image.asset("images/icons/quize3.png",fit: BoxFit.contain,),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [BoxShadow(
                          color: Colors.deepPurpleAccent,
                          spreadRadius: 2,
                          blurRadius: 6,
                        )]
                    ),
                  ),
                  Container(
                    height: 170,
                    width: 170,
                    margin: EdgeInsets.all(10),
                    child: Image.asset("images/icons/quize4.png",fit: BoxFit.cover,),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [BoxShadow(
                          color: Colors.deepPurpleAccent,
                          spreadRadius: 2,
                          blurRadius: 6,
                        )]
                    ),
                  ),
                ]
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
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
                    "Choose your Branch",style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 25
                  ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Computer()));
                        },
                        child: Container(
                          height: 80,
                          width: 170,
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
                              child: Text("Computer Engineering",style: GoogleFonts.poppins(
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Mechanical()));
                        },
                        child: Container(
                          height: 80,
                          width: 170,
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
                              child: Text("Mechanical Engineering",style: GoogleFonts.poppins(
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
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Civil()));
                          },
                            child: Container(
                              height: 80,
                              width: 170,
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
                                  child: Text("Civil Engineering",style: GoogleFonts.poppins(
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
                            Navigator.push(context, MaterialPageRoute(builder:(context)=>Electrical()));
                          },
                          child: Container(
                            height: 80,
                            width: 170,
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
                                child: Text("Electrical Engineering",style: GoogleFonts.poppins(
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
                SizedBox(height: 10,),
                dash_bar()
              ],
            )
          ],
        ),
      ),
    );
  }
}

