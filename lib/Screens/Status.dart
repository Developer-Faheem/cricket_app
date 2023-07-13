
import 'package:flutter/material.dart';

import 'Enrolled event.dart';
import 'Event showcase.dart';



class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  double height=0;
  double width=0;






  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return SafeArea(child:Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff3854DC),
          leading:  Padding(
            padding:  EdgeInsets.only(left: width* 0.05092686901 ),
            child: Image.asset("assets/arrow.png",width: width* 0.0254634345 ,),
          ),
          title: const Text("CricSpotter",style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w400,fontSize: 24),),
          centerTitle: true,
          actions: [ Padding(
            padding:  EdgeInsets.only(right:  width* 0.05092686901 ),
            child: Image.asset("assets/noti.png",width: width* 0.07639030352 ,),
          )],
        ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height*0.07268762493  ,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffF7F6F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: height*0.0157489854,left: width* 0.05092686901),
                child: Text("Your Status",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Color(0xff000000)),),
              ),
            ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                InkWell(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Enrolledevent()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width* 0.0254634345 ,vertical: height*0.03634381246),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("Enrollment in Events",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)),
                          SizedBox(height: height* 0.02422920831 ,),
                          Image.asset("assets/Status1.png"),
                          SizedBox(height: height*0.01211460415 ,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: width*0.0254634345 ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Test Match",style: TextStyle(color: Color(0xff000000),fontSize: 18,fontWeight: FontWeight.w400),),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Image.asset("assets/ball G.png",width: width* 0.07639030352 ,),
                                        Text("Mighty Ducks",style: TextStyle(color: Color(0xff000000),fontSize: 8,fontWeight: FontWeight.w400),)
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: height* 0.00242292083,),
                                Row(
                                  children: [
                                    Text("14 / 24 members",style: TextStyle(color: Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 12)),
                                    SizedBox(width: width*0.05092686901,),
                                    Text("Date: XX-XX-XXXX",style: TextStyle(color: Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 12),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Start-time: 11: 00am",style: TextStyle(color: Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 12)),
                                    SizedBox(width: width*0.05092686901,),
                                    Image.asset("assets/loc.png",width: width* 0.0254634345 ,),
                                    SizedBox(width: width*0.0050926869,),
                                    Text("Location: new plaza bahria town, islamabad",style: TextStyle(color: Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 10),),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height* 0.02422920831,),
                InkWell(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Eventshowcase()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width* 0.0254634345 ,vertical: height*0.03634381246),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("Events Created",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)),
                          SizedBox(height: height* 0.02422920831 ,),
                          Image.asset("assets/Status2.png"),
                          SizedBox(height: height*0.01211460415 ,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: width*0.0254634345 ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Test Match",style: TextStyle(color: Color(0xff000000),fontSize: 18,fontWeight: FontWeight.w400),),
                                    Spacer(),
                            Column(
                                                    children: [
                                                      Image.asset("assets/Status3.png",width: width*0.07639030352 ,),
                                                      Text("Titans",style: TextStyle(color: Color(0xff000000),fontSize: 8,fontWeight: FontWeight.w400),)
                                                    ],
                                                  ),
                                                  SizedBox(width: width*0.05092686901,),
                                                  Column(
                                                    children: [
                                                      Image.asset("assets/Status4.png",width:width*0.07639030352,),
                                                      Text("Roar",style: TextStyle(color: Color(0xff000000),fontSize: 8,fontWeight: FontWeight.w400),)
                                                    ],
                                                  ),
                                  ],
                                ),
                                SizedBox(height: height* 0.00242292083,),
                                Row(
                                  children: [
                                    Text("14 / 24 members",style: TextStyle(color: Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 12)),
                                    SizedBox(width: width*0.05092686901,),
                                    Text("Date: XX-XX-XXXX",style: TextStyle(color: Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 12),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Start-time: 11: 00am",style: TextStyle(color: Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 12)),
                                    SizedBox(width: width*0.05092686901,),
                                    Image.asset("assets/loc.png",width: width* 0.0254634345 ,),
                                    SizedBox(width: width*0.0050926869,),
                                    Text("Location: new plaza bahria town, islamabad",style: TextStyle(color: Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 10),),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          )

          ],
        ),
      )

    ));
  }
}





















