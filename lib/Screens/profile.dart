import 'package:Remedial_App/Screens/Home_screen.dart';
import 'package:Remedial_App/Screens/Onboarding.dart';
import 'package:Remedial_App/Setting_Screen/setting_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  var user_data;
  bool is_loading = true;
  bool is_info = true;

  get_user_data({required String docId}) async {
    user_data =
        await FirebaseFirestore.instance.collection("users").doc(docId).get();
    setState(() {
      is_loading = false;
    });
    user_image();
  }

  user_image(){
    if(user_data['gender']== 'Male' || user_data['gender']=='male'){
      setState(() {
        is_info = false;
      });
    }
  }

  String emailId = FirebaseAuth.instance.currentUser!.email!;
  @override
  void initState() {
    get_user_data(docId: emailId);
    // TODO: implement initState
    super.initState();
  }

  updated_dialog({required String docId, required String field}){
    TextEditingController updated_controller = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Edit Name"),
            actions: [
              TextField(
                controller: updated_controller,
                decoration: InputDecoration(
                  hintText: "Enter your Name",
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(docId)
                        .update({
                      field: updated_controller.text,
                    });
                    Navigator.pop(context);
                    get_user_data(docId: emailId);
                  },
                  child: Text("Submit")),
            ],
          );
        });
  }

  log_out() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Onboarding()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.deepPurpleAccent,
          color: Colors.black,
          onTap: (index) async {
            if (index == 0) {
              await Future.delayed(Duration(milliseconds: 400));
              Navigator.pushReplacement(context, PageTransition(child: Home_Screen(), type:PageTransitionType.leftToRight,
                  duration: Duration(milliseconds: 300)));
            }
            else if (index == 1) {
              await Future.delayed(Duration(milliseconds: 400));
              Navigator.push(context, PageTransition(child: profilePage(), type:PageTransitionType.bottomToTop,
                  duration: Duration(milliseconds: 300)));
            }
            else if (index == 2) {
              await Future.delayed(Duration(milliseconds: 400));
              Navigator.push(context, PageTransition(child: setting(), type:PageTransitionType.rightToLeft,
                  duration: Duration(milliseconds: 300)));
            }
          },
          items: [
            Icon(Icons.arrow_back, color: Colors.white),
            Icon(Icons.person,color: Colors.white),
            Icon(Icons.settings, color: Colors.white),
          ],),
      body: SafeArea(
        child: Center(
            child: Stack(
              children:[
                if(!is_loading)
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: is_info ? Image.asset(
                          "images/avaters/female_pic.png",
                        ) : Image.asset(
                          "images/avaters/male_pic.png",
                        ),
                      ),
                      SizedBox(
                          height: 10
                      ),
                      Text(
                        user_data["name"],
                        style: GoogleFonts.ubuntu(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        user_data["department"],
                        style: GoogleFonts.ubuntu(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Container(
                          width: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                            color: Colors.deepPurpleAccent,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    "Account Info",
                                    style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: Colors.white),
                                  ),
                                  Divider(
                                    color: Colors.white,
                                    indent: 50,
                                    endIndent: 50,
                                  ),
                                  SizedBox(height: 30),
                                  Reusable_tile(
                                      text: 'name',
                                      onClick: () =>updated_dialog(docId: emailId, field: 'name'),
                                      tra_icon: Icon(Icons.arrow_forward, color: Colors.white),
                                      lead_icon: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      )),
                                  Divider(
                                    color: Colors.white,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  Reusable_tile(
                                      text: 'phone',
                                      onClick: () =>
                                          updated_dialog(docId: emailId, field: 'phone'),
                                      tra_icon: Icon(Icons.arrow_forward, color: Colors.white),
                                      lead_icon: Icon(Icons.email, color: Colors.white)),
                                  Divider(
                                    color: Colors.white,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  Reusable_tile(
                                      text: 'gender',
                                      onClick: () =>
                                          updated_dialog(docId: emailId, field: 'gender'),
                                      tra_icon: Icon(Icons.arrow_forward, color: Colors.white),
                                      lead_icon: Icon(Icons.male, color: Colors.white)),
                                  Divider(
                                    color: Colors.white,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  Reusable_tile(
                                      text: 'department',
                                      onClick: () => updated_dialog(
                                          docId: emailId, field: 'department'),
                                      tra_icon: Icon(Icons.arrow_forward, color: Colors.white),
                                      lead_icon:
                                      Icon(Icons.holiday_village, color: Colors.white)),
                                  Divider(
                                    color: Colors.white,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    title: Text(
                                      "Logout",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    trailing: IconButton(
                                      onPressed: () => log_out(),
                                      icon: Icon(
                                        Icons.logout,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  CircularProgressIndicator(),
        ]
            )),
      ),
    );
  }

  ListTile Reusable_tile(
      {required Icon lead_icon,
      required Icon tra_icon,
      required String text,
      required VoidCallback onClick()}) {
    return ListTile(
      leading: lead_icon,
      title: Text(
        user_data[text],
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      trailing: IconButton(
        icon: tra_icon,
        onPressed: () => onClick(),
      ),
    );
  }
}

class user_profile_fields extends StatefulWidget {
  const user_profile_fields({
    super.key,
    required this.user_data_,
    required this.size,
    required this.icon,
  });

  final String user_data_;
  final double size;
  final IconButton icon;

  @override
  State<user_profile_fields> createState() => _user_profile_fieldsState();
}

class _user_profile_fieldsState extends State<user_profile_fields> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.icon,
        SizedBox(
          width: 10,
        ),
        Text(
          widget.user_data_,
          textAlign: TextAlign.center,
          style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.bold,
              fontSize: widget.size,
              color: Colors.white),
        ),
      ],
    );
  }
}
