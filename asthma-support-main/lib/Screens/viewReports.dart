import 'package:asthma_project/Screens/newReport.dart';
import 'package:asthma_project/Screens/viewDetailedReport.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class viewReports extends StatefulWidget {
  const viewReports({Key? key}) : super(key: key);

  @override
  State<viewReports> createState() => _viewReportsState();
}
GetStorage box = GetStorage();
class _viewReportsState extends State<viewReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap:() {
          Get.to(()=>newReport());
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
                Text("newReport".tr,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                ),),
                Icon(Icons.add,
                  color: Colors.white,)
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Color(0xFF0B2046),
        child: Column(
          children: [
            Spacer(),
            Row(
              children: [
                //  Spacer(),
                GestureDetector(
                  onTap: () async {
                    Uri phoneno = Uri.parse('tel:+1919');
                    if (await launchUrl(phoneno)) {

                    }else{

                    }
                  },
                  child: Padding(
                    padding:   EdgeInsets.only(left: 4.sp),
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
                        )),
                  ),
                ),
                Spacer(),
                Text("reportList".tr,
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp
                    )),
                SizedBox(width: 10.w,),
                Spacer(),
              ],
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50.sp),topRight: Radius.circular(50.sp)),
                color: Color(0xFFf5f5f5),
              ),
              height: 87.h,
              width: 100.w,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection(box.read("uid"))
                      .doc("userDetails")
                      .collection("userReports")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                          width: 20.w,
                          height: 20.w,
                          child: const CircularProgressIndicator());
                    }
                    final userSnapshot = snapshot.data?.docs;
                    if (userSnapshot!.isEmpty) {
                      return Center(child: const Text("No Previous Reports Available"));
                    }
                    return ListView.builder(
                   // /   padding: EdgeInsets.zero,
                        itemCount: userSnapshot.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                             Get.to(()=> viewDetailedReport(age: userSnapshot[index]["userAge"],activityLevel: userSnapshot[index]["userActivityLevel"],intensity: userSnapshot[index]["userSymptomIntensity"],stage: userSnapshot[index]["userAsthmaStage"],weeklySymptoms: userSnapshot[index]["userWeeklySymptoms"],weight: userSnapshot[index]["userWeight"],));
                            },
                            child: Padding(
                              padding:   EdgeInsets.only(top: 10.sp,right: 10.sp,left: 10.sp),
                              child: Container(
                                width: 95.w,
                              //  height: 10.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.sp),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade400,
                                          blurRadius: 2.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(1.0, 1.0)
                                      )
                                    ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: [
                                          Padding(
                                            padding:   EdgeInsets.only(left: 5.sp,right: 5.sp,top: 0.sp),
                                            child: Row(
                                              children: [
                                                Text("reports".tr+" ID : ",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 11.sp,
                                                    fontWeight: FontWeight.w600
                                                  ),),
                                                Text(userSnapshot[index].id,
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 11.sp
                                                  ),),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:   EdgeInsets.only(left: 5.sp,right: 5.sp,top: 5.sp),
                                            child: Row(
                                              children: [
                                                Text("asthmaStage".tr+ " : " ,
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 11.sp,
                                                      fontWeight: FontWeight.w600
                                                  ),),
                                                Text(userSnapshot[index]["userAsthmaStage"],
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 11.sp
                                                  ),),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:   EdgeInsets.only(left: 5.sp,right: 5.sp,top: 5.sp),
                                            child: Row(
                                              children: [
                                                Text("SymptomIntensity".tr+ " : ",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 11.sp,
                                                      fontWeight: FontWeight.w600
                                                  ),),
                                                Text(userSnapshot[index]["userSymptomIntensity"],
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 11.sp
                                                  ),),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Icon(Icons.arrow_forward_ios)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );

                          //   ListTile(
                          //   leading: CircleAvatar(
                          //     child: Text(userSnapshot[index]["userActivityLevel"]),
                          //   ),
                          //   title: Text(userSnapshot[index]["userActivityLevel"]),
                          // );
                        });
                  }),
            )
          ],
        ),
      ),

    );
  }
}
