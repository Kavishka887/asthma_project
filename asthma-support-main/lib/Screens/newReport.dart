import 'package:asthma_project/Screens/popUps.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'login.dart';


String genderRadio = "";
TextEditingController userReportActivityLevelController = new TextEditingController();
TextEditingController userReportWeeklySymptomsController = new TextEditingController();
TextEditingController userReportIntensityController = new TextEditingController();
TextEditingController userReportMedicationStatusController = new TextEditingController();
TextEditingController userReportWeightController = new TextEditingController();
TextEditingController userReportNameController =  new TextEditingController();
TextEditingController userReportAgeController = new TextEditingController();
TextEditingController userReportStageController = new TextEditingController();

class newReport extends StatefulWidget {
  const newReport({Key? key}) : super(key: key);

  @override
  State<newReport> createState() => _newReportState();
}

class _newReportState extends State<newReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 100.w,
          height: 100.h,
          color: Color(0xFF0B2046),
          child: Column(
            children: [
              Spacer(),
              Text("New Report",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp
                  )),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50.sp),topRight: Radius.circular(50.sp)),
                  color: Color(0xFFf5f5f5),
                ),
                height: 87.h,
                width: 100.w,
                child: Padding(
                  padding:   EdgeInsets.only(top: 5.h),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //SizedBox(height: 5.h,),
                          // Padding(
                          //   padding:   EdgeInsets.only(left: 15.sp),
                          //   child: Text("Name",
                          //     style: GoogleFonts.montserrat(
                          //         fontSize: 12.sp,
                          //         fontWeight: FontWeight.bold
                          //     ),),
                          // ),
                          // Padding(
                          //     padding:   EdgeInsets.only(top:5.sp,left: 15.sp,right: 15.sp),
                          //   child: TextField(
                          //     controller: userReportNameController,
                          //     style: GoogleFonts.montserrat(
                          //       fontSize: 11.sp,
                          //       fontWeight: FontWeight.normal
                          //   ) ,
                          //       decoration: InputDecoration(
                          //         filled: true,
                          //         fillColor: Colors.white,
                          //         focusedBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(width: 1,  color: Color(0xFF0B2046),),
                          //           borderRadius: BorderRadius.circular(20.sp),
                          //         ),
                          //         enabledBorder: OutlineInputBorder(
                          //           // filled: true,
                          //           // fillColor: Colors.white,
                          //           borderSide: BorderSide(width: 1, color: Colors.white),
                          //           borderRadius: BorderRadius.circular(20.sp),
                          //
                          //         ),
                          //
                          //      ),
                          //   )
                          // ),

                          SizedBox(height: 2.h,),
                          Padding(
                            padding:   EdgeInsets.only(left: 15.sp),
                            child: Text("Age",
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                          Padding(
                              padding:   EdgeInsets.only(top:5.sp,left: 15.sp,right: 15.sp),
                              child: TextField(
                                controller: userReportAgeController,
                                style: GoogleFonts.montserrat(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.normal
                                ) ,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1,  color: Color(0xFF0B2046),),
                                    borderRadius: BorderRadius.circular(20.sp),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    // filled: true,
                                    // fillColor: Colors.white,
                                    borderSide: BorderSide(width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(20.sp),

                                  ),

                                ),
                              )
                          ),


                          SizedBox(height: 2.h,),
                          Padding(
                            padding:   EdgeInsets.only(left: 15.sp),
                            child: Text("Symptoms Per Week",
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                          Padding(
                              padding:   EdgeInsets.only(top:5.sp,left: 15.sp,right: 15.sp),
                              child: TextField(
                                controller: userReportWeeklySymptomsController,
                                style: GoogleFonts.montserrat(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.normal
                                ) ,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1,  color: Color(0xFF0B2046),),
                                    borderRadius: BorderRadius.circular(20.sp),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    // filled: true,
                                    // fillColor: Colors.white,
                                    borderSide: BorderSide(width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(20.sp),

                                  ),

                                ),
                              )
                          ),

                          SizedBox(height: 2.h,),
                          Padding(
                            padding:   EdgeInsets.only(left: 15.sp),
                            child: Text("Activity Level",
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                          Padding(
                              padding:   EdgeInsets.only(top:5.sp,left: 15.sp,right: 15.sp),
                              child: TextField(
                                controller: userReportActivityLevelController,
                                style: GoogleFonts.montserrat(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.normal
                                ) ,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1,  color: Color(0xFF0B2046),),
                                    borderRadius: BorderRadius.circular(20.sp),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    // filled: true,
                                    // fillColor: Colors.white,
                                    borderSide: BorderSide(width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(20.sp),

                                  ),

                                ),
                              )
                          ),

                          SizedBox(height: 2.h,),
                          Padding(
                            padding:   EdgeInsets.only(left: 15.sp),
                            child: Text("Symptom Intensity",
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                          Padding(
                              padding:   EdgeInsets.only(top:5.sp,left: 15.sp,right: 15.sp),
                              child: TextField(
                                controller: userReportIntensityController,
                                style: GoogleFonts.montserrat(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.normal
                                ) ,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1,  color: Color(0xFF0B2046),),
                                    borderRadius: BorderRadius.circular(20.sp),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    // filled: true,
                                    // fillColor: Colors.white,
                                    borderSide: BorderSide(width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(20.sp),

                                  ),

                                ),
                              )
                          ),

                          SizedBox(height: 2.h,),
                          Padding(
                            padding:   EdgeInsets.only(left: 15.sp),
                            child: Text("Stage",
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                          Padding(
                              padding:   EdgeInsets.only(top:5.sp,left: 15.sp,right: 15.sp),
                              child: TextField(
                                controller: userReportStageController,
                                style: GoogleFonts.montserrat(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.normal
                                ) ,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1,  color: Color(0xFF0B2046),),
                                    borderRadius: BorderRadius.circular(20.sp),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    // filled: true,
                                    // fillColor: Colors.white,
                                    borderSide: BorderSide(width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(20.sp),

                                  ),

                                ),
                              )
                          ),
                          SizedBox(height: 2.h,),
                          Padding(
                            padding:   EdgeInsets.only(left: 15.sp),
                            child: Text("Weight",
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                          Padding(
                              padding:   EdgeInsets.only(top:5.sp,left: 15.sp,right: 15.sp),
                              child: TextField(
                                controller: userReportWeightController ,
                                style: GoogleFonts.montserrat(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.normal
                                ) ,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1,  color: Color(0xFF0B2046),),
                                    borderRadius: BorderRadius.circular(20.sp),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    // filled: true,
                                    // fillColor: Colors.white,
                                    borderSide: BorderSide(width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(20.sp),

                                  ),

                                ),
                              )
                          ),
                          SizedBox(height: 2.h,),
                          // Padding(
                          //   padding:   EdgeInsets.only(left: 15.sp),
                          //   child: Text("Gender",
                          //     style: GoogleFonts.montserrat(
                          //         fontSize: 12.sp,
                          //         fontWeight: FontWeight.bold
                          //     ),),
                          // ),
                          // Padding(
                          //     padding:   EdgeInsets.only(top:5.sp,left: 15.sp,right: 15.sp),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Container(
                          //           decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(20.sp),
                          //             color: Colors.white,
                          //           ),
                          //
                          //           child: Row(
                          //             children: [
                          //               Padding(
                          //                 padding: EdgeInsets.only(top: 2.0.sp, left: 8.sp),
                          //                 child: Radio<String>(
                          //                   fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF0B2046)),
                          //                   value: "Male",
                          //                   groupValue: genderRadio,
                          //                   onChanged: (value) {
                          //                     setState(() {
                          //                       genderRadio = value!;
                          //                     });
                          //                   },
                          //                 ),
                          //               ),
                          //               Padding(
                          //                 padding: EdgeInsets.only(top: 2.0.sp, left: 3.sp),
                          //                 child: Text(
                          //                     "Male",
                          //                     style: GoogleFonts.montserrat(
                          //                       color: Color.fromRGBO(179, 179, 179, 1),
                          //                       fontWeight: FontWeight.w600,
                          //                       fontSize: 10.sp,
                          //                       // letterSpacing: 1.sp
                          //                     )
                          //                 ),
                          //               ),
                          //               Padding(
                          //                 padding: EdgeInsets.only(top: 2.0.sp, left: 8.sp),
                          //                 child: Radio<String>(
                          //                   value: "Female",
                          //                   groupValue: genderRadio,
                          //                   fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF0B2046)),
                          //                   onChanged: (value) {
                          //                     setState(() {
                          //                       genderRadio = value!;
                          //
                          //                     });
                          //                   },
                          //                 ),
                          //               ),
                          //               Padding(
                          //                 padding: EdgeInsets.only(top: 2.0.sp, left: 3.sp),
                          //                 child: Text(
                          //                     "Female",
                          //                     style: GoogleFonts.montserrat(
                          //                       color: Color.fromRGBO(179, 179, 179, 1),
                          //                       fontWeight: FontWeight.w600,
                          //                       fontSize: 10.sp,
                          //                       // letterSpacing: 1.sp
                          //                     )
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         )
                          //
                          //
                          //       ],
                          //     ),
                          // ),
                          GestureDetector(
                            onTap: (){
                              saveReport(context);
                              Get.back();

                            },
                            child: Padding(
                              padding:  EdgeInsets.all(20.sp),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF0B2046),
                                      borderRadius: BorderRadius.circular(20.sp)),
                                  width: 85.w,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.sp),
                                    child: Center(
                                      child: Text(
                                        "Create Report",
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h,)
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void saveReport(BuildContext context){
  //showLoadingDialog(context, "Saving Chart . . .. ");
  final user = <String, String>{
    // "userName": userReportNameController.text,
    "userAge": userReportAgeController.text,
    // "userGender": genderRadio,
    "userActivityLevel": userReportActivityLevelController.text,
    "userWeeklySymptoms": userReportWeeklySymptomsController.text,
    "userSymptomIntensity": userReportIntensityController.text,
    "userMedicationStatus": userReportMedicationStatusController.text,
    "userWeight": userReportWeightController.text,
    "userAsthmaStage": userReportStageController.text
  };
  userReportAgeController.text = "";
  userReportActivityLevelController.text = "";
  userReportWeeklySymptomsController.text = "";
  userReportIntensityController.text = "";
  userReportWeightController.text = "";
  userReportStageController.text = "";

  GetStorage box = GetStorage();

  FirebaseFirestore.instance
      .collection(box.read("uid"))
      .doc("userDetails")
      .collection("userReports")
      .doc()
      .set(user).then((value) => {

  });
Get.back();
}
