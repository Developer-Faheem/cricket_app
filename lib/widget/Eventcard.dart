import 'package:cricket_app/Screens/JOIN%20PAGE.dart';
import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MatchListItem extends StatelessWidget {
  final String title;
  final String members;
  final String startTime;
  final String team1ImageUrl;
  final String team1;
  final String team2ImageUrl;
  final String team2;
  final String location;
  final String date;
  final String match;
  


  MatchListItem({
    required this.title,
    required this.members,
    required this.startTime,
    required this.team1ImageUrl,
    required this.team1,
    required this.team2ImageUrl,
    required this.team2,
    required this.date,
    required this.location,
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
       width: double.infinity,
            height: height * 0.16960445817,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05092686901, vertical: 2.sp),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(height * 0.02422920831 / 2 + width * 0.05092686901 / 2),
          ),
          child: Row(
            children: [
              Container(
                width: width * 0.48380525565,
                height: height * 0.2422920831,
                child: Image.asset(
                  team1ImageUrl,
                  fit: BoxFit.contain,
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
                            title,
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
                            members,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 7.sp,
                              color: Color(0xff262D33),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Start time : $startTime",
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
                                      image: NetworkImage(team1ImageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  team1,
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
                                      image: NetworkImage(team2ImageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  team2,
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
                                    location: location,
                                    date: date,
                                    startTime: startTime,
                                    match: match,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: width * 0.25463434508,
                              height: height * 0.03028651038,
                              decoration: BoxDecoration(
                                color: Color(0xff3854DC),
                                borderRadius: BorderRadius.circular((height * 0.00605730207 / 2) + (width * 0.01273171725 / 2)),
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
      ),
    );
  }
}
