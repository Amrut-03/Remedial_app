import 'package:Remedial_App/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class Forgot_screen extends StatefulWidget {
  const Forgot_screen({super.key});

  @override
  State<Forgot_screen> createState() => _Forgot_screenState();
}

class _Forgot_screenState extends State<Forgot_screen> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
            body: Stack(
              alignment: Alignment.center,
              children:[
                Container(
                  color: Colors.black,
                  height: 1000,
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children:[
                      SizedBox(height: 150,
                        width: 200,
                        child: RiveAnimation.asset("images/RiveAssets/lock.riv"),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                        child: Text("Enter Your Details",style: GoogleFonts.poppins(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        ),
                      ),
                  SizedBox(height: 20,),
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),),
                        ),
                        child: Padding(padding: EdgeInsets.only(top: 50,right: 15,left: 15,),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(150, 110, 250,3),
                                    blurRadius: 20,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText:"Enter Your email",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.black
                                            ),
                                          ),
                                          prefixIcon: Icon(Icons.mail,color: Colors.black,)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text("OR",style: TextStyle(color: Colors.grey[600]),),
                              SizedBox(height: 10,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(150, 110, 250,3),
                                    blurRadius: 20,
                                  ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText:"Enter Phone Number",
                                            hintStyle: TextStyle(color: Colors.grey),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Colors.black
                                              ),
                                            ),
                                            prefixIcon: Icon(Icons.phone,color: Colors.black,)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>login_page()));
                                },
                                child: Container(
                                  height: 50,
                                  width: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Submit",textAlign: TextAlign.center,style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25,
                                        color: Colors.white
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ),
                    ]
                  )
                )
                ],
              ),
    );
  }
}
