import 'dart:io';
import 'package:Remedial_App/Pages/Home_screen.dart';
import 'package:Remedial_App/Widgets/bottomNavigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileImageUpload extends StatefulWidget {
  String name;
  String email;
  String phone;
  String department;
  String pass;
  String confirm_pass;

  String ling = 'Gender';
  String branch = 'Department';

  ProfileImageUpload({
    required this.name,
    required this.email,
    required this.phone,
    required this.department,
    required this.pass,
    required this.branch,
    required this.ling,
    required this.confirm_pass,
  });

  @override
  State<ProfileImageUpload> createState() => _ProfileImageUploadState();
}

class _ProfileImageUploadState extends State<ProfileImageUpload> {
  PlatformFile? pickedFile;
  String url = '';
  add_user() async {
    if (widget.pass != widget.confirm_pass) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            "Confirm Password is Different from Password.",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          )));
      return;
    }
    if (widget.name == '' ||
        widget.email == '' ||
        widget.phone == '' ||
        widget.pass == '' ||
        widget.branch == '' ||
        widget.ling == '' ||
        widget.confirm_pass == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          "All fields are Required.",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ));
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: widget.email, password: widget.pass);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(widget.email)
          .set({
        "name": widget.name,
        "email": widget.email,
        "phone": widget.phone,
        "gender": widget.ling,
        "department": widget.branch,
        "password": widget.pass,
        'role': 'student',
        'profile_url': url
      });
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBar()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          e.message!,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ));
      print(e);
    }
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    print("*************** file in uploading process");

    if (pickedFile == null && pickedFile!.path == null) {
      print("No file selected.");
      return;
    }

    final path = 'user_profiles/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    try {
      await ref.putFile(file);
      url = await ref.getDownloadURL();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            'Please wait...!',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
      print("****************** file uploaded $url");
    } catch (e) {
      print("Error uploading file: $e");
    }
    print("****************** file uploaded ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          'Pdf Viewer',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          if (pickedFile != null)
            Center(
              child: Container(
                height: 500,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepPurpleAccent),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: pickedFile != null
                          ? DecorationImage(
                              image: FileImage(File(pickedFile!.path!)),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => selectFile(),
              child: Text(
                'Select Photo',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  maximumSize: Size(300, 100),
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await uploadFile();
                await add_user();
              },
              child: Text(
                'Submit',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  maximumSize: Size(300, 100),
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          )
        ],
      ),
    );
  }
}
