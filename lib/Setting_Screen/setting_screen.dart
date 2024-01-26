import 'dart:async';

import 'package:Remedial_App/Screens/Home_screen.dart';
import 'package:Remedial_App/Screens/Onboarding.dart';
import 'package:Remedial_App/Screens/profile.dart';
import 'package:Remedial_App/Setting_Screen/about.dart';
import 'package:Remedial_App/Setting_Screen/feedback.dart';
import 'package:Remedial_App/Setting_Screen/help_support.dart';
import 'package:Remedial_App/Setting_Screen/privacy_security.dart';
import 'package:Remedial_App/Setting_Screen/show_feedback.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  bool is_loading = true;

  logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Onboarding()));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          'You have Successfully logged out into your account.',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, color: Colors.black),
        )));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        is_loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Settings",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(children: [
        if (!is_loading)
          Visibility(
            visible: !is_loading,
            child: Center(
              child: Container(
                height: 600,
                width: 370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  height: 600,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Reusable_list(
                          lead_icon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          tra_icon:
                              Icon(Icons.arrow_forward, color: Colors.white),
                          text: 'Account',
                          onClick: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: profilePage(),
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    duration: Duration(milliseconds: 500)));
                          }),
                      Divider(
                        color: Colors.white,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Reusable_list(
                          lead_icon: Icon(Icons.lock, color: Colors.white),
                          tra_icon:
                              Icon(Icons.arrow_forward, color: Colors.white),
                          text: 'Privacy and Security',
                          onClick: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: privacy_security(),
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    duration: Duration(milliseconds: 500)));
                          }),
                      Divider(
                        color: Colors.white,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Reusable_list(
                          lead_icon:
                              Icon(Icons.notifications, color: Colors.white),
                          tra_icon:
                              Icon(Icons.arrow_forward, color: Colors.white),
                          text: 'Feedback',
                          onClick: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: feedback(),
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    duration: Duration(milliseconds: 500)));
                          }),
                      Divider(
                        color: Colors.white,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Reusable_list(
                          lead_icon:
                              Icon(Icons.headphones, color: Colors.white),
                          tra_icon:
                              Icon(Icons.arrow_forward, color: Colors.white),
                          text: 'Help and Support',
                          onClick: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: help_support(),
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    duration: Duration(milliseconds: 500)));
                          }),
                      Divider(
                        color: Colors.white,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Reusable_list(
                          lead_icon:
                              Icon(Icons.question_mark, color: Colors.white),
                          tra_icon:
                              Icon(Icons.arrow_forward, color: Colors.white),
                          text: 'About',
                          onClick: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: about(),
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    duration: Duration(milliseconds: 500)));
                          }),
                      Divider(
                        color: Colors.white,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Visibility(
                        visible: data['role'] == 'admin',
                        child: Column(
                          children: [
                            Reusable_list(
                                lead_icon:
                                    Icon(Icons.lock, color: Colors.white),
                                tra_icon: Icon(Icons.arrow_forward,
                                    color: Colors.white),
                                text: 'show feedback',
                                onClick: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: showFeedback(),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          duration:
                                              Duration(milliseconds: 500)));
                                }),
                            Divider(
                              color: Colors.white,
                              indent: 10,
                              endIndent: 10,
                            ),
                          ],
                        ),
                      ),
                      Reusable_list(
                          lead_icon: Icon(Icons.logout, color: Colors.white),
                          tra_icon:
                              Icon(Icons.arrow_forward, color: Colors.white),
                          text: 'Logout',
                          onClick: () => logout()),
                      Divider(
                        color: Colors.white,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        else
          Shimmer.fromColors(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  shimmer_padding(height: 500.h, width: 350.w, rad: 30.r),
                  SizedBox(height: 10),
                ],
              ),
            ),
            highlightColor: Colors.grey.shade100,
            baseColor: Colors.grey.shade500,
          )
      ]),
    );
  }
}

class Reusable_list extends StatelessWidget {
  final Icon lead_icon;
  final Icon tra_icon;
  final String text;
  final VoidCallback onClick;

  Reusable_list(
      {super.key,
      required this.lead_icon,
      required this.tra_icon,
      required this.text,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: lead_icon,
      title: Text(
        text,
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
