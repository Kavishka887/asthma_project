import 'dart:convert';
import 'package:asthma_project/Screens/newReport.dart';
import 'package:asthma_project/Screens/popUps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
String genderRadio = "";
TextEditingController userReportActivityLevelController = new TextEditingController();
TextEditingController userReportWeeklySymptomsController = new TextEditingController();
TextEditingController userReportIntensityController = new TextEditingController();
TextEditingController userReportMedicationStatusController = new TextEditingController();
TextEditingController userReportWeightController = new TextEditingController();
TextEditingController userReportNameController =  new TextEditingController();
TextEditingController userReportAgeController = new TextEditingController();
TextEditingController userReportStageController = new TextEditingController();
class viewDetailedReport extends StatefulWidget {
  final String activityLevel;
  final String weeklySymptoms;
  final String intensity;
  final String weight;


  final String age;
  final String stage;

  const viewDetailedReport({Key? key, required this.age, required this.activityLevel,required this.intensity,required this.stage, required this.weeklySymptoms,required this.weight}) : super(key: key);

  @override
  State<viewDetailedReport> createState() => _viewDetailedReportState();
}

class _viewDetailedReportState extends State<viewDetailedReport> {

  @override
  Widget build(BuildContext context) {
    userReportActivityLevelController.text = widget.activityLevel;
    userReportWeeklySymptomsController.text = widget.weeklySymptoms;
    userReportIntensityController.text = widget.intensity;
    // userReportNameController.text= widget.name;
    userReportAgeController.text = widget.age;
    userReportStageController.text = widget.stage;
    userReportWeightController.text = widget.weight;
    // genderRadio = widget.gender;
    void contactUsSubmit(context, ) async {
      showLoadingDialog(context, "Sending  . . .");
      GetStorage box = GetStorage();

      // reportSentToDoctor(context, "Success", "Report Has been successfully sent to doctor");
      var emailBody =  {
        "service_id": "service_1itav8q",
        "template_id": "template_2kuy7al",
        "user_id": "jtNmnwNWwAK4ScRLl",
        "accessToken": "JmkzC_V97DhX_6-Q8Ss5N",
        "template_params": {
          "from_name": box.read("userName"),
          "message": "Current Activity Level: "+widget.activityLevel+"\n"+" Weekly Symptoms: "+widget.weeklySymptoms+"\n"+" Symptom Intensity: "+widget.intensity+"\n"+" Age: "+widget.age+ "\n"+ "Current Asthma Stage : "+ widget.stage+ "\n"+" Weight: "+widget.weight

        }
      };
      final response = await http.post(
          Uri.parse("https://api.emailjs.com/api/v1.0/email/send"),
          headers: <String, String>{
            "Content-Type": "application/json"
          },
          body:jsonEncode(emailBody)
      );

      print(response.body);
      Get.back();
      // Map<String, dynamic> map = json.decode(response.body);
      // List<dynamic> data = map["items"];
      // Navigator.pop(context);


    }
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap:() {
          contactUsSubmit(context);
          // reportSentToDoctor(context, "Doctor Details", "Enter Doctor Email information");
          // Get.to(()=>newReport());
        },
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFF0B2046),
              borderRadius: BorderRadius.circular(20.sp),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius:8.0,
                    spreadRadius: 2.0,
                    offset: Offset(2.0, 2.0)
                )
              ]
          ),
          child: Padding(
            padding:   EdgeInsets.all(9.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Send to doctor",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                  ),),
              ],
            ),
          ),
        ),
      ),
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

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         // SizedBox(height: 5.h,),
                         //  Padding(
                         //    padding:   EdgeInsets.only(left: 15.sp),
                         //    child: Text("Name",
                         //      style: GoogleFonts.montserrat(
                         //          fontSize: 12.sp,
                         //          fontWeight: FontWeight.bold
                         //      ),),
                         //  ),
                         //  Padding(
                         //      padding:   EdgeInsets.only(top:5.sp,left: 15.sp,right: 15.sp),
                         //      child: TextField(
                         //        enabled: false,
                         //        readOnly: true,
                         //        controller: userReportNameController,
                         //        style: GoogleFonts.montserrat(
                         //            fontSize: 11.sp,
                         //            fontWeight: FontWeight.normal
                         //        ) ,
                         //        decoration: InputDecoration(
                         //          filled: true,
                         //          fillColor: Colors.white,
                         //          focusedBorder: OutlineInputBorder(
                         //            borderSide: BorderSide(width: 1,  color: Color(0xFF0B2046),),
                         //            borderRadius: BorderRadius.circular(20.sp),
                         //          ),
                         //          enabledBorder: OutlineInputBorder(
                         //            // filled: true,
                         //            // fillColor: Colors.white,
                         //            borderSide: BorderSide(width: 1, color: Colors.white),
                         //            borderRadius: BorderRadius.circular(20.sp),
                         //
                         //          ),
                         //
                         //        ),
                         //      )
                         //  ),

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
                                enabled: false,
                                readOnly: true,
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
                                enabled: false,
                                readOnly: true,
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
                                enabled: false,
                                readOnly: true,
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
                                enabled: false,
                                readOnly: true,
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
                                enabled: false,
                                readOnly: true,
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
                                enabled: false,
                                readOnly: true,
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
                          // SizedBox(height: 2.h,),
                          // Spacer(),
                          // Center(
                          //   child: GestureDetector(
                          //     onTap: () async {
                          //
                          //       //  Get.to(()=>login());
                          //     },
                          //     child: Container(
                          //       decoration: BoxDecoration(
                          //           color: Color(0xFF0B2046),
                          //           borderRadius: BorderRadius.circular(20.sp),
                          //           boxShadow: [
                          //             BoxShadow(
                          //                 color: Colors.grey,
                          //                 blurRadius: 8.0,
                          //                 spreadRadius: 1.0,
                          //                 offset: Offset(2.0, 2.0)
                          //             )
                          //           ]),
                          //       width: 85.w,
                          //       child: Padding(
                          //         padding: EdgeInsets.all(10.sp),
                          //         child: Center(
                          //           child: Text(
                          //             "Send To Doctor",
                          //             style: GoogleFonts.montserrat(
                          //                 fontWeight: FontWeight.w500,
                          //                 fontSize: 12.sp,
                          //                 color: Colors.white),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Padding(
                          //   padding:   EdgeInsets.only(left: 15.sp),
                          //   child: Text("Gender",
                          //     style: GoogleFonts.montserrat(
                          //         fontSize: 12.sp,
                          //         fontWeight: FontWeight.bold
                          //     ),),
                          // ),
                          // Padding(
                          //   padding:   EdgeInsets.only(top:5.sp,left: 15.sp,right: 15.sp),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Container(
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(20.sp),
                          //           color: Colors.white,
                          //         ),
                          //
                          //         child: Row(
                          //           children: [
                          //             Padding(
                          //               padding: EdgeInsets.only(top: 2.0.sp, left: 8.sp),
                          //               child: Radio<String>(
                          //                 fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF0B2046)),
                          //                 value: "Male",
                          //                 toggleable: false,
                          //                 groupValue: genderRadio,
                          //                 onChanged: (value) {
                          //                   setState(() {
                          //                     genderRadio = value!;
                          //                   });
                          //                 },
                          //               ),
                          //             ),
                          //             Padding(
                          //               padding: EdgeInsets.only(top: 2.0.sp, left: 3.sp),
                          //               child: Text(
                          //                   "Male",
                          //                   style: GoogleFonts.montserrat(
                          //                     color: Color.fromRGBO(179, 179, 179, 1),
                          //                     fontWeight: FontWeight.w600,
                          //                     fontSize: 10.sp,
                          //                     // letterSpacing: 1.sp
                          //                   )
                          //               ),
                          //             ),
                          //             Padding(
                          //               padding: EdgeInsets.only(top: 2.0.sp, left: 8.sp),
                          //               child: Radio<String>(
                          //                 value: "Female",
                          //                 groupValue: genderRadio,
                          //                 toggleable: false,
                          //
                          //                 fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF0B2046)),
                          //                 onChanged: (value) {
                          //                   setState(() {
                          //                     genderRadio = value!;
                          //
                          //                   });
                          //                 },
                          //               ),
                          //             ),
                          //             Padding(
                          //               padding: EdgeInsets.only(top: 2.0.sp, left: 3.sp),
                          //               child: Text(
                          //                   "Female",
                          //                   style: GoogleFonts.montserrat(
                          //                     color: Color.fromRGBO(179, 179, 179, 1),
                          //                     fontWeight: FontWeight.w600,
                          //                     fontSize: 10.sp,
                          //                     // letterSpacing: 1.sp
                          //                   )
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       )
                          //
                          //
                          //     ],
                          //   ),
                          // ),
                          // GestureDetector(
                          //   onTap: (){
                          //    // saveReport();
                          //     //Get.to(()=>login());
                          //   },
                          //   child: Padding(
                          //     padding:  EdgeInsets.all(20.sp),
                          //     child: Center(
                          //       child: Container(
                          //         decoration: BoxDecoration(
                          //             color: Color(0xFF0B2046),
                          //             borderRadius: BorderRadius.circular(20.sp)),
                          //         width: 85.w,
                          //         child: Padding(
                          //           padding: EdgeInsets.all(10.sp),
                          //           child: Center(
                          //             child: Text(
                          //               "Create Report",
                          //               style: GoogleFonts.montserrat(
                          //                   fontWeight: FontWeight.w500,
                          //                   fontSize: 12.sp,
                          //                   color: Colors.white),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
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
