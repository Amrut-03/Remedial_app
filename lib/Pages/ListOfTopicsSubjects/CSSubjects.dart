import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Remedial_App/Pages/StartScreens/start_screen_for_CS.dart';
import 'package:Remedial_App/Widgets/reusable_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CssubjectsList extends StatefulWidget {
  const CssubjectsList({Key? key}) : super(key: key);

  @override
  State<CssubjectsList> createState() => _CssubjectsListState();
}

class _CssubjectsListState extends State<CssubjectsList> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<QuerySnapshot> getData() {
    return FirebaseFirestore.instance
        .collection("CS Fundamentals Tests List")
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        title: Text(
          'Available Subjects',
          style: GoogleFonts.poppins(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: FutureBuilder<QuerySnapshot>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error fetching data');
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Text('No subjects found');
            } else {
              List<DocumentSnapshot> subjects = snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 200,
                      width: 350,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Stack(
                            children: [
                              Image.asset(
                                "images/Backgrounds/back1.png",
                                fit: BoxFit.cover,
                              ),
                              Center(
                                child: Text(
                                  "Computer Science Fundamentals",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 400.h,
                      child: ListView.builder(
                        itemCount: subjects.length,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            SizedBox(height: 20),
                            reusable_container(
                              subject: subjects[index].id,
                              Onclick: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CS_start_screen(
                                      subjectName: subjects[index].id,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ]);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
