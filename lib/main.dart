import 'package:Remedial_App/Screens/splash_screen.dart';
import 'package:Remedial_App/Screens/temp.dart';
import 'package:Remedial_App/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(395, 750),
      builder: (_, child) {
        return MaterialApp(
          title: "Remedial App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: GoogleFonts.ubuntu().fontFamily,
          ),
          home: splash(),
        );
      },
    );
  }
}
