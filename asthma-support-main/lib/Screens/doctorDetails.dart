import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class doctorDetails extends StatefulWidget {
  final String doctorName;
  final String doctorSpeciality;
  final String doctorRegistration;
  final String doctorArea;
  final String doctorHospital;
  final String doctorContact;
  final String doctorNotes;
  const doctorDetails({Key? key,required this.doctorArea, required this.doctorContact, required this.doctorHospital, required this.doctorName, required this.doctorNotes, required this.doctorRegistration, required this.doctorSpeciality}) : super(key: key);

  @override
  State<doctorDetails> createState() => _doctorDetailsState();
}

class _doctorDetailsState extends State<doctorDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF0B2046),
        ),
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            Spacer(),
            Text("doctorDetails".tr,
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp
                )),
            Padding(
              padding: EdgeInsets.all(9.sp),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.sp),
                    bottomLeft: Radius.circular(8.sp),
                    bottomRight: Radius.circular(8.sp),
                    topRight: Radius.circular(8.sp)
                ),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1BwYl1Svb2h_YRhj9tcnZk0yAuIHh3oBM03dzDa8f&s",
                ),
              ),
            ),
            Text(widget.doctorName,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 11.sp
              ),),
            SizedBox(height: 3.sp,),
            Text(widget.doctorSpeciality,
              style: GoogleFonts.montserrat(
                  fontSize: 10.sp,
                  color: Colors.white
              ),),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("doctorRegistration".tr,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 11.sp
                      ),),
                    SizedBox(height: 3.sp,),
                    Text(widget.doctorRegistration,
                      style: GoogleFonts.montserrat(
                          fontSize: 10.sp,
                          color: Colors.white
                      ),),
                  ],
                ),Column(
                  children: [
                    Text("area".tr,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 11.sp
                      ),),
                    SizedBox(height: 3.sp,),
                    Text(widget.doctorArea,
                      style: GoogleFonts.montserrat(
                          fontSize: 10.sp,
                          color: Colors.white
                      ),),
                  ],
                )

              ],
            ),

            Spacer(),
            Container(
              width: 100.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(40.sp),topLeft: Radius.circular(40.sp))
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //  Spacer(),
                  SizedBox(height: 5.h,),
                  Padding(
                    padding:   EdgeInsets.only(left: 20.sp,bottom: 15.sp,top: 20.sp),
                    child: Text(
                      "doctorDetails".tr,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                  ),
                 // Spacer(),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(20.sp)),
                      width: 90.w,
                      height: 10.h,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.0.sp, left: 8.sp),
                            child: Text(
                              "hospital".tr,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 11.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.sp, top: 2.sp),
                            child: TextField(
                              enabled: false,
                              readOnly: true,
                              //  controller: usernameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: widget.doctorHospital,
                                hintStyle: GoogleFonts.montserrat(
                                  color: Color.fromRGBO(179, 179, 179, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.sp,
                                  // letterSpacing: 1.sp
                                ),
                              ),
                              style: GoogleFonts.montserrat(
                                color: Color.fromRGBO(179, 179, 179, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp,
                                // letterSpacing: 1.sp
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  // Spacer(),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(20.sp)),
                      width: 90.w,
                      height: 10.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.0.sp, left: 8.sp),
                            child: Text(
                              "contact".tr,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 11.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.sp, top: 2.sp),
                            child: TextField(
                              enabled: false,
                              readOnly: true,
                              //  controller: usernameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: widget.doctorContact,
                                hintStyle: GoogleFonts.montserrat(
                                  color: Color.fromRGBO(179, 179, 179, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.sp,
                                  // letterSpacing: 1.sp
                                ),
                              ),
                              style: GoogleFonts.montserrat(
                                color: Color.fromRGBO(179, 179, 179, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp,
                                // letterSpacing: 1.sp
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 1.h,),
                  // Spacer(),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(20.sp)),
                      width: 90.w,
                      height: 10.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.0.sp, left: 8.sp),
                            child: Text(
                              "specialNotes".tr,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 11.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.sp, top: 2.sp),
                            child: TextField(
                              enabled: false,
                              readOnly: true,
                              //  controller: usernameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: widget.doctorNotes,
                                hintStyle: GoogleFonts.montserrat(
                                  color: Color.fromRGBO(179, 179, 179, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.sp,
                                  // letterSpacing: 1.sp
                                ),
                              ),
                              style: GoogleFonts.montserrat(
                                color: Color.fromRGBO(179, 179, 179, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp,
                                // letterSpacing: 1.sp
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Spacer(),

                ],

              ),
            )
          ],
        ) ,
      ),
    );
  }
}
