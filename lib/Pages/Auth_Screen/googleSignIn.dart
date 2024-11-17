import 'package:Remedial_App/Pages/Home_screen.dart';
import 'package:Remedial_App/Widgets/bottomNavigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
  }

  Future googleLogout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}

class GoogleSignInButton extends StatefulWidget {
  GoogleSignInButton({super.key});

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  final GoogleSignInProvider _googleSignInProvider = GoogleSignInProvider();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await _googleSignInProvider.googleLogin();
        FirebaseFirestore.instance
            .collection('users')
            .doc(_googleSignInProvider._user!.email)
            .set({
          "name": _googleSignInProvider._user!.displayName,
          "email": _googleSignInProvider._user!.email,
          "profile_url": _googleSignInProvider._user!.photoUrl,
          "phone": null,
          "department": null,
          "password": "",
          "role": "student",
          "gender": ""
        });
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavBar()),
            (route) => false);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign in with ',
            style: GoogleFonts.poppins(
                fontSize: 15.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
          Image.asset(
            'images/icons/Google.png',
            scale: 30,
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        elevation: 10,
        backgroundColor: Colors.black,
        minimumSize: Size(350.w, 50.h),
        shadowColor: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }
}
