import 'package:Remedial_App/Pages/Home_screen.dart';
import 'package:Remedial_App/Pages/ProfileScreens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class dash_bar extends StatefulWidget {
  const dash_bar({
    super.key,
  });

  @override
  State<dash_bar> createState() => _dash_barState();
}

class _dash_barState extends State<dash_bar> {
  bool isLoading = true;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: !isLoading,
          child: Container(
            height: 50.h,
            width: 350.w,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(25.r)),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurpleAccent,
                  blurRadius: 6.r,
                  spreadRadius: 2.r,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => profilePage(),
                          icon: Icon(
                            Icons.person,
                            size: 30.w,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () => Home_Screen(),
                          icon: Icon(
                            Icons.home_filled,
                            size: 30.w,
                            color: Colors.white,
                          )),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                          size: 30.w,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isLoading)
          Shimmer.fromColors(
            child: Container(
              height: 50.h,
              width: 350.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r)),
            ),
            highlightColor: Colors.grey.shade100,
            baseColor: Colors.grey.shade300,
          ),
      ],
    );
  }
}
