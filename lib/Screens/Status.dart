//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_app/Screens/JOIN%20PAGE.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Enrolled event.dart';
import 'Event showcase.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  double height = 0;
  double width = 0;

  Future<List<DocumentSnapshot>> fetchDataByDate1() async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      User? user = _auth.currentUser;

      if (user == null) {
        print('User not signed in.');
        //   return;
      }

      String userId = user!.uid;
      print(userId);
      print('---------------------+++++++++++++++++++++++++++++++++=');

      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('match')
          .where('eventCreatorId', isEqualTo: userId.toString())
          .get();
//print(date);
      // print(snapshot.docs);

      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  Future<List<DocumentSnapshot>> fetchData() async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      User? user = _auth.currentUser;

      if (user == null) {
        print('User not signed in.');
        //   return;
      }

      String userId = user!.uid;
      print(userId);
      print('---------------------+++++++++++++++++++++++++++++++++=');

      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('match')
          .doc()
          .collection('participants')
          .where('participantId', isEqualTo: userId.toString())
          .get();
//print(date);
      // print(snapshot.docs);

      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff3854DC),
              leading: Padding(
                padding: EdgeInsets.only(left: width * 0.05092686901),
                child: Image.asset(
                  "assets/arrow.png",
                  width: width * 0.0254634345,
                ),
              ),
              title: Text(
                "CricSpotter",
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w400,
                    fontSize: 24.sp),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: width * 0.05092686901),
                  child: Image.asset(
                    "assets/noti.png",
                    width: width * 0.07639030352,
                  ),
                )
              ],
            ),
            body: Column(
              children: [
                Container(
                  //  height: height * 0.07268762493,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffF7F6F6),
                    borderRadius: BorderRadius.circular(
                        width * 0.05092686901 / 2 + height * 0.02422920831 / 2),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.0157489854,
                        left: width * 0.05092686901),
                    child: Text(
                      "Your Status",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000)),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.045, vertical: height * 0.017),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Enrollment in Events",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15.sp),
                      )),
                ),

                Container(
                
                 height: height * 0.259999999999,
                  width: double.infinity,
                  child: FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance.collection('enrollmentData').where('id',isEqualTo:FirebaseAuth.instance.currentUser!.uid ).get(),
                    builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error fetching data'),
                        );
                      } else if(snapshot.hasData){
                        QuerySnapshot? data = snapshot.data;
                        
                        // if (data == null || data.isEmpty) {
                        //   return Center(
                        //     child:
                        //         Text('No data available for the selected date.'),
                        //   );
                        // }
                
                        // Use the data to display in your widget
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                
                            // var matchData =
                            //     data[index].data() as Map<String, dynamic>;
                
                          //   late String location = snapshot.data!.docs[index]['location'];
                          //   late String date =  snapshot.data!.docs[index]['date'];
                          //   late String startTime = snapshot.data!.docs[index]['startTime'];
                          //   late String match = snapshot.data!.docs[index]['matchType'];
                          //   late String teamName = snapshot.data!.docs[index]['teamName'];
                          //   late String teamImageUrl = snapshot.data!.docs[index]['teamImageUrl'];
                          //  late String eventId = snapshot.data!.docs[index]['even'];

                          //  print(location);
                          //  print(date);
                          //      matchData['eventCreatorId'].toString();
                
                          //  late String uid = matchData[index]['uid'].toString();
                
                            // print(location);
                            // print(match);
                            print(
                                '----------------------************************----------------');
                
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Enrolledevent(
                                           match:  snapshot.data!.docs[index]['matchType'],
                                              location: snapshot.data!.docs[index]['locaton'],
                                              date: snapshot.data!.docs[index]['date'],
                                              startTime: snapshot.data!.docs[index]['startTime'],
                                              seletedTeamName:   snapshot.data!.docs[index]['teamName'],
                                            //  team2: team2,
                                              selectedTeamImage: snapshot.data!.docs[index]['teamImageUrl'],
                                              name:snapshot.data!.docs[index]['name'],
                                              age:snapshot.data!.docs[index]['age'],
                                              phoneNumber:snapshot.data!.docs[index]['phoneNumber'],
                                              // image2: image2,
                                               documentUniqueId: snapshot.data!.docs[index]['documentId'],
                                        )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(
                                      height * 0.01211460415 / 2 +
                                          width * 0.0254634345 / 2),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.0154634345,
                                      vertical: height * 0.01134381246),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // SizedBox(
                                      //   height: height * 0.02422920831,
                                      // ),
                                      Image.asset("assets/Status1.png"),
                                      SizedBox(
                                        height: height * 0.01211460415,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.0254634345),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  snapshot.data!.docs[index]['matchType'],
                                                  style: TextStyle(
                                                      color: Color(0xff000000),
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Spacer(),
                                                Column(
                                                  children: [
                                                  Container(
                                                        width: width *
                                                            0.07639030352,
                                                        height: width *
                                                            0.07639030352,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(width *
                                                                  0.03819515176),
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                              snapshot.data!.docs[index]['teamImageUrl'],
                                                               ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    Text(
                                                      snapshot.data!.docs[index]['teamName'],
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff000000),
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.00242292083,
                                            ),
                                            Row(
                                              children: [
                                                Text("14 / 24 members",
                                                    style: TextStyle(
                                                        color: Color(0xff000000),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 10.sp)),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Text(
                                                  "Date: ${snapshot.data!.docs[index]['date']}",
                                                  style: TextStyle(
                                                      color: Color(0xff000000),
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 10.sp),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("Start-time: ${snapshot.data!.docs[index]['startTime']}",
                                                    style: TextStyle(
                                                        color: Color(0xff000000),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 10.sp)),
                                                SizedBox(
                                                  width: width * 0.05092686901,
                                                ),
                                                Image.asset(
                                                  "assets/loc.png",
                                                  width: width * 0.0254634345,
                                                ),
                                                SizedBox(
                                                  width: width * 0.0050926869,
                                                ),
                                                Text(
                                                  "Location: ${snapshot.data!.docs[index]['locaton']}",
                                                  style: TextStyle(
                                                      color: Color(0xff000000),
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 7.sp),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }else if(snapshot.data!.docs.isEmpty){
                        return Center(child: Text(style: TextStyle(color: Colors.black),'no data found!'));
                      }else{
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ),

                // SizedBox(
                //   height: height * 0.02422920831,
                // ),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.045, vertical: height * 0.013),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Events Created",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15.sp),
                      )),
                ),

                Container(
                  height: height * 0.259999999999,
                  width: double.infinity,
                  child: FutureBuilder<List<DocumentSnapshot>>(
                    future: fetchDataByDate1(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error fetching data'),
                        );
                      } else {
                        List<DocumentSnapshot>? data = snapshot.data;

                        if (data == null || data.isEmpty) {
                          return Center(
                            child: Text('No Event created by you! '),
                          );
                        }

                        // Use the data to display in your widget
                        return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            var matchData =
                                data[index].data() as Map<String, dynamic>;

                            String location = matchData['location'].toString();
                            String date = matchData['data'].toString();
                            String startTime =
                                matchData['startTime'].toString();
                            String match = matchData['title'].toString();
                            String team1 = matchData['team1'].toString();
                            String team2 = matchData['team2'].toString();
                            String image1 =
                                matchData['team1ImageUrl'].toString();
                            String image2 =
                                matchData['team2ImageUrl'].toString();
                            String uid = matchData['uid'].toString();

                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Eventshowcase(
                                              match: match,
                                              location: location,
                                              date: date,
                                              startTime: startTime,
                                              team1: team1,
                                              team2: team2,
                                              image1: image1,
                                              image2: image2,
                                              uid: uid,
                                            )));
                              },
                              child: Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffFFFFFF),
                                    borderRadius: BorderRadius.circular(
                                        height * 0.01211460415 / 2 +
                                            width * 0.0254634345 / 2),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.0254634345,
                                        vertical: height * 0.00834381246),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        // SizedBox(
                                        //   height: height * 0.02422920831,
                                        // ),

                                        Image.asset("assets/Status2.png"),
                                        SizedBox(
                                          height: height * 0.01211460415,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.0254634345),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    match.toString(),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff000000),
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Spacer(),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        width: width *
                                                            0.07639030352,
                                                        height: width *
                                                            0.07639030352,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(width *
                                                                  0.03819515176),
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                                matchData[
                                                                        'team1ImageUrl']
                                                                    .toString()),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        matchData['team1']
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 7.sp,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        width * 0.05092686901,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        width: width *
                                                            0.07639030352,
                                                        height: width *
                                                            0.07639030352,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(width *
                                                                  0.03819515176),
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                                matchData[
                                                                        'team2ImageUrl']
                                                                    .toString()),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        matchData['team2']
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 7.sp,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: height * 0.00242292083,
                                              ),
                                              Row(
                                                children: [
                                                  Text("14 / 24 members",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff000000),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 10.sp)),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  Text(
                                                    "Date: ${date.toString()}",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff000000),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 10.sp),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                      "Start time :${matchData['startTime'].toString()} ",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff000000),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 10.sp)),
                                                  SizedBox(
                                                    width:
                                                        width * 0.05092686901,
                                                  ),
                                                  Image.asset(
                                                    "assets/loc.png",
                                                    width: width * 0.0254634345,
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.0050926869,
                                                  ),
                                                  Text(
                                                    "Location: ${location.toString()}",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff000000),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 7.sp),
                                                  ),
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
                            );
                          },
                        );
                      }
                    },
                  ),
                )
              ],
            )));
  }
}
