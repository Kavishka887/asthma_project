import 'dart:convert';

import 'dart:math';

import 'package:asthma_project/Screens/popUps.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import '../apiEndpoints.dart';
List<Color> gradientColors = [
  Colors.blueAccent,
  Colors.blueGrey,
];
 var y1 = 0.obs;
var y2 = 0.obs;
var y3 = 0.obs;
var y4 = 0.obs;
var maxY = 0.obs;

List<dynamic> apiData = [];
GetStorage box = GetStorage();
class viewChart extends StatefulWidget {
  const viewChart({Key? key}) : super(key: key);

  @override
  State<viewChart> createState() => _viewChartState();
}

class _viewChartState extends State<viewChart> {
  @override
  Widget build(BuildContext context) {
    getChartData(context);
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Color(0xFF0B2046),
        child: Column(
          children: [
            Spacer(),
            Text("Predicted Chart \n Symptoms Per Week",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp
                ),
              textAlign: TextAlign.center
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50.sp),topRight: Radius.circular(50.sp)),
                color: Color(0xFFf5f5f5),
              ),
              height: 87.h,
              width: 100.w,
              child:
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50.sp),topRight: Radius.circular(50.sp)),
                  color: Color(0xFFf5f5f5),
                ),
                height: 80.h,
                width: 100.w,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: 80.w,
                          height: 60.h,
                          child: Obx(() => LineChart(
                              mainData()
                          ),)
                        ),
                      ),
                      Padding(
                        padding:   EdgeInsets.all(12.sp),
                        child: Text("This chart is generated based on the information from the previously entred reports, and contain information on the Symptoms which can be seen on the next few weeks. Therefore act upon them to live a healthy lif ",
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12.sp
                            ),
                            textAlign: TextAlign.justify
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),

      // Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.only(topLeft: Radius.circular(50.sp),topRight: Radius.circular(50.sp)),
      //     color: Color(0xFFf5f5f5),
      //   ),
      //   height: 90.h,
      //   width: 100.w,
      //   child: Center(
      //     child: Container(
      //       width: 90.w,
      //       height: 70.h,
      //       child: LineChart(
      //         mainData()
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

}

LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: 1,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.black,
          strokeWidth: 0.5,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color:Colors.black,
          strokeWidth: 0.5,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
         // getTitlesWidget: leftTitleWidgets,
          reservedSize: 42,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d)),
    ),
    minX: 0,
    maxX: 3,
    minY: 0,
    maxY: maxY.value+5,
    lineBarsData: [
      LineChartBarData(
        spots:   [
          FlSpot(0, y1.toDouble()),
          FlSpot(1, y2.toDouble()),
          FlSpot(2, y3.toDouble()),
          FlSpot(3, y4.toDouble()),
         // FlSpot(4, 4),
        ],
        isCurved: true,
        gradient: LinearGradient(
          colors: gradientColors
              .map((color) => color.withOpacity(0.3))
              .toList(),
        ),
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: gradientColors
                .map((color) => color.withOpacity(0.3))
                .toList(),
          ),
        ),
      ),
    ],
  );
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  //   style = GoogleFonts.redHatDisplay(
  //   fontWeight: FontWeight.bold,
  //   fontSize: 16,
  // );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text =   Text('Week 1', style: GoogleFonts.redHatDisplay(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ));
      break;
    case 1:
      text =   Text('Week 2', style: GoogleFonts.redHatDisplay(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ));
      break;
    case 2:
      text =   Text('Week 3', style: GoogleFonts.redHatDisplay(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ));
      break;
    case 3:
      text =   Text('Week 4', style: GoogleFonts.redHatDisplay(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ));
      break;
    default:
      text =   Text('', style: GoogleFonts.redHatDisplay(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ));
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  //   style = TextStyle(
  //   fontWeight: FontWeight.bold,
  //   fontSize: 15,
  // );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '10';
      break;
    case 3:
      text = '20';
      break;
    case 5:
      text = '30';
      break;
    default:
      return Container();
  }

  return Text(text, style: GoogleFonts.redHatDisplay(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  ), textAlign: TextAlign.left);
}

Future<void> getChartData(BuildContext context) async {
  // showLoadingDialog(context, "Loading Chart . . ");

  //Age,active level,intencity,stage
  final reportSet =await  FirebaseFirestore.instance
      .collection(box.read("uid"))
      .doc("userDetails")
      .collection("userReports")
      .get();
  for(int i=0;i<reportSet.size;i++){
    var tempArray   = [int.parse(reportSet.docs[i]["userAge"]), int.parse(reportSet.docs[i]["userActivityLevel"]), int.parse(reportSet.docs[i]["userSymptomIntensity"]), int.parse(reportSet.docs[i]["userAsthmaStage"])];
   apiData.add(tempArray);
  }
  var requestBody = json.encode({
    "plot":apiData,
  });
  final response = await http.post(
      Uri.parse(baseUrl!+"/plot"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
      },
      body:  requestBody
  );
  // Map<String, dynamic> map = json.decode(response.body)["chart"];
  y1.value = json.decode(response.body)["chart"][0]["y"];
  y2.value = json.decode(response.body)["chart"][1]["y"];
  y3.value = json.decode(response.body)["chart"][2]["y"];
  y4.value = json.decode(response.body)["chart"][3]["y"];
  var tempMax = max(y1.value,y2.value);
  tempMax = max(tempMax,y3.value);
  maxY.value = max(tempMax, y4.value );
  debugPrint(json.decode(response.body).toString());
// Navigator.pop(context);
  //String tempName = json.decode(response.body)["stage"].toString();
}