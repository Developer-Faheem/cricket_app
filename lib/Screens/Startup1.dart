import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Startup.dart';






class Startup1 extends StatefulWidget {
  const Startup1({Key? key}) : super(key: key);

  @override
  State<Startup1> createState() => Startup1State();
}

class Startup1State extends State<Startup1> {
  // static const String KEYLOGIN = "login";
  double height = 0;
  double width = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    move();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEFF0F2),
        body: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: height* 0.03634381246 ),
              child: Container(
                width: width,

                child: Image.asset(
                  "assets/Startup.png",
                  width: width,


                ),
              ),
            ),
            Center(child: Text("CricSpotter",style: TextStyle(color: Color(0xff3854DC),fontSize: 50.sp,fontWeight: FontWeight.w400),)),

          ],
        ),
      ),
    );
  }

  void move() {

    Timer(Duration(seconds: 5), () async {

      Navigator.pushReplacement(context, MaterialPageRoute(

          builder: (context) => Startup()));
//
    });
  }

}

