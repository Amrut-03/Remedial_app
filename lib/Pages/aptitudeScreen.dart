// import 'package:Remedial_App/Pages/ListOfTopicsSubjects/aptiTopics.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shimmer/shimmer.dart';

// class Aptitudescreen extends StatefulWidget {
//   const Aptitudescreen({
//     super.key,
//   });

//   @override
//   State<Aptitudescreen> createState() => _AptitudescreenState();
// }

// class _AptitudescreenState extends State<Aptitudescreen> {
//   bool isLoading = true;
//   @override
//   void initState() {
//     Future.delayed(Duration(seconds: 2), () {
//       setState(() {
//         isLoading = false;
//       });
//     });
//     // TODO: implement initState
//     super.initState();
//   }

//   List<String> topics = [];

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurpleAccent,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Center(
//             child: Stack(children: [
//               if (!isLoading)
//                 Visibility(
//                   visible: !isLoading,
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 50,
//                       ),
//                       Container(
//                         height: 200,
//                         width: 350,
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                             child: Stack(
//                               children: [
//                                 Image.asset(
//                                   "images/Backgrounds/back1.png",
//                                   fit: BoxFit.cover,
//                                 ),
//                                 Positioned(
//                                   bottom: 50,
//                                   child: Text(
//                                     "Computer Science Fundamentals",
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.poppins(
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black),
//                                   ),
//                                 )
//                               ],
//                             ),
//                          ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => AptitopicsList()));
//                         },
//                         child: Padding(
//                           padding: EdgeInsets.all(20),
//                           child: Container(
//                             height: 60,
//                             width: 350,
//                             decoration: BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10)),
//                                 color: Colors.black,
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Colors.deepPurpleAccent,
//                                       spreadRadius: 2,
//                                       blurRadius: 6)
//                                 ]),
//                             child: Center(
//                               child: Text(
//                                 "Choose your Subject",
//                                 style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white,
//                                     fontSize: 20),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                     ],
//                   ),
//                 )
//               else
//                 Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Shimmer.fromColors(
//                         highlightColor: Colors.grey.shade100,
//                         baseColor: Colors.grey.shade500,
//                         child: Column(
//                           children: [
//                             container(
//                               height: 200,
//                               width: 350,
//                               rad: 20,
//                             ),
//                             SizedBox(height: 20),
//                             container(
//                               height: 60,
//                               width: 350,
//                               rad: 20,
//                             ),
//                             SizedBox(height: 20),
//                             container(
//                               height: 60,
//                               width: 350,
//                               rad: 20,
//                             ),
//                             SizedBox(height: 20),
//                             container(
//                               height: 60,
//                               width: 350,
//                               rad: 20,
//                             ),
//                             SizedBox(height: 20),
//                             container(
//                               height: 60,
//                               width: 350,
//                               rad: 20,
//                             ),
//                             SizedBox(height: 20),
//                             container(
//                               height: 60,
//                               width: 350,
//                               rad: 20,
//                             ),
//                             SizedBox(height: 20),
//                             container(
//                               height: 60,
//                               width: 350,
//                               rad: 20,
//                             ),
//                             SizedBox(height: 20),
//                             container(
//                               height: 60,
//                               width: 350,
//                               rad: 20,
//                             ),
//                             SizedBox(height: 20),
//                             container(
//                               height: 60,
//                               width: 350,
//                               rad: 20,
//                             ),
//                             SizedBox(height: 20),
//                             container(
//                               height: 60,
//                               width: 350,
//                               rad: 20,
//                             ),
//                             SizedBox(height: 20),
//                             container(
//                               height: 60,
//                               width: 350,
//                               rad: 20,
//                             ),
//                             SizedBox(height: 20),
//                             container(
//                               height: 60,
//                               width: 350,
//                               rad: 20,
//                             ),
//                             SizedBox(height: 30),
//                             container(
//                               height: 40,
//                               width: 300,
//                               rad: 20,
//                             ),
//                             SizedBox(height: 30),
//                             container(
//                               height: 40,
//                               width: 300,
//                               rad: 20,
//                             ),
//                             SizedBox(height: 30),
//                             container(
//                               height: 40,
//                               width: 300,
//                               rad: 20,
//                             ),
//                             SizedBox(height: 30),
//                             container(
//                               height: 40,
//                               width: 300,
//                               rad: 20,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class container extends StatelessWidget {
//   final double height;
//   final double width;
//   final double rad;
//   const container({
//     super.key,
//     required this.height,
//     required this.width,
//     required this.rad,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       width: width,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(rad)),
//           color: Colors.white),
//     );
//   }
// }
