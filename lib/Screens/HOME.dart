import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:flutter/material.dart';

import 'JOIN PAGE.dart';

class Home extends StatelessWidget {
  Home({super.key});
  double height = 0;

  double width = 0;
  List<Map<String, dynamic>> dataList = [
    {
      'image': 'assets/home1.png',
      'title': 'Test Match',
      'members': '14 / 24 members',
      'startTime': 'Start-time: 11:00am',
      'team1': 'Rising Stars',
      'team2': 'Mighty Ducks',
    },
    {
      'image': 'assets/home2.png',
      'title': 'Test Match',
      'members': '14 / 24 members',
      'startTime': 'Start-time: 11:00am',
      'team1': 'Rising Stars',
      'team2': 'Mighty Ducks',
    },
    {
      'image': 'assets/home3.png',
      'title': 'Test Match',
      'members': '14 / 24 members',
      'startTime': 'Start-time: 11:00am',
      'team1': 'Rising Stars',
      'team2': 'Mighty Ducks',
    },
    {
      'image': 'assets/home1.png',
      'title': 'Test Match',
      'members': '14 / 24 members',
      'startTime': 'Start-time: 11:00am',
      'team1': 'Rising Stars',
      'team2': 'Mighty Ducks',
    },
    {
      'image': 'assets/home2.png',
      'title': 'Test Match',
      'members': '14 / 24 members',
      'startTime': 'Start-time: 11:00am',
      'team1': 'Rising Stars',
      'team2': 'Mighty Ducks',
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: height*0.16960445817,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/rectangle.png"),
              ),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.05092686901 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/menu.png", width: width*0.07639030352 ),
                  Text(
                    "CricSpotter",
                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 24),
                  ),
                  Image.asset("assets/noti.png", width: width*0.07639030352),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width* 0.05092686901 , vertical: height*0.02422920831),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upcoming Events",
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "View all",
                  style: TextStyle(
                      color: Color(0xff3854DC),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Container(
            height: 530, // Adjust the height as needed
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = dataList[index];

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05092686901,vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // horizontal, vertical offset
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.48380525565,
                          height: height * 0.2422920831,
                          child: Image.asset(
                            data['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(bottom: height * 0.03634381246),
                          child: Container(
                            width: width * 0.40741495212,
                            height: height * 0.18171906233,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: width * 0.0254634345),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      data['title'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.00363438124),
                                  Container(
                                    width: width * 0.50926869016,
                                    height: height * 0.00242292083,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: height * 0.00363438124),
                                  Center(
                                    child: Text(
                                      data['members'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Color(0xff262D33),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      data['startTime'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Color(0xff262D33),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.00605730207),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Image.asset(
                                            "assets/Elli G.png",
                                            width: width * 0.07639030352,
                                          ),
                                          Text(
                                            data['team1'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: [
                                          Image.asset(
                                            "assets/ball G.png",
                                            width: width * 0.07639030352,
                                          ),
                                          Text(
                                            data['team2'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.01211460415),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Joinpage()),
                                        );
                                      },
                                      child: Container(
                                        width: width * 0.25463434508,
                                        height: height * 0.03028651038,
                                        decoration: BoxDecoration(
                                          color: Color(0xff3854DC),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text("Join"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: width* 0.05092686901 , vertical: height*0.02422920831),
          //   child: Column(
          //     children: [
          //       Container(
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(40),
          //         ),
          //         child: Row(
          //           children: [
          //             Container(
          //               width: width*0.48380525565,
          //               height: height*0.2422920831,
          //               child: Image.asset(
          //                 "assets/home1.png",
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //             Spacer(),
          //             Padding(
          //               padding:  EdgeInsets.only(bottom:height*0.03634381246   ),
          //               child: Container(
          //                 width: width*0.40741495212,
          //                 height: height*0.18171906233,
          //                 child: Padding(
          //                   padding:  EdgeInsets.symmetric(horizontal: width*0.0254634345 ),
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Center(
          //                         child: Text(
          //                           "Test Match",
          //                           style: TextStyle(
          //                               fontSize: 18,
          //                               fontWeight: FontWeight.w400,
          //                               color: Color(0xff000000)),
          //                         ),
          //                       ),
          //                       SizedBox(height: height*0.00363438124,),
          //                       Container(
          //                         width: width*0.50926869016,
          //                         height:height*0.00242292083,
          //                         color: Colors.grey,
          //                       ),
          //                       SizedBox(height: height*0.00363438124,),
          //                       Center(
          //                         child: Text(
          //                           "14 / 24 members",
          //                           style: TextStyle(
          //                             fontWeight: FontWeight.w400,
          //                             fontSize: 10,
          //                             color: Color(0xff262D33),
          //                           ),
          //                         ),
          //                       ),
          //                       Center(
          //                         child: Text(
          //                           "Start-time: 11: 00am",
          //                           style: TextStyle(
          //                             fontWeight: FontWeight.w400,
          //                             fontSize: 10,
          //                             color: Color(0xff262D33),
          //                           ),
          //                         ),
          //                       ),
          //                       SizedBox(height: height*0.00605730207 ,),
          //                       Row(
          //                         children: [
          //                           Column(
          //                             children: [
          //                               Image.asset(
          //                                 "assets/Elli G.png",
          //                                 width: width*0.07639030352 ,
          //                               ),
          //                               Text(
          //                                 "Rising Stars",
          //                                 style: TextStyle(
          //                                   fontWeight: FontWeight.w400,
          //                                   fontSize: 10,
          //                                   color: Color(0xff000000),
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                           Spacer(),
          //                           Column(
          //                             children: [
          //                               Image.asset(
          //                                 "assets/ball G.png",
          //                                 width: width*0.07639030352 ,
          //                               ),
          //                               Text(
          //                                 "Mighty Ducks",
          //                                 style: TextStyle(
          //                                   fontWeight: FontWeight.w400,
          //                                   fontSize: 10,
          //                                   color: Color(0xff000000),
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ],
          //                       ),
          //                       SizedBox(height: height* 0.01211460415,),
          //                       Center(
          //                         child: InkWell(
          //                           onTap: (){
          //                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Joinpage()));
          //                           },
          //                           child: Container(
          //                             width: width*0.25463434508,
          //                             height: height*0.03028651038,
          //                             decoration: BoxDecoration(
          //                                 color: Color(0xff3854DC),
          //                                 borderRadius: BorderRadius.circular(5)
          //                             ),
          //
          //                             child: Center(
          //                               child: Text("Join"),
          //                             ),
          //                           ),
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: width* 0.05092686901),
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         Container(
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(40),
          //           ),
          //           child: Row(
          //             children: [
          //               Container(
          //                 width: width*0.48380525565,
          //                 height: height*0.2422920831,
          //                 child: Image.asset(
          //                   "assets/home2.png",
          //                   fit: BoxFit.cover,
          //                 ),
          //               ),
          //               Spacer(),
          //               Padding(
          //                 padding:  EdgeInsets.only(bottom: height*0.03634381246  ),
          //                 child: Container(
          //                   width: width* 0.40741495212,
          //                   height: height*0.18171906233,
          //                   child: Padding(
          //                     padding:  EdgeInsets.symmetric(horizontal: width*0.0254634345 ),
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         Center(
          //                           child: Text(
          //                             "T20 Match",
          //                             style: TextStyle(
          //                                 fontSize: 18,
          //                                 fontWeight: FontWeight.w400,
          //                                 color: Color(0xff000000)),
          //                           ),
          //                         ),
          //                         SizedBox(height: height*0.00363438124,),
          //                         Container(
          //                           width: width* 0.50926869016,
          //                           height: height* 0.00242292083,
          //                           color: Colors.grey,
          //                         ),
          //                         SizedBox(height: height*0.00363438124,),
          //                         Center(
          //                           child: Text(
          //                             "14 / 24 members",
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.w400,
          //                               fontSize: 10,
          //                               color: Color(0xff262D33),
          //                             ),
          //                           ),
          //                         ),
          //                         Center(
          //                           child: Text(
          //                             "Start-time: 11: 00am",
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.w400,
          //                               fontSize: 10,
          //                               color: Color(0xff262D33),
          //                             ),
          //                           ),
          //                         ),
          //                         SizedBox(height: height*0.00605730207  ,),
          //                         Row(
          //                           children: [
          //                             Column(
          //                               children: [
          //                                 Image.asset(
          //                                   "assets/Elli G.png",
          //                                   width: width* 0.07639030352 ,
          //                                 ),
          //                                 Text(
          //                                   "Rising Stars",
          //                                   style: TextStyle(
          //                                     fontWeight: FontWeight.w400,
          //                                     fontSize: 10,
          //                                     color: Color(0xff000000),
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                             Spacer(),
          //                             Column(
          //                               children: [
          //                                 Image.asset(
          //                                   "assets/ball G.png",
          //                                   width: width* 0.07639030352 ,
          //                                 ),
          //                                 Text(
          //                                   "Mighty Ducks",
          //                                   style: TextStyle(
          //                                     fontWeight: FontWeight.w400,
          //                                     fontSize: 10,
          //                                     color: Color(0xff000000),
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(height: height*0.01211460415,),
          //                         Center(
          //                           child: InkWell(
          //                             onTap: (){
          //                               Navigator.push(context, MaterialPageRoute(builder: (context)=>Joinpage()));
          //                             },
          //                             child: Container(
          //
          //                               width: width*0.25463434508,
          //                               height: height*0.03028651038 ,
          //                               decoration: BoxDecoration(
          //                                   color: Color(0xff3854DC),
          //                                   borderRadius: BorderRadius.circular(5)
          //                               ),
          //
          //                               child: Center(
          //                                 child: Text("Join"),
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: width* 0.05092686901),
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         Container(
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(40),
          //           ),
          //           child: Row(
          //             children: [
          //               Container(
          //                 width: width*0.48380525565,
          //                 height: height*0.2422920831,
          //                 child: Image.asset(
          //                   "assets/home3.png",
          //                   fit: BoxFit.cover,
          //                 ),
          //               ),
          //               Spacer(),
          //               Padding(
          //                 padding:  EdgeInsets.only(bottom: height*0.03634381246  ),
          //                 child: Container(
          //                   width: width* 0.40741495212,
          //                   height: height*0.18171906233,
          //                   child: Padding(
          //                     padding:  EdgeInsets.symmetric(horizontal: width*0.0254634345 ),
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         Center(
          //                           child: Text(
          //                             "T20 Match",
          //                             style: TextStyle(
          //                                 fontSize: 18,
          //                                 fontWeight: FontWeight.w400,
          //                                 color: Color(0xff000000)),
          //                           ),
          //                         ),
          //                         SizedBox(height: height*0.00363438124,),
          //                         Container(
          //                           width: width* 0.50926869016,
          //                           height: height* 0.00242292083,
          //                           color: Colors.grey,
          //                         ),
          //                         SizedBox(height: height*0.00363438124,),
          //                         Center(
          //                           child: Text(
          //                             "14 / 24 members",
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.w400,
          //                               fontSize: 10,
          //                               color: Color(0xff262D33),
          //                             ),
          //                           ),
          //                         ),
          //                         Center(
          //                           child: Text(
          //                             "Start-time: 11: 00am",
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.w400,
          //                               fontSize: 10,
          //                               color: Color(0xff262D33),
          //                             ),
          //                           ),
          //                         ),
          //                         SizedBox(height: height*0.00605730207  ,),
          //                         Row(
          //                           children: [
          //                             Column(
          //                               children: [
          //                                 Image.asset(
          //                                   "assets/Elli G.png",
          //                                   width: width* 0.07639030352 ,
          //                                 ),
          //                                 Text(
          //                                   "Rising Stars",
          //                                   style: TextStyle(
          //                                     fontWeight: FontWeight.w400,
          //                                     fontSize: 10,
          //                                     color: Color(0xff000000),
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                             Spacer(),
          //                             Column(
          //                               children: [
          //                                 Image.asset(
          //                                   "assets/ball G.png",
          //                                   width: width* 0.07639030352 ,
          //                                 ),
          //                                 Text(
          //                                   "Mighty Ducks",
          //                                   style: TextStyle(
          //                                     fontWeight: FontWeight.w400,
          //                                     fontSize: 10,
          //                                     color: Color(0xff000000),
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(height: height*0.01211460415,),
          //                         Center(
          //                           child: InkWell(
          //                             onTap: (){
          //                               Navigator.push(context, MaterialPageRoute(builder: (context)=>Joinpage()));
          //                             },
          //                             child: Container(
          //
          //                               width: width*0.25463434508,
          //                               height: height*0.03028651038 ,
          //                               decoration: BoxDecoration(
          //                                   color: Color(0xff3854DC),
          //                                   borderRadius: BorderRadius.circular(5)
          //                               ),
          //
          //                               child: Center(
          //                                 child: Text("Join"),
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: width* 0.05092686901),
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         Container(
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(40),
          //           ),
          //           child: Row(
          //             children: [
          //               Container(
          //                 width: width*0.48380525565,
          //                 height: height*0.2422920831,
          //                 child: Image.asset(
          //                   "assets/home1.png",
          //                   fit: BoxFit.cover,
          //                 ),
          //               ),
          //               Spacer(),
          //               Padding(
          //                 padding:  EdgeInsets.only(bottom: height*0.03634381246  ),
          //                 child: Container(
          //                   width: width* 0.40741495212,
          //                   height: height*0.18171906233,
          //                   child: Padding(
          //                     padding:  EdgeInsets.symmetric(horizontal: width*0.0254634345 ),
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         Center(
          //                           child: Text(
          //                             "T20 Match",
          //                             style: TextStyle(
          //                                 fontSize: 18,
          //                                 fontWeight: FontWeight.w400,
          //                                 color: Color(0xff000000)),
          //                           ),
          //                         ),
          //                         SizedBox(height: height*0.00363438124,),
          //                         Container(
          //                           width: width* 0.50926869016,
          //                           height: height* 0.00242292083,
          //                           color: Colors.grey,
          //                         ),
          //                         SizedBox(height: height*0.00363438124,),
          //                         Center(
          //                           child: Text(
          //                             "14 / 24 members",
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.w400,
          //                               fontSize: 10,
          //                               color: Color(0xff262D33),
          //                             ),
          //                           ),
          //                         ),
          //                         Center(
          //                           child: Text(
          //                             "Start-time: 11: 00am",
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.w400,
          //                               fontSize: 10,
          //                               color: Color(0xff262D33),
          //                             ),
          //                           ),
          //                         ),
          //                         SizedBox(height: height*0.00605730207  ,),
          //                         Row(
          //                           children: [
          //                             Column(
          //                               children: [
          //                                 Image.asset(
          //                                   "assets/Elli G.png",
          //                                   width: width* 0.07639030352 ,
          //                                 ),
          //                                 Text(
          //                                   "Rising Stars",
          //                                   style: TextStyle(
          //                                     fontWeight: FontWeight.w400,
          //                                     fontSize: 10,
          //                                     color: Color(0xff000000),
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                             Spacer(),
          //                             Column(
          //                               children: [
          //                                 Image.asset(
          //                                   "assets/ball G.png",
          //                                   width: width* 0.07639030352 ,
          //                                 ),
          //                                 Text(
          //                                   "Mighty Ducks",
          //                                   style: TextStyle(
          //                                     fontWeight: FontWeight.w400,
          //                                     fontSize: 10,
          //                                     color: Color(0xff000000),
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(height: height*0.01211460415,),
          //                         Center(
          //                           child: InkWell(
          //                             onTap: (){
          //                               Navigator.push(context, MaterialPageRoute(builder: (context)=>Joinpage()));
          //                             },
          //                             child: Container(
          //
          //                               width: width*0.25463434508,
          //                               height: height*0.03028651038 ,
          //                               decoration: BoxDecoration(
          //                                   color: Color(0xff3854DC),
          //                                   borderRadius: BorderRadius.circular(5)
          //                               ),
          //
          //                               child: Center(
          //                                 child: Text("Join"),
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: width* 0.05092686901),
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         Container(
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(40),
          //           ),
          //           child: Row(
          //             children: [
          //               Container(
          //                 width: width*0.48380525565,
          //                 height: height*0.2422920831,
          //                 child: Image.asset(
          //                   "assets/home2.png",
          //                   fit: BoxFit.cover,
          //                 ),
          //               ),
          //               Spacer(),
          //               Padding(
          //                 padding:  EdgeInsets.only(bottom: height*0.03634381246  ),
          //                 child: Container(
          //                   width: width* 0.40741495212,
          //                   height: height*0.18171906233,
          //                   child: Padding(
          //                     padding:  EdgeInsets.symmetric(horizontal: width*0.0254634345 ),
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         Center(
          //                           child: Text(
          //                             "T20 Match",
          //                             style: TextStyle(
          //                                 fontSize: 18,
          //                                 fontWeight: FontWeight.w400,
          //                                 color: Color(0xff000000)),
          //                           ),
          //                         ),
          //                         SizedBox(height: height*0.00363438124,),
          //                         Container(
          //                           width: width* 0.50926869016,
          //                           height: height* 0.00242292083,
          //                           color: Colors.grey,
          //                         ),
          //                         SizedBox(height: height*0.00363438124,),
          //                         Center(
          //                           child: Text(
          //                             "14 / 24 members",
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.w400,
          //                               fontSize: 10,
          //                               color: Color(0xff262D33),
          //                             ),
          //                           ),
          //                         ),
          //                         Center(
          //                           child: Text(
          //                             "Start-time: 11: 00am",
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.w400,
          //                               fontSize: 10,
          //                               color: Color(0xff262D33),
          //                             ),
          //                           ),
          //                         ),
          //                         SizedBox(height: height*0.00605730207  ,),
          //                         Row(
          //                           children: [
          //                             Column(
          //                               children: [
          //                                 Image.asset(
          //                                   "assets/Elli G.png",
          //                                   width: width* 0.07639030352 ,
          //                                 ),
          //                                 Text(
          //                                   "Rising Stars",
          //                                   style: TextStyle(
          //                                     fontWeight: FontWeight.w400,
          //                                     fontSize: 10,
          //                                     color: Color(0xff000000),
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                             Spacer(),
          //                             Column(
          //                               children: [
          //                                 Image.asset(
          //                                   "assets/ball G.png",
          //                                   width: width* 0.07639030352 ,
          //                                 ),
          //                                 Text(
          //                                   "Mighty Ducks",
          //                                   style: TextStyle(
          //                                     fontWeight: FontWeight.w400,
          //                                     fontSize: 10,
          //                                     color: Color(0xff000000),
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(height: height*0.01211460415,),
          //                         Center(
          //                           child: InkWell(
          //                             onTap: (){
          //                               Navigator.push(context, MaterialPageRoute(builder: (context)=>Joinpage()));
          //                             },
          //                             child: Container(
          //
          //                               width: width*0.25463434508,
          //                               height: height*0.03028651038 ,
          //                               decoration: BoxDecoration(
          //                                   color: Color(0xff3854DC),
          //                                   borderRadius: BorderRadius.circular(5)
          //                               ),
          //
          //                               child: Center(
          //                                 child: Text("Join"),
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
