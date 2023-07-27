import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'JOIN PAGE.dart';

class Home extends StatelessWidget {
  Home({super.key});
  double height = 0;

  double width = 0;

  final firestore= FirebaseFirestore.instance.collection('match').snapshots();

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
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: height * 0.16960445817,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/rectangle.png"),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05092686901),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/menu.png", width: width * 0.07639030352),
                  Text(
                    "CricSpotter",
                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 24.sp),
                  ),
                  Image.asset("assets/noti.png", width: width * 0.07639030352),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05092686901,
                vertical: height * 0.02422920831),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upcoming Events",
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "View all",
                  style: TextStyle(
                      color: Color(0xff3854DC),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.64207402023, // Adjust the height as needed

            //------------------------------------------------

          child: StreamBuilder<QuerySnapshot>(
            stream: firestore,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                 
                 if(snapshot.connectionState== ConnectionState.waiting){
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                    height: 80,
                    width: 80,
                    
                  );

                 }

                 if(snapshot.hasError){
                  return 
                  Text('error encountered!');
                 }

        
             return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
            
            String  location=snapshot.data!.docs[index]['location'].toString(); 
            String  date= snapshot.data!.docs[index]['data'].toString();
            String startTime= snapshot.data!.docs[index]['startTime'].toString();
           String match= snapshot.data!.docs[index]['title'].toString();

                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05092686901, vertical: 2.sp),
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
                      borderRadius: BorderRadius.circular(
                          height * 0.02422920831 / 2 +
                              width * 0.05092686901 / 2),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.48380525565,
                          height: height * 0.2422920831,
                          child: Image.asset(
                           snapshot.data!.docs[index]['image'].toString(),
                            fit: BoxFit.contain,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: height * 0.03634381246),
                          child: Container(
                            width: width * 0.40741495212,
                            height: height * 0.18171906233,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.0254634345),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                     snapshot.data!.docs[index]['title'].toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
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
                                      snapshot.data!.docs[index]['members'].toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 7.sp,
                                        color: Color(0xff262D33),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text("Start time :${ snapshot.data!.docs[index]['startTime'].toString()} "
                                   ,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 7.sp,
                                        color: Color(0xff262D33),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.00605730207),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                         Container(
  width: width * 0.07639030352,
  height: width * 0.07639030352,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(width * 0.03819515176),
    image: DecorationImage(
      image: NetworkImage(snapshot.data!.docs[index]['team1ImageUrl'].toString()),
      fit: BoxFit.cover,
    ),
  ),
),
                                          Text(
                                          snapshot.data!.docs[index]['team1'].toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 7.sp,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ],
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
      image: NetworkImage(snapshot.data!.docs[index]['team2ImageUrl'].toString()),
      fit: BoxFit.cover,
    ),
  ),
),
                                          Text(
                                           snapshot.data!.docs[index]['team2'].toString(),
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
                                  SizedBox(height: height * 0.01211460415),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Joinpage(
                                                location:location, 
                                                date: date,
                                                startTime:startTime,
                                                match: match,
                                              )),
                                        );
                                      },
                                      child: Container(
                                        width: width * 0.25463434508,
                                        height: height * 0.03028651038,
                                        decoration: BoxDecoration(
                                            color: Color(0xff3854DC),
                                            borderRadius: BorderRadius.circular(
                                                (height * 0.00605730207 / 2) +
                                                    (width *
                                                        0.01273171725 /
                                                        2))),
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
            );
          }
          )
           
          ),
        ],
      ),
    );
  }
}
