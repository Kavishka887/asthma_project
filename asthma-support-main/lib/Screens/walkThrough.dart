import 'package:asthma_project/Screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class walkThrough extends StatelessWidget {
  const walkThrough({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFf5f5f5),
        width: 100.w,
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              width: 90.w,
              height: 80.h,
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(20.sp),
                 boxShadow: [
                   BoxShadow(
                       color: Colors.grey,
                       blurRadius: 8.0,
                       spreadRadius: 1.0,
                       offset: Offset(2.0, 2.0)
                   )
                 ]
             ),
              child: Column(
                children: [
                  Spacer(),
                  Image.asset(
                      "assets/walkThrough.png",
                    width: 90.w,
                    height: 90.w,
                  ),
                  Spacer(),
                  Padding(
                    padding:   EdgeInsets.all(5.sp),
                    child: Text("There are few restrictions on your life with asthma, as long as you take care of yourself",
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:   EdgeInsets.all(5.sp),
                        child: Text("– Jackie Joyner-Kersee",
                          style: GoogleFonts.montserrat(
                            fontSize: 10.sp,

                          ),

                        ),
                      ),
                    ],
                  ),
                  Spacer()
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                Get.to(()=>login());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF0B2046),
                    borderRadius: BorderRadius.circular(20.sp)),
                width: 85.w,
                child: Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
