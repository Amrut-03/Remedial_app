import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class privacy_security extends StatefulWidget {
  const privacy_security({super.key});

  @override
  State<privacy_security> createState() => _privacy_securityState();
}

class _privacy_securityState extends State<privacy_security> {
  var user_data;
  bool is_loading = true;

  get_user_data({required String docId}) async {
    user_data =
        await FirebaseFirestore.instance.collection('users').doc(docId).get();
    setState(() {
      is_loading = false;
    });
  }

  Reset_pass({required String emailId}) async {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.black,content: Text('email sent Successfully on your Email')));
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailId);
    } catch (e) {
      print('***************');
    }
  }

  String emailid = FirebaseAuth.instance.currentUser!.email!;
  @override
  void initState() {
    get_user_data(docId: emailid);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "Privacy and Security",
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(children: [
          if (!is_loading)
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Account Details",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  indent: 50,
                  endIndent: 50,
                  color: Colors.white,
                ),
                ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  title: Text(
                    user_data['email'],
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.key,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Change Password',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () => Reset_pass(emailId: user_data['email']),
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )),
                )
              ],
            )
          else
            Center(child: CircularProgressIndicator())
        ]),
      ),
    );
  }
}
