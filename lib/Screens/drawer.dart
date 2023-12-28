import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: CircleAvatar(radius: 70.h,
            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
          ),
        ),
        Expanded(
          child: Container(
            height: 1000.h,width: 400.w,
            decoration: BoxDecoration(
              color: Color(0xFFF50057),
              borderRadius: BorderRadius.only(topRight:Radius.circular(20.r),
                  topLeft:Radius.circular(20.r)),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                          height: 30.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.r)),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text("Profile",style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            ),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: 30.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        ),
                        child: Center(
                          child: Text("Privacy",style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: 30.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        ),
                        child: Center(
                          child: Text("Setting",style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: 30.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        ),
                        child: Center(
                          child: Text("Help",style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: 30.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text("Progrss",style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){
                      },
                      child: Container(
                        height: 30.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white
                        ),
                        child: Center(
                          child: Text("Features",style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: 30.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.r)),
                            color: Colors.white
                        ),
                        child: Center(
                          child: Text("About",style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: 30.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.r)),
                            color: Colors.white
                        ),
                        child: Center(
                          child: Text("Notifications",style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

