import 'package:Remedial_App/Pages/StartScreens/start_screen_for_apti.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Remedial_App/Pages/StartScreens/start_screen_for_CS.dart';
import 'package:Remedial_App/Widgets/reusable_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AptitopicsList extends StatefulWidget {
  const AptitopicsList({Key? key}) : super(key: key);

  @override
  State<AptitopicsList> createState() => _AptitopicsListState();
}

class _AptitopicsListState extends State<AptitopicsList> {
  late Future<QuerySnapshot> topicsFuture;

  @override
  void initState() {
    super.initState();
    topicsFuture = getData();
  }

  Future<QuerySnapshot> getData() {
    return FirebaseFirestore.instance.collection("Aptitude Tests List").get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Select Your Subject',
          style: GoogleFonts.poppins(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: FutureBuilder<QuerySnapshot>(
          future: topicsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show a loading indicator
            } else if (snapshot.hasError) {
              return Text(
                  'Error fetching data'); // Show an error message if data fetching fails
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Text('No subjects found'); // Handle no data scenario
            } else {
              List<DocumentSnapshot> topics = snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: topics.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      SizedBox(height: 20),
                      reusable_container(
                        subject: topics[index].id, // Display document ID
                        Onclick: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Aptistart_screen(
                                    topicname: topics[index].id,
                                    length: topics.length)),
                          );
                        },
                      ),
                    ]);
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
