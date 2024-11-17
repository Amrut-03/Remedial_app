import 'dart:io';

import 'package:Remedial_App/Pages/Home_screen.dart';
import 'package:Remedial_App/Pages/Onboarding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

String? url;

class _profilePageState extends State<profilePage> {
  var url = '';
  var user_data;
  bool is_loading = true;
  bool is_info = true;
  String branch = 'Department';
  bool on_click = true;
  var other_data;
  bool is_image = true;
  PlatformFile? pickedFile;

  // fillData({required String field, required docName}) {
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(emailId)
  //       .add;
  // }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          'File Selected Successfully',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600),
        )));
  }

  Future uploadFile({required bool updatePhoto}) async {
    print("*************** file in uploading process");

    if (pickedFile == null || pickedFile!.path == null) {
      print("No file selected.");
      return;
    }

    final path = 'user_profiles/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    if (file == null) {
      print("File is null.");
      return;
    }

    try {
      // Upload the file to Firebase Storage
      final storageRef = FirebaseStorage.instance.ref().child(path);
      await storageRef.putFile(file);

      // Get the download URL
      url = await storageRef.getDownloadURL();

      if (updatePhoto) {
        // Update the profile URL in Firestore
        final userRef =
            FirebaseFirestore.instance.collection('users').doc(emailId);
        await userRef.update({'profile_url': url});
        print("****************** file uploaded $url");
      }

      setState(() {});
    } catch (e) {
      print("Error uploading file: $e");
    }

    print("****************** file uploaded ");
  }

  Future updateProfilePhoto() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          actions: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: Size(200.w, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  backgroundColor: Colors.black,
                ),
                onPressed: () => selectFile(),
                child: Text(
                  'Select Image',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await uploadFile(updatePhoto: true);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                        'File Uploaded successfully',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                  // fillData(field: 'photo_url', docName: url);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  maximumSize: Size(200.w, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  backgroundColor: Colors.black,
                ),
                child: Text(
                  'Upload',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  user_image() {
    if (data['gender'] == "Male") {
      setState(() {
        is_image = false;
      });
    }
  }

  get_user_data({required String docId}) async {
    user_data =
        await FirebaseFirestore.instance.collection("users").doc(docId).get();
    setState(() {
      is_loading = false;
    });
    user_image();
  }

  String emailId = FirebaseAuth.instance.currentUser!.email!;
  @override
  void initState() {
    get_user_data(docId: emailId);
    // TODO: implement initState
    super.initState();
  }

  updated_dialog({required String docId, required String field}) {
    TextEditingController updated_controller = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Enter Information",
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              TextField(
                controller: updated_controller,
                decoration: InputDecoration(
                  labelText: "Enter here...",
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.black, width: 2.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide:
                        BorderSide(color: Colors.deepPurpleAccent, width: 2.w),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      if (updated_controller.text == '') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                              'Fill Information correctly🚨',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            )));
                      } else {
                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(docId)
                            .update({
                          field: updated_controller.text,
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                              "Information Submitted Successfully.",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            )));
                        Navigator.pop(context);
                        get_user_data(docId: emailId);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      maximumSize: Size(800.w, 40.h),
                      backgroundColor: Colors.black,
                    ),
                    child: Text(
                      "Submit",
                      style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              ),
            ],
          );
        });
  }

  log_out() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Onboarding()),
      (route) => false, // Removes all previous routes from the stack
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          'You have Successfully logged out into your account.',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
    );
  }

  Future<void> _refreshFiles() async {
    setState(() {
      is_loading =
          true; // Set loading to true to show the shimmer effect or loading indicator
    });

    try {
      await get_user_data(docId: emailId);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            'Profile Refreshed Successfully',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      );
    } catch (e) {
      print("Error refreshing profile: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            'Failed to refresh profile. Please try again.',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      );
    } finally {
      await get_user_data(docId: emailId);
      setState(() {
        is_loading =
            false; // Set loading to false to hide the shimmer effect or loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          'Profile Page',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            if (!is_loading)
              RefreshIndicator(
                onRefresh: _refreshFiles,
                child: ListView(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0.h),
                        child: Container(
                          height: 130.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 5),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.r)),
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.r)),
                            child: (data['profile_url'] != null)
                                ? InkWell(
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.white,
                                          content: Text(
                                            'Double tap on Profile Photo.',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                        ),
                                      );
                                    },
                                    onDoubleTap: () => updateProfilePhoto(),
                                    child: Image.network(data['profile_url'],
                                        fit: BoxFit.cover),
                                  )
                                : InkWell(
                                    onDoubleTap: () => updateProfilePhoto(),
                                    child: Image.asset(
                                      "images/icons/male_profile.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        user_data["name"],
                        style: GoogleFonts.ubuntu(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Container(
                        width: 370.w,
                        height: 420.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  "Account Info",
                                  style: GoogleFonts.ubuntu(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.sp,
                                      color: Colors.white),
                                ),
                                Divider(
                                  color: Colors.white,
                                  indent: 50.w,
                                  endIndent: 50.w,
                                ),
                                SizedBox(height: 10.h),
                                Reusable_tile(
                                    text: 'name',
                                    onClick: () => updated_dialog(
                                        docId: emailId, field: 'name'),
                                    tra_icon: Icon(Icons.arrow_forward,
                                        color: Colors.white),
                                    lead_icon: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    )),
                                Divider(
                                  color: Colors.white,
                                  indent: 10.w,
                                  endIndent: 10.w,
                                ),
                                Reusable_tile(
                                    text: user_data['email'] != null
                                        ? 'email'
                                        : 'email',
                                    tra_icon: Icon(Icons.arrow_forward,
                                        color: Colors.white),
                                    lead_icon:
                                        Icon(Icons.email, color: Colors.white),
                                    onClick: () {
                                      throw ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.white,
                                          content: Text(
                                            'Email Can\'t changes',
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                Divider(
                                  color: Colors.white,
                                  indent: 10.w,
                                  endIndent: 10.w,
                                ),
                                Reusable_tile(
                                    text: user_data['phone'] != null
                                        ? 'phone'
                                        : "phone",
                                    onClick: () => updated_dialog(
                                        docId: emailId, field: 'phone'),
                                    tra_icon: Icon(Icons.arrow_forward,
                                        color: Colors.white),
                                    lead_icon:
                                        Icon(Icons.phone, color: Colors.white)),
                                Divider(
                                  color: Colors.white,
                                  indent: 10.w,
                                  endIndent: 10.w,
                                ),
                                Reusable_tile(
                                    text: user_data['department'] != null
                                        ? 'department'
                                        : "department",
                                    onClick: () => updated_dialog(
                                        docId: emailId, field: 'department'),
                                    tra_icon: Icon(Icons.arrow_forward,
                                        color: Colors.white),
                                    lead_icon: Icon(Icons.holiday_village,
                                        color: Colors.white)),
                                Divider(
                                  color: Colors.white,
                                  indent: 10.w,
                                  endIndent: 10.w,
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
                                        fontSize: 20.sp),
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
                ),
              )
            else
              Shimmer.fromColors(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      shimmer_padding(height: 130.h, width: 140.w, rad: 50.r),
                      SizedBox(height: 10.h),
                      shimmer_padding(height: 30.h, width: 200.w, rad: 10.r),
                      SizedBox(height: 10.h),
                      shimmer_padding(height: 20.h, width: 300.w, rad: 10.r),
                      SizedBox(height: 20.h),
                      shimmer_padding(height: 370.h, width: 350.w, rad: 30.r),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                highlightColor: Colors.grey.shade100,
                baseColor: Colors.grey.shade500,
              )
          ],
        ),
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
        user_data[text] != null ? user_data[text] : text,
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.sp),
      ),
      trailing: IconButton(
        icon: tra_icon,
        onPressed: () => onClick(),
      ),
    );
  }
}

class shimmer_reusable extends StatelessWidget {
  final double height;
  final double width;
  final double rad;
  const shimmer_reusable({
    super.key,
    required this.height,
    required this.width,
    required this.rad,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rad),
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
          width: 10.w,
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

Center shimmer_padding(
    {required double height, required double width, required double rad}) {
  return Center(
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rad),
        color: Colors.white,
      ),
    ),
  );
}
