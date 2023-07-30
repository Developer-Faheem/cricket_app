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
                        width * 0.05092686901 / 2 +
                            height * 0.02422920831 / 2
                            ),
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
                   padding:  EdgeInsets.symmetric(horizontal: width*0.045,vertical: height*0.017),
                   child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Enrollment in Events",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15.sp),
                                    )),
                 ),

                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Enrolledevent()));
                  },
                  child: Container(
                    
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(height* 0.01211460415 /2 + width* 0.0254634345 /2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.0154634345,
                          vertical: height * 0.01134381246
                          ),
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
                                      "Test Match",
                                      style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Image.asset(
                                          "assets/ball G.png",
                                          width: width * 0.07639030352,
                                        ),
                                        Text(
                                          "Mighty Ducks",
                                          style: TextStyle(
                                              color: Color(0xff000000),
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
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10.sp)),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "Date: XX-XX-XXXX",
                                      style: TextStyle(
                                          color: Color(0xff000000),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.sp),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Start-time: 11: 00am",
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontWeight: FontWeight.w400,
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
                                      "Location: new plaza bahria town, islamabad",
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
                ),


                // SizedBox(
                //   height: height * 0.02422920831,
                // ),

                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: width*0.045,vertical: height*0.013),
                   child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Events Created",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15.sp),
                                    )),
                 ),

                   Container(
                    height: height*0.259999999999,
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
                                   var matchData = data[index].data() as Map<String, dynamic>;
                               
                                   String  location=matchData['location'].toString(); 
                               String  date= matchData['data'].toString();
                               String startTime= matchData['startTime'].toString();
                                String match= matchData['title'].toString();
                             
                                 return    InkWell(
                                     onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Eventshowcase()));
                                     },
                                     child: Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(height* 0.01211460415 /2 + width* 0.0254634345 /2),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            
                              horizontal: width * 0.0254634345,
                              vertical: height * 0.00834381246
                              ),
                          child: Column(
                            
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                              color: Color(0xff000000),
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Spacer(),
                                        Column(
                                          children: [
                                       Container(
                                        width: width * 0.07639030352,
                                        height: width * 0.07639030352,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(width * 0.03819515176),
                                          image: DecorationImage(
                                            image: NetworkImage(matchData['team1ImageUrl'].toString()),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                       Text(
                                        matchData['team1'].toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 7.sp,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ],
                                        ),
                                        SizedBox(
                                          width: width * 0.05092686901,
                                        ),
                                        Column(
                                          children: [
                                       Container(
                                        width: width * 0.07639030352,
                                        height: width * 0.07639030352,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(width * 0.03819515176),
                                          image: DecorationImage(
                                            image: NetworkImage(matchData['team2ImageUrl'].toString()),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        matchData['team2'].toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 7.sp,
                                            color: Color(0xff000000),
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
                                                color: Color(0xff000000),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10.sp)),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          "Date: ${date.toString()}",
                                          style: TextStyle(
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10.sp),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Start time :${ matchData['startTime'].toString()} ",
                                            style: TextStyle(
                                                color: Color(0xff000000),
                                                fontWeight: FontWeight.w400,
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
                                          "Location: ${location.toString()}",
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
