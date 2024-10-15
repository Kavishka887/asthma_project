import 'package:asthma_project/Screens/secondSignUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
String genderRadio = "";
TextEditingController userNameController =  new TextEditingController();
TextEditingController userContactController  =new TextEditingController();
TextEditingController userDOBController = new TextEditingController();
TextEditingController userAgeController = new TextEditingController();


class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
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
              SizedBox(height: 2.h,),
              Text("Sign Up",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp
                  )),
              Spacer(),
              Container(
                width: 100.w,
                height: 89.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50.sp))
                ),
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
                              "Name",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 11.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.sp, top: 2.sp),
                            child: TextField(
                               controller: userNameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Thisitha Kavinda",
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
                              "Contact",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 11.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.sp, top: 2.sp),
                            child: TextField(
                               controller: userContactController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "0713358701",
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
                    GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),

                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                   
                          setState(() {
                            userDOBController.text = pickedDate.toString().substring(0,10);
                             

                          });
                        } else {}
                        print("tapped");
                      },
                      child: Container(
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
                                "Date Of Birth",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold, fontSize: 11.sp),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.sp, top: 2.sp),
                              child: TextField(
                                readOnly: true,
                               enabled: false,
                               controller: userDOBController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "2001/09/21",
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
                              "Age",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 11.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.sp, top: 2.sp),
                            child: TextField(
                              keyboardType: TextInputType.number,
                               controller: userAgeController,
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
                            "Gender",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold, fontSize: 11.sp),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 2.0.sp, left: 8.sp),
                              child: Radio<String>(
                                fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF0B2046)),
                                value: "Male",
                                groupValue: genderRadio,
                                onChanged: (value) {
                                  setState(() {
                                    genderRadio = value!;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.0.sp, left: 3.sp),
                              child: Text(
                                  "Male",
                                  style: GoogleFonts.montserrat(
                                    color: Color.fromRGBO(179, 179, 179, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp,
                                    // letterSpacing: 1.sp
                                  )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.0.sp, left: 8.sp),
                              child: Radio<String>(
                                value: "Female",
                                groupValue: genderRadio,
                                fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF0B2046)),
                                onChanged: (value) {
                                  setState(() {
                                    genderRadio = value!;

                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.0.sp, left: 3.sp),
                              child: Text(
                                  "Female",
                                  style: GoogleFonts.montserrat(
                                    color: Color.fromRGBO(179, 179, 179, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp,
                                    // letterSpacing: 1.sp
                                  )
                              ),
                            ),
                          ],
                        )


                      ],
                    ),
                  ),
                 //   Spacer(),
                    SizedBox(height: 5.h,),
                    GestureDetector(
                      onTap: (){
                       Get.to(()=>secondSignUp(userAge: userAgeController.text, userName: userNameController.text, userContact: userContactController.text,userDOB: userDOBController.text,userGender: genderRadio,));
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
