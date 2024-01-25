import 'dart:async';
import 'package:Remedial_App/Screens/demo.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class splash extends StatefulWidget {
  const splash({super.key});
  
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 6), (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>demo()));});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
          child: RiveAnimation.asset('images/RiveAssets/splash.riv')),
    );
  }
}
