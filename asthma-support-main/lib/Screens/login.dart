import 'package:asthma_project/Screens/calculateAsthmaStage.dart';
import 'package:asthma_project/Screens/popUps.dart';
import 'package:asthma_project/Screens/signUp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sizer/sizer.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          color: Color(0xFF0B2046),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              Text("Login",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp
              )),
              Spacer(),
              Container( 
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(100.sp))
                ),
                width: 100.w,
                height: 85.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/login.png",
                    width: 80.w,
                    height: 80.w,),
                    Padding(
                      padding:   EdgeInsets.all(4.w),
                      child: Text("Asthma is a long-term condition affecting children and adults",
                      style: GoogleFonts.montserrat(
                        fontSize: 11.sp,
                      ),
                        textAlign: TextAlign.justify,
                      ),
                    ),

                    Spacer(),
                    GestureDetector(
                      onTap: () async {
                          await gooogleSignIn(context);
                      //  Get.to(()=> signUp());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF0B2046),
                            borderRadius: BorderRadius.circular(20.sp)
                        ),
                        width: 85.w,
                        child: Padding(
                          padding:   EdgeInsets.all(2.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Spacer(),
                              SizedBox(width:30.sp),
                              Text("Sign In with Google",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: Colors.white),),
                              Spacer(),
                              Padding(
                                padding:   EdgeInsets.all(4.0.sp),
                                child: Container(
                                  height: 25.sp,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        borderRadius: BorderRadius.circular(10.sp)
                                    ),

                                    child: Image.asset("assets/google_logo.png")),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 1.5.h,),

                    SizedBox(height: 5.h,),
                 //   Spacer()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<User> gooogleSignIn(BuildContext context) async {
  showLoadingDialog(context, "Signing you in . . ");
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    idToken: googleAuth?.idToken,
    accessToken: googleAuth?.accessToken,
  );

  UserCredential userDetails = await _firebaseAuth.signInWithCredential(credential);
  print(userDetails.user?.uid.toString());
  print(userDetails.user?.photoURL);
  print(userDetails.user?.phoneNumber);
  print(userDetails.user?.displayName);
  print(userDetails.user?.email);
  User currentUser = await _firebaseAuth.currentUser!;



  if (currentUser.uid?.isNotEmpty ?? false) {
    GetStorage box;
    FirebaseFirestore.instance.collection(currentUser.uid).limit(1).get().then((value) =>{
      if(value.size>0){
        FirebaseFirestore.instance.collection(currentUser.uid).doc("userDetails").get().then((value) => {
   // GetStorage box;
           box = GetStorage(),
          box.erase(),
          box.write("uid", currentUser.uid),
          box.write("userName", value.get("userWeeklySymptoms",)),
          box.write("userContact", value.get("userContact",)),
          box.write("userDOB", value.get("userDOB",)),
          box.write("userAge", value.get("userAge",)),
          box.write("userGender", value.get("userGender",)),
          box.write("userActivityLevel", value.get("userActivityLevel",)),
          box.write("userWeeklySymptoms", value.get("userWeeklySymptoms",)),
          box.write("userSymptomIntensity", value.get("userSymptomIntensity",)),
          box.write("userMedicationStatus", value.get("userMedicationStatus",)),
          box.write("userHeight", value.get("userHeight",)),
          box.write("selectedLanuage", "en"),

          Get.back(),
        Get.to(()=>calculateAsthmaStage(symptomsPerWeek: value.get("userWeeklySymptoms",),activityLevel:value.get("userActivityLevel"), symptomIntensity: value.get("userSymptomIntensity"), age: value.get("userAge"),userID: currentUser.uid, ))
    }),
        //Get.to(()=>calculateAsthmaStage());
        //calculate asthma stage and send to dashboard
      }else{
        Get.to(()=>signUp()),
       // print("user account exist and no user data"),

      }
    });
   // Navigator.push(context, MaterialPageRoute(builder: (context)=>moreUserDetails()));
    print(userDetails.user?.photoURL);
  } else {}
  return currentUser;
}
