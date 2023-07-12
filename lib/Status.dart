
import 'package:flutter/material.dart';

import 'Enrolled event.dart';
import 'Event showcase.dart';



class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {







  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3854DC),
        leading:  Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset("assets/arrow.png",width: 10,),
        ),
        title: const Text("CricSpotter",style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w400,fontSize: 24),),
        centerTitle: true,
        actions: [ Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Image.asset("assets/noti.png",width: 30,),
        )],
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffF7F6F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 13,left: 20),
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
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("Enrollment in Events",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)),
                          SizedBox(height: 20,),
                          Image.asset("assets/Status1.png"),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Test Match",style: TextStyle(color: Color(0xff000000),fontSize: 18,fontWeight: FontWeight.w400),),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Image.asset("assets/ball G.png",width: 30,),
                                        Text("Mighty Ducks",style: TextStyle(color: Color(0xff000000),fontSize: 8,fontWeight: FontWeight.w400),)
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 2,),
                                Row(
                                  children: [
                                    Text("14 / 24 members",style: TextStyle(color: Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 12)),
                                    SizedBox(width: 20,),
                                    Text("Date: XX-XX-XXXX",style: TextStyle(color: Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 12),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Start-time: 11: 00am",style: TextStyle(color: Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 12)),
                                    SizedBox(width: 20,),
                                    Image.asset("assets/loc.png",width: 10,),
                                    SizedBox(width: 2,),
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
                SizedBox(height: 20,),
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
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("Events Created",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)),
                          SizedBox(height: 20,),
                          Image.asset("assets/Status2.png"),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Test Match",style: TextStyle(color: Color(0xff000000),fontSize: 18,fontWeight: FontWeight.w400),),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Image.asset("assets/Status3.png",width: 30,),
                                        Text("Titans",style: TextStyle(color: Color(0xff000000),fontSize: 8,fontWeight: FontWeight.w400),)
                                      ],
                                    ),
                                    SizedBox(width: 20,),
                                    Column(
                                      children: [
                                        Image.asset("assets/Status4.png",width: 30,),
                                        Text("Roar",style: TextStyle(color: Color(0xff000000),fontSize: 8,fontWeight: FontWeight.w400),)
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2,),
                                Row(
                                  children: [
                                    Text("14 / 24 members",style: TextStyle(color: Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 12)),
                                    SizedBox(width: 20,),
                                    Text("Date: XX-XX-XXXX",style: TextStyle(color: Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 12),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Start-time: 11: 00am",style: TextStyle(color: Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 12)),
                                    SizedBox(width: 20,),
                                    Image.asset("assets/loc.png",width: 10,),
                                    SizedBox(width: 2,),
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





















