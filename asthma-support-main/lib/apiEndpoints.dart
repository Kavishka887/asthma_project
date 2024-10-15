import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


String baseUrl = "https://thisithakavinda.pythonanywhere.com";

Future<String> calculateStage (int age, int activityLevel, int symptomsPerWeek, int intensity) async {
  print("Get_product_List Api Called");

  //final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();


  // String? vendorToken = sharedPreferences.getString("vendorToken");
  //print(baseUrl);
 var numbers   = [age, activityLevel, symptomsPerWeek, intensity];
  var requestBody = json.encode({
    "stage":numbers,
  });
  print(requestBody);
  final response = await http.post(
      Uri.parse(baseUrl!+"/stage"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
      },
      body:  requestBody
  );
  Map<String, dynamic> map = json.decode(response.body);
  //debugPrint(json.decode(response.body));

  String tempName = json.decode(response.body)["stage"].toString();
 // sharedPreferences.setString("stage", tempName);
  GetStorage box = GetStorage();
  box.write("stage", tempName);
  print(tempName);
  return tempName;
}






