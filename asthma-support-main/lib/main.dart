import 'dart:async';

import 'package:asthma_project/Screens/dashboard.dart';
import 'package:asthma_project/Screens/doctorDetails.dart';
import 'package:asthma_project/Screens/newReport.dart';
import 'package:asthma_project/Screens/signUp.dart';
import 'package:asthma_project/Screens/viewChart.dart';
import 'package:asthma_project/Screens/viewDoctors.dart';
import 'package:asthma_project/Screens/viewInhalers.dart';
import 'package:asthma_project/Screens/viewMedicine.dart';
import 'package:asthma_project/Screens/viewReports.dart';
import 'package:asthma_project/Screens/walkThrough.dart';
import 'package:asthma_project/translations.dart';
import 'package:firebase_core/firebase_core.dart' as fb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';


import 'Screens/calculateAsthmaStage.dart';
import 'Screens/moreDetails.dart';
import 'Screens/login.dart';

GetStorage box = GetStorage();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseApp.initi
  await fb.Firebase.initializeApp(
  //  options: fb.DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(const MyApp());
}

class Firebase {
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

   return Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
              translations: LocaleString(),
              title: 'Asthmaly',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home:splashScreen()

          );
        }
    );

  }
}


class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    box.read("stage")!=null?
    Timer(
        Duration(seconds: 3),
            () =>
            Get.to(()=>dashboard(asthmaStage: box.read("stage")))

    ):Timer(
      Duration(seconds: 3),
          () =>
          Get.to(()=>walkThrough()));

    // loadLanguage();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 100.h,
          width: 100.w,
         // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset("assets/appLogo.png",height: 25.h,),
              ),
              SizedBox(height: 10.h,),
              Center(
                child: Container(
                  width: 5.h,
                  height: 5.h,
                  //color: Colors.white,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 1,
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
void loadLanguage(){
  Get.updateLocale(Locale('en','IN'));
  //
  box.write("selectedLanuage", "en");
}