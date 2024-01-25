import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ResultPage extends StatefulWidget {
  final marks;
  ResultPage({super.key, required this.marks});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool is_loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        is_loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Container(
          height: 500,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              is_loading
                  ? Lottie.asset('images/lottie/checking.json')
                  : Text(
                      widget.marks.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
              if (!is_loading)
                if (widget.marks <= 20)
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "You are Fail 😔,\n"
                      "You have to needed more Practice and More Study.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ),
                  )
                else if (widget.marks > 20 && widget.marks <= 30)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Congratulations💐\n"
                        "You are Pass,\n"
                        "But You have to needed more Practice to ace best score",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  )
                else if (widget.marks > 30 && widget.marks <= 40)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Congratulations💐\n"
                        "You are Pass,\n"
                        "But You have to needed Practice to ace Excellent score",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  )
                else if (widget.marks > 40 && widget.marks <= 50)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Congratulations💐\n"
                        "You are Pass,\n"
                        "But You have to needed Practice to ace best score",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
