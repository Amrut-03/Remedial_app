import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class reusable_container extends StatefulWidget {
  final String subject;
  final VoidCallback Onclick;
  const reusable_container({
    super.key,
    required this.subject,
    required this.Onclick,
  });

  @override
  State<reusable_container> createState() => _reusable_containerState();
}

class _reusable_containerState extends State<reusable_container> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      child: InkWell(
        onTap: widget.Onclick,
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    color: Colors.deepPurpleAccent,
                    spreadRadius: 2,
                    blurRadius: 6)
              ]),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 10),
              child: Text(
                widget.subject,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
