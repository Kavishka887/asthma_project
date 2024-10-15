import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'moreDetails.dart';
final TextEditingController sdv =TextEditingController();
class viewSymptoms extends StatefulWidget {
  const viewSymptoms({Key? key}) : super(key: key);

  @override
  State<viewSymptoms> createState() => _viewSymptomsState();
}

class _viewSymptomsState extends State<viewSymptoms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text("Symptoms",
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
                      .collection("symptomList")
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
                      return Center(child: const Text("No Symptoms Available"));
                    }
                    return ListView.builder(
                        itemCount: userSnapshot.length,
                        itemBuilder: (context, index) {
                          return Padding(
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
                              child: GestureDetector(
                                onTap: (){
                                  Get.to(()=>moreDetails(content: userSnapshot[index]["symptomDescription"], title: userSnapshot[index]["symptomName"], imageUrl: userSnapshot[index]["symptomPhoto"]));
                                  // Get.to(()=>inhalerDetails(doctorArea: userSnapshot[index]["doctorArea"], doctorContact: userSnapshot[index]["docamtorContact"], doctorHospital: userSnapshot[index]["doctorHospital"], doctorName: userSnapshot[index]["doctorName"], doctorNotes: userSnapshot[index]["doctorSpecialNotes"], doctorRegistration: userSnapshot[index]["doctorRegistration"], doctorSpeciality: userSnapshot[index]["doctorSpeciality"]));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:   EdgeInsets.only(left: 5.sp,right: 5.sp,top: 0.sp),
                                        child: Text(userSnapshot[index]["symptomName"],
                                          style: GoogleFonts.montserrat(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w600
                                          ),),
                                      ),
                                      Padding(
                                        padding:   EdgeInsets.only(left: 5.sp,right: 5.sp,top: 8.sp),
                                        child: Text(userSnapshot[index]["symptomDescription"].toString().substring(0,10) + " . . .",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.normal
                                          ),),
                                      ),

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
