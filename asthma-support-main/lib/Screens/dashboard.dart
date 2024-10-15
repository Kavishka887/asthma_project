import 'package:asthma_project/Screens/newReport.dart';
import 'package:asthma_project/Screens/popUps.dart';
import 'package:asthma_project/Screens/viewChart.dart';
import 'package:asthma_project/Screens/viewDoctors.dart';
import 'package:asthma_project/Screens/viewInhalers.dart';
import 'package:asthma_project/Screens/viewMedicine.dart';
import 'package:asthma_project/Screens/viewReports.dart';
import 'package:asthma_project/Screens/viewSymptoms.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';


class dashboard extends StatefulWidget {
  final String asthmaStage;
  const dashboard({Key? key, required this.asthmaStage}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}
var userName = "".obs;
GetStorage box = GetStorage();
class _dashboardState extends State<dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Get.updateLocale(Locale(box.read("selectedLanuage"),'IN'));
    //
    //box.write("selectedLanuage", "en");
  }

  @override
  Widget build(BuildContext context) {
     // loadLanguage();
     getUserName();
    return Scaffold(
      //
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            Row(
              children: [
                Padding(
                  padding:   EdgeInsets.only(left: 4.sp),
                  child: GestureDetector(
                    onTap: () async {
                      Uri phoneno = Uri.parse('tel:+1919');
                      if (await launchUrl(phoneno)) {

                      }else{

                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.sp),
                            color: Colors.red
                        ),
                        child: Padding(
                          padding:   EdgeInsets.all(8.sp),
                          child: Padding(
                            padding:   EdgeInsets.all(2.sp),
                            child: Text(
                              "SOS",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white
                              ),

                            ),
                          ),
                        )
                    ),
                  ),
                ),
                // Padding(
                //   padding:   EdgeInsets.all(10.sp),
                //   child: Container(
                //     width: 2.h,
                //       height: 2.h,
                //     color: Colors.red,
                //   ),
                // ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    selectLanguage(context, "Select your preferred language");
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Image.asset(
                      "assets/dashboreMoreIcon.png",
                      width: 3.5.h,
                      height: 3.5.h,
                    ),
                  ),
                ),

                // Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1BwYl1Svb2h_YRhj9tcnZk0yAuIHh3oBM03dzDa8f&s",
                // height: 3.h,
                //   width: 3.h,
                // )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.sp),
              child: Text(
                "welcome".tr + " "+userName.value,
                style: GoogleFonts.montserrat(
                    fontSize: 13.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.sp),
              child: Text(
                "welcome2".tr,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.normal, fontSize: 10.sp),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15.sp),
                child: Container(
                  width: 90.w,
                  //: 15.h,

                  decoration: BoxDecoration(
                      color: widget.asthmaStage == "1".toString()
                          ? Color(0xFFf5f5f5)
                          : widget.asthmaStage == "2".toString()
                              ? Color(0xFFDFFFDF)
                              : widget.asthmaStage == "3"
                                  ? Color(0xFFFFFFD0)
                                  : Color(0xFFFF6B6B),
                      borderRadius: BorderRadius.circular(20.sp),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 8.0,
                            spreadRadius: 1.0,
                            offset: Offset(2.0, 2.0))
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.sp),
                        child: Text(
                          "dashboardAsthmaStage1".tr+" \n" + widget.asthmaStage + "dashboardAsthmaStage2".tr,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 11.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                         onTap: (){
                           Uri learnMore = Uri.parse('https://www.chp.edu/our-services/pulmonology/services/asthma/resources/levels',);
                            launchUrl(learnMore,mode: LaunchMode.externalApplication);
                         },
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 15.sp,
                                  right: 15.sp,
                                  top: 4.sp,
                                  bottom: 4.sp),
                              child: Text(
                                "learnMore".tr,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => viewDoctors());
                  },
                  child: Padding(
                    padding: EdgeInsets.all(3.0.sp),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.sp),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 0.5,
                                offset: Offset(5.0, 5.0))
                          ]),
                      width: 100.w / 2 - 25.sp,
                      height: 100.w / 2 - 35.sp,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(),
                          Image.asset(
                            "assets/doctorIcon.png",
                            height: 50.sp,
                            width: 50.sp,
                          ),
                          // Image.asset("assets/customized_sos_icon.png",
                          //   height: 30.sp,
                          //   width: 30.sp,),
                          SizedBox(height: 20.sp),
                          Text(
                            "doctors".tr,
                            style: GoogleFonts.montserratAlternates(
                                fontSize: 10.sp, color: Color(0xFF757575)),
                          ),
                          Spacer()
                        ],
                      )),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => viewReports());
                  },
                  child: Padding(
                    padding: EdgeInsets.all(3.0.sp),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.sp),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 0.5,
                                offset: Offset(5.0, 5.0))
                          ]),
                      width: 100.w / 2 - 25.sp,
                      height: 100.w / 2 - 35.sp,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(),
                          Image.asset(
                            "assets/reportsIcon.png",
                            height: 50.sp,
                            width: 50.sp,
                          ),
                          // Image.asset("assets/customized_sos_icon.png",
                          //   height: 30.sp,
                          //   width: 30.sp,),
                          SizedBox(height: 20.sp),
                          Text(
                            "reports".tr,
                            style: GoogleFonts.montserratAlternates(
                                fontSize: 10.sp, color: Color(0xFF757575)),
                          ),
                          Spacer()
                        ],
                      )),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.all(3.0.sp),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.sp),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                              spreadRadius: 0.5,
                              offset: Offset(5.0, 5.0))
                        ]),
                    width: 100.w / 2 - 25.sp,
                    height: 100.w / 2 - 35.sp,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => viewChart());
                      },
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(),
                          Image.asset(
                            "assets/chartsIcon.png",
                            height: 50.sp,
                            width: 50.sp,
                          ),
                          // Image.asset("assets/customized_sos_icon.png",
                          //   height: 30.sp,
                          //   width: 30.sp,),
                          SizedBox(height: 20.sp),
                          Text(
                            "charts".tr,
                            style: GoogleFonts.montserratAlternates(
                                fontSize: 10.sp, color: Color(0xFF757575)),
                          ),
                          Spacer()
                        ],
                      )),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => viewSymptoms());
                  },
                  child: Padding(
                    padding: EdgeInsets.all(3.0.sp),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.sp),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 0.5,
                                offset: Offset(5.0, 5.0))
                          ]),
                      width: 100.w / 2 - 25.sp,
                      height: 100.w / 2 - 35.sp,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(),
                          Image.asset(
                            "assets/symptomsIcon.png",
                            height: 50.sp,
                            width: 50.sp,
                          ),
                          // Image.asset("assets/customized_sos_icon.png",
                          //   height: 30.sp,
                          //   width: 30.sp,),
                          SizedBox(height: 20.sp),
                          Text(
                            "symptoms".tr,
                            style: GoogleFonts.montserratAlternates(
                                fontSize: 10.sp, color: Color(0xFF757575)),
                          ),
                          Spacer()
                        ],
                      )),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => viewInhalers());
                  },
                  child: Padding(
                    padding: EdgeInsets.all(3.0.sp),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.sp),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 0.5,
                                offset: Offset(5.0, 5.0))
                          ]),
                      width: 100.w / 2 - 25.sp,
                      height: 100.w / 2 - 35.sp,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(),
                          Image.asset(
                            "assets/inhalerIcon.png",
                            height: 50.sp,
                            width: 50.sp,
                          ),
                          // Image.asset("assets/customized_sos_icon.png",
                          //   height: 30.sp,
                          //   width: 30.sp,),
                          SizedBox(height: 20.sp),
                          Text(
                            "inhalers".tr,
                            style: GoogleFonts.montserratAlternates(
                                fontSize: 10.sp, color: Color(0xFF757575)),
                          ),
                          Spacer()
                        ],
                      )),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => viewMedicine());
                  },
                  child: Padding(
                    padding: EdgeInsets.all(3.0.sp),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.sp),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 0.5,
                                offset: Offset(5.0, 5.0))
                          ]),
                      width: 100.w / 2 - 25.sp,
                      height: 100.w / 2 - 35.sp,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(),
                          Image.asset(
                            "assets/medicineIcon.png",
                            height: 50.sp,
                            width: 50.sp,
                          ),
                          // Image.asset("assets/customized_sos_icon.png",
                          //   height: 30.sp,
                          //   width: 30.sp,),
                          SizedBox(height: 20.sp),
                          Text(
                            "medicine".tr,
                            style: GoogleFonts.montserratAlternates(
                                fontSize: 10.sp, color: Color(0xFF757575)),
                          ),
                          Spacer()
                        ],
                      )),
                    ),
                  ),
                ),
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
void getUserName(){
  FirebaseAuth firebaseAuth =FirebaseAuth.instance;
  GetStorage box = GetStorage();

 userName.value= firebaseAuth.currentUser?.displayName as String;
  box.write("userName", userName.value);
}