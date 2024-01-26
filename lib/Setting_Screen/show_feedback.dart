import 'package:Remedial_App/Screens/Home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class showFeedback extends StatefulWidget {
  const showFeedback({super.key});

  @override
  State<showFeedback> createState() => _showFeedbackState();
}

class _showFeedbackState extends State<showFeedback> {
  bool is_loading = true;
  var feedbacks = [];

  get_feedbacks() async {
    try {
      await FirebaseFirestore.instance
          .collection('feedback')
          .get()
          .then((snapshot) {
        for (var i in snapshot.docs) {
          String docId = i.id;
          Map<String, dynamic> feedbackData = i.data();
          feedbacks.add({'id': docId, 'feedbackData': feedbackData});
        }
      });
    } catch (e) {
      print(e);
    }
    setState(() {
      is_loading = false;
    });
  }

  @override
  void initState() {
    get_feedbacks();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Feedbacks",
          style: GoogleFonts.poppins(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
          child: Stack(
        children: [
          if (!is_loading)
            Center(
              child: Container(
                height: 700,
                width: 370,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                      itemCount: feedbacks.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          title: Text(
                            feedbacks[index]['feedbackData']['feedback'],
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(feedbacks[index]['id']),
                        ));
                      }),
                ),
              ),
            )
          else
            CircularProgressIndicator()
        ],
      )),
    );
  }
}
