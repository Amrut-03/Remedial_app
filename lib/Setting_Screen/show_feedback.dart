import 'package:flutter/material.dart';

class showFeedback extends StatefulWidget {
  const showFeedback({super.key});

  @override
  State<showFeedback> createState() => _showFeedbackState();
}

class _showFeedbackState extends State<showFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        height: 500,
        width: 350,
        child: Text(
          "hii"
        ),
      ),
    );
  }
}
