import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:asthma_project/Screens/calculateAsthmaStage.dart';


TextEditingController userActivityLevelController = new TextEditingController();
TextEditingController userWeeklySymptomsController = new TextEditingController();
TextEditingController userIntensityController = new TextEditingController();
TextEditingController userMedicationStatusController = new TextEditingController();
TextEditingController userHeightController = new TextEditingController();

class secondSignUp extends StatefulWidget {
  final String userName;
  final String userContact;
  final String userDOB;
  final String userAge;
  final String userGender;
  const secondSignUp(
      {Key? key,
      required this.userName,
      required this.userAge,
      required this.userContact,
      required this.userDOB,
      required this.userGender})
      : super(key: key);

  @override
  State<secondSignUp> createState() => _secondSignUpState();
}

class _secondSignUpState extends State<secondSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 100.w,
          height: 100.h,
          color: Color(0xFF0B2046),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              SizedBox(
                height: 2.h,
              ),
              Text("Sign Up",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp)),
              Spacer(),
              Container(
                width: 100.w,
                height: 89.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50.sp))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(20.sp)),
                      width: 90.w,
                      height: 11.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.0.sp, left: 8.sp),
                            child: Text(
                              "Activity Levels",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 11.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.sp, top: 2.sp),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: userActivityLevelController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter a range from 1 - 4",
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
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(20.sp)),
                      width: 90.w,
                      height: 11.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.0.sp, left: 8.sp),
                            child: Text(
                              "Weekly Symptoms",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 11.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.sp, top: 2.sp),
                            child: TextField(
                              controller: userWeeklySymptomsController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "21",
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
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(20.sp)),
                      width: 90.w,
                      height: 11.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.0.sp, left: 8.sp),
                            child: Text(
                              "Intensity",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 11.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.sp, top: 2.sp),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: userIntensityController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter a range from 1 - 4",
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
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(20.sp)),
                      width: 90.w,
                      height: 11.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.0.sp, left: 8.sp),
                            child: Text(
                              "Medication Status",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 11.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.sp, top: 2.sp),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: userMedicationStatusController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Under Medication",
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
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(20.sp)),
                      width: 90.w,
                      height: 11.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.0.sp, left: 8.sp),
                            child: Text(
                              "Height",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 11.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.sp, top: 2.sp),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: userHeightController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "180",
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
                    //   Spacer(),
                    SizedBox(
                      height: 5.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        signUp(widget.userName,widget.userContact,widget.userDOB,widget.userAge,widget.userGender);
                        //   Get.to(()=>login());
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
                              "Next",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void signUp(String name, String contact,String DOB, String age, String gender )async{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? userId = await  _firebaseAuth.currentUser?.uid;
  final user = <String, String>{
    "userName": name,
    "userContact": contact,
    "userDOB": DOB,
    "userAge": age,
    "userGender": gender,
    "userActivityLevel": userActivityLevelController.text,
    "userWeeklySymptoms": userWeeklySymptomsController.text,
    "userSymptomIntensity": userIntensityController.text,
    "userMedicationStatus": userMedicationStatusController.text,
    "userHeight": userHeightController.text
  };
  GetStorage box;
  FirebaseFirestore.instance
      .collection(userId.toString())
      .doc("userDetails")
      .set(user).then((value) => {
    box = GetStorage(),
    box.erase(),
    box.write("uid",  userId),
    box.write("userName", name),
    box.write("userContact", contact),
    box.write("userDOB", DOB),
    box.write("userAge", age),
    box.write("userGender", gender),
    box.write("userActivityLevel",userActivityLevelController.text),
    box.write("userWeeklySymptoms", userWeeklySymptomsController.text),
    box.write("userSymptomIntensity", userIntensityController.text),
    box.write("userMedicationStatus", userMedicationStatusController.text),
    box.write("userHeight", userHeightController.text),
        Get.to(()=>calculateAsthmaStage(symptomIntensity:userIntensityController.text,symptomsPerWeek:userWeeklySymptomsController.text ,age:age ,activityLevel: userActivityLevelController.text, userID: userId.toString(),) ),

  });
}
