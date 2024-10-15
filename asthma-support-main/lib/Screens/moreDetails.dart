import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class moreDetails extends StatefulWidget {
  final String title;
   final String imageUrl;
   final String content;
  const moreDetails({Key? key,required this.content, required this.title, required this.imageUrl}) : super(key: key);
  
  @override
  State<moreDetails> createState() => _moreDetailsState();
}

class _moreDetailsState extends State<moreDetails> {
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
            Text(widget.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,

                )),
            Spacer(),
            Container(
              height: 85.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40.sp),topRight: Radius.circular(40.sp))
              ),
              child: Column(
                children: [
                  Padding(
                    padding:   EdgeInsets.only(top: 20.sp),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.sp),
                      child: Image.network(widget.imageUrl,
                      width: 50.w,
                      ),
                    ),
                  ),
                  Padding(
                    padding:   EdgeInsets.all(4.w),
                    child: Text(widget.content,
                      style: GoogleFonts.montserrat(
                        fontSize: 11.sp,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),

                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}
