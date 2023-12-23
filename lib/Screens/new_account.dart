import 'package:Remedial_App/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class New_account extends StatelessWidget {
  const New_account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            child: Text("Create your Account",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 30,),
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
                                  hintText: "Enter Your Full Name",
                                  hintStyle: TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  )
                                ),
                                prefixIcon: Icon(Icons.sort_by_alpha,color: Colors.black,),
                              ),
                            ),
                          ),
                          Container(
                            padding : EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Email Address",
                                  hintStyle: TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black
                                  )
                                ),
                                prefixIcon: Icon(Icons.mail,color: Colors.black,),
                              ),
                            ),
                          ),
                          Container(
                            padding : EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                ),
                                prefixIcon: Icon(Icons.phone,color: Colors.black,),
                              ),
                            ),
                          ),
                          Container(
                            padding : EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "New Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                ),
                                prefixIcon: Icon(Icons.key,color: Colors.black,),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye,color: Colors.black
                                      ,),
                                    onPressed: (){

                                    },
                                  )
                              ),
                            ),
                          ),
                          Container(
                            padding : EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                ),
                                prefixIcon: Icon(Icons.key,color: Colors.black),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.remove_red_eye,color: Colors.black
                                    ,),
                                  onPressed: (){

                                  },
                                )
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
                          child: Text("Create",textAlign: TextAlign.center,style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Colors.white
                          ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(
                      color: Colors.black,
                      thickness: 0.6,
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(child: Text("Login",style: TextStyle(color: Colors.grey),),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>login_page(),));
                    },)
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
