import 'package:Remedial_App/Screens/Onboarding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  File? _imagefile;
  var user_data;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagefile = File(pickedFile.path);
      });
    }
    upload();
  }

  Future upload (BuildContext context)async{
    print("______________________");
    final file_name = ;
    final destination = 'files/$file_name';

    try{
      final ref =await FirebaseStorage.instance.ref(destination).child('file/');
      ref.putFile(_imagefile!);
      print("Successfully uploaded");
    }
    catch(e){
      print("********************"+e.toString());
    }
  }

  get_user_data({required String docId}) async {
    user_data =
        await FirebaseFirestore.instance.collection("users").doc(docId).get();
    setState(() {});
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
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: ()=>_getImage(),
              child: CircleAvatar(
                radius: 70,
                backgroundImage: _imagefile != null ? FileImage(_imagefile!) : null,
                child: _imagefile == null
                    ? Icon(
                        Icons.camera_alt,
                        size: 50,
                      )
                    : null,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
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
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.deepPurpleAccent,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                          onClick: () =>
                              updated_dialog(docId: emailId, field: 'name'),
                          tra_icon: Icon(Icons.edit, color: Colors.white),
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
                          tra_icon: Icon(Icons.edit, color: Colors.white),
                          lead_icon: Icon(Icons.email, color: Colors.white)),
                      Divider(
                        color: Colors.white,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Reusable_tile(
                          text: 'department',
                          onClick: () => updated_dialog(
                              docId: emailId, field: 'department'),
                          tra_icon: Icon(Icons.edit, color: Colors.white),
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
          ],
        )),
      ),
    );
  }

  ListTile Reusable_tile(
      {required Icon lead_icon,
      required Icon tra_icon,
      required String text,
      required,
      required VoidCallback onClick}) {
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
        onPressed: () => onClick,
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
