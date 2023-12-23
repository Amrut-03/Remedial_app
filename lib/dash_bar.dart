import 'package:Remedial_App/Screens/Home_screen.dart';
import 'package:Remedial_App/Screens/drawer.dart';
import 'package:flutter/material.dart';

class dash_bar extends StatelessWidget {
  const dash_bar({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 350,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(25))
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_Screen()));
                    },
                    child: Container(
                      height: 40,
                      width: 30,
                      child: Image.asset("images/icons/home2.png"),
                    )
                ),
                InkWell(
                    onTap: (){
                    },
                    child: Container(
                      height: 40,
                      width: 30,
                      child: Image.asset("images/icons/user1.png"),
                    )
                ),
                InkWell(
                    onTap: (){},
                    child: Container(
                      height: 40,
                      width: 30,
                      child: Image.asset("images/icons/menu.png"),
                    )
                ),
                InkWell(
                    onTap: (){},
                    child: Container(
                      height: 40,
                      width: 30,
                      child: Image.asset("images/icons/setting1.png"),
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
