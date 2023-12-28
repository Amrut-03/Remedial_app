import 'package:Remedial_App/Screens/Home_screen.dart';
import 'package:Remedial_App/Screens/drawer.dart';
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
    Future.delayed(Duration(seconds: 2),(){
      setState(() {
        isLoading = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Visibility(
        visible: !isLoading,
          child: Container(
          height: 50.h,
          width: 350.w,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(25.r))
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_Screen()));
                        },
                        child: Container(
                          height: 40.h,
                          width: 30.w,
                          child: Image.asset("images/icons/home2.png"),
                        )
                    ),
                    InkWell(
                        onTap: (){
                        },
                        child: Container(
                          height: 40.h,
                          width: 30.w,
                          child: Image.asset("images/icons/user1.png"),
                        )
                    ),
                    InkWell(
                        onTap: (){},
                        child: Container(
                          height: 40.h,
                          width: 30.w,
                          child: Image.asset("images/icons/menu.png"),
                        )
                    ),
                    InkWell(
                        onTap: (){},
                        child: Container(
                          height: 40.h,
                          width: 30.w,
                          child: Image.asset("images/icons/setting1.png"),
                        )
                    )
                  ],
                ),
              )
            ],
          ),
                ),
        ),
        if(isLoading)
          Shimmer.fromColors(
            child: Container(
              height: 50.h,
              width: 350.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
            ),
            highlightColor: Colors.grey.shade100,
            baseColor: Colors.grey.shade300,
          )

    ]
    );
  }
}
