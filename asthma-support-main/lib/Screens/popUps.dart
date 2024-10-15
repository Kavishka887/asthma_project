import 'package:asthma_project/Screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
  String genderGroup ="";

showLoadingDialog(BuildContext context, String content) {
  AlertDialog alert = AlertDialog(
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircularProgressIndicator(
          color: Color(0xFF008C79),
          strokeWidth: 1.sp,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(
                content,
                style: GoogleFonts.montserrat(),
              )),
        ),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


selectLanguage(BuildContext context, String content) {

  GetStorage box = GetStorage();
  // box.write("selectedLanuage", "en");
  genderGroup = box.read("selectedLanuage");
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.transparent,
    content: Container(
      
      decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(15.sp)),
     width: 90.w,
      height: 20.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 14.0.sp, left: 8.sp),
            child: Text(
              "Select Language",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 11.sp),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Get.updateLocale(Locale('en','IN'));
                  box.write("selectedLanuage", "en");
                //  Get.updateLocale(Locale('sin','IN'));
                  Get.back();

                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.0.sp, left: 8.sp),
                      child: Radio<String>(
                        fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF0B2046)),
                        value: "en",
                        groupValue: genderGroup,
                        onChanged: (value) {
                        //  setState(() {
                       //     genderRadio = value!;
                       //    });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.0.sp, left: 3.sp),
                      child: Text(
                          "English",
                          style: GoogleFonts.montserrat(
                            color: Color.fromRGBO(179, 179, 179, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp,
                            // letterSpacing: 1.sp
                          )
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  box.write("selectedLanuage", "sin");
                  Get.updateLocale(Locale('sin','IN'));
                // Navigator.pop(context);
                  Get.back();
                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.0.sp, left: 8.sp),
                      child: Radio<String>(
                        value: "sin",
                       groupValue: genderGroup,
                        fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF0B2046)),
                        onChanged: (value) {

                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.0.sp, left: 3.sp),
                      child: Text(
                          "Sinhala",
                          style: GoogleFonts.montserrat(
                            color: Color.fromRGBO(179, 179, 179, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp,
                            // letterSpacing: 1.sp
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding:   EdgeInsets.all(10.sp),
            child: GestureDetector(
              onTap: (){
                FirebaseAuth.instance.signOut();
                box.erase();
                Get.to(login());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: Colors.red.shade400,
                ),
                width: 50.w,
                height: 6.h,
                child: Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left:10.sp),
                      child: Text("Sign Out",
                      style: GoogleFonts.redHatDisplay(
                        fontSize: 10.sp,
                        color: Colors.white
                      ),

                      ),
                    ),
                    Padding(
                      padding:   EdgeInsets.only(right: 20.sp),
                      child: Icon(Icons.logout,
                      color: Colors.white,),
                    )
                  ],
                ),
              ),
            ),

          ),
          Spacer(),




        ],
      ),
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


