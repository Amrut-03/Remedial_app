import 'package:Remedial_App/Screens/Forgot_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Remedial_App/Screens/new_account.dart';
import 'Home_screen.dart';

class login_page extends StatelessWidget {
  const login_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SafeArea(
            child: Column(
                children: [
                  SizedBox(height: 30,),
                  SizedBox(
                      child: Text("Login to your Account",style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                  ),
                  SizedBox(height: 200,
                  width: 250,
                  child: Image.asset("images/icons/102.png"),),
                ],
              ),
            ),
          Expanded(

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),),
                  ),
                child: Padding(
                  padding: EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [BoxShadow(
                              color: Color.fromRGBO(150, 110, 250,3),
                            blurRadius: 20,
                          )]
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding : EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Email or Phone Number",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide: BorderSide(
                                      color: Colors.black
                                    )
                                  ),
                                  prefixIcon: Icon(Icons.email,color: Colors.black,),
                                ),
                              ),
                            ),
                            Container(
                              padding : EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )
                                  ),
                                  prefixIcon: Icon(Icons.key,color: Colors.black,),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye,color: Colors.black,),
                                    onPressed: (){

                                    },
                                  )
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(child: Text("Forgot Password ?",style: TextStyle(color: Colors.grey),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgot_screen()),);
                      },),
                      SizedBox(height: 5,),
                      GestureDetector(child: Text("Create New Account",style: TextStyle(color: Colors.grey),),
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>New_account()));
                      },),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_Screen()));
                        },
                        child: Container(
                          height: 55,
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
                              child: Text("Login",textAlign: TextAlign.center,style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                                color: Colors.white
                              ),
                              ),
                            ),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Container(
                        child: Center(
                          child: Text("OR",style: TextStyle(
                            color: Colors.grey
                          ),),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          GestureDetector(
                            onTap: (){
                            },
                            child: Container(
                              height: 60,
                              width: 150,
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
                                child:Image.asset("images/icons/Google.png",)
                              ),
                            ),
                          ),
                          SizedBox(width:30,),
                          GestureDetector(
                            onTap: (){
                            },
                            child: Container(
                              height: 60,
                              width: 150,
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
                                  child:Image.asset("images/icons/LinkedIn.png",)
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
