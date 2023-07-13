import 'dart:async';

import 'package:flutter/material.dart';

import '../main.dart';






class Onbaording extends StatefulWidget {
  const Onbaording({Key? key}) : super(key: key);

  @override
  State<Onbaording> createState() => OnbaordingState();
}

class OnbaordingState extends State<Onbaording> {
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
            Center(child: Text("CricSpotter",style: TextStyle(color: Color(0xff3854DC),fontSize: 50,fontWeight: FontWeight.w400),)),
            SizedBox(height: height*0.01211460415 ,),
            Center(child: Text("LOADING...",style: TextStyle(color: Color(0xff000000),fontSize: 12,fontWeight: FontWeight.w400),)),
          ],
        ),
      ),
    );
  }

  void move() {

    Timer(Duration(seconds: 5), () async {

      Navigator.pushReplacement(context, MaterialPageRoute(

          builder: (context) => btmnavigation()));
//
    });
  }

}

