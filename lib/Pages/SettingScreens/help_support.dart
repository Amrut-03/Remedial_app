import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class help_support extends StatefulWidget {
  const help_support({super.key});

  @override
  State<help_support> createState() => _help_supportState();
}

class _help_supportState extends State<help_support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Container(
          height: 400.h,
          width: 200.w,
          color: Colors.black,
          child: Text(""),
        ),
      ),
    );
  }
}
