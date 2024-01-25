import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Home_screen.dart';
import 'Onboarding.dart';

class demo extends StatefulWidget {
  const demo({super.key});

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Home_Screen();
        } else {
          return Onboarding();
        }
      },
    );
  }
}
