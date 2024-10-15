import 'package:asthma_project/Screens/dashboard.dart';
import 'package:asthma_project/apiEndpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class calculateAsthmaStage extends StatefulWidget {
  final String age;
  final String symptomsPerWeek;
  final String activityLevel;
  final String symptomIntensity;
  final String userID;
  const calculateAsthmaStage({Key? key,required this.age,required this.symptomIntensity,required this.activityLevel,required this.symptomsPerWeek,required this.userID}) : super(key: key);

  @override
  State<calculateAsthmaStage> createState() => _calculateAsthmaStageState();
}

class _calculateAsthmaStageState extends State<calculateAsthmaStage> {
  @override
  Widget build(BuildContext context) {

    navigateToDash(widget.age,widget.symptomIntensity,widget.activityLevel,widget.symptomsPerWeek);
    return Scaffold(
      body: Container(
        height: 100.h,
          width: 100.w,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 5.sp,),
            Container(
              height: 85.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: Color(0xFFf5f5f5),
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
                  SizedBox(height: 5.h,),
                  Image.asset("assets/calculateStage.png",
                  width: 60.w,),

                  Padding(
                    padding:   EdgeInsets.all(15.sp),
                    child: Text("There are few restrictions on your life with asthma, as long as you take care of yourself",
                      style: GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:   EdgeInsets.all(15.sp),
                        child: Text("– Jackie Joyner-Kersee",
                          style: GoogleFonts.montserrat(
                            fontSize: 10.sp,

                          ),

                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 10.h,
                    width: 10.h,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 1,

                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
            Padding(
              padding:   EdgeInsets.all(15.sp),
              child: Text("Calculating your asthma stage . . . .",
                style: GoogleFonts.montserrat(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
          
        ),
      ),
    );
  }
}

Future<void> navigateToDash( String age, String intensity, String aLevel, String symptoms) async {
  String stage= await calculateStage(int.parse(age),int.parse(intensity),int.parse(aLevel),int.parse(symptoms));
  await Future.delayed(Duration(seconds: 4));
  Get.to(()=>dashboard(asthmaStage: stage));
}
