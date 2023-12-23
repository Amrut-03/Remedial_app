import 'dart:ui';
import 'package:Remedial_App/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RiveAnimation.asset("images/icons/msg.riv"),
          Positioned.fill(child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 20,sigmaY:20),
          child: SizedBox(),),),
          SafeArea(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 260,
                  child: Column(
                    children: [
                      Text("Prepare for Exam",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 50
                        ),
                      ),
                      SizedBox(height: 30,),
                      Text(" It provides a range of questions with clear explanations, "
                          "adapts to individual learning needs, "
                          "and includes time-based simulations for realistic exam preparation. "
                          "Boost your confidence and improve your performance with this convenient and efficient study tool.",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      SizedBox(
                        height: 200,
                        width: 100,
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>login_page()));
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(40),
                                  bottomRight: Radius.circular(15),bottomLeft: Radius.circular(40)),
                              color: Colors.black,
                              border: Border.all(
                                color: Colors.white
                              ),
                              boxShadow: [BoxShadow(
                                color: Colors.deepPurpleAccent,
                                spreadRadius: 2,
                                blurRadius: 6,
                              )]
                          ),
                          child: Center(
                            child: Text("Get Start",style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                                ),
                              ),
                          ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),),
        ],
      ),
    );
  }
}
