import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final marks;
  ResultPage({super.key,required this.marks});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.marks.toString()),
      ),
    );
  }
}
