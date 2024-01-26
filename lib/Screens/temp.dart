import 'dart:async';

import 'package:flutter/material.dart';

class temp extends StatefulWidget {
  const temp({super.key});

  @override
  State<temp> createState() => _tempState();
}

class _tempState extends State<temp> {
  int sec = 60;
  int min = 5;

  start_test() async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (sec > 0) {
        setState(() {
          sec--;
        });
      } else {
        timer.cancel();
      }
    });
    Timer.periodic(Duration(seconds: 60), (timer) {
      if (min > 0) {
        setState(() {
          min--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "${min.toString()}:${sec.toString()}",
            style: TextStyle(fontSize: 30),
          )),
          ElevatedButton(onPressed: () => start_test(), child: Text("start")),
        ],
      ),
    );
  }
}
