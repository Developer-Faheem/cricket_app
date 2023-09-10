import 'package:cricket_app/firebaseServices/matchData.dart';
import 'package:cricket_app/notification/notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Joinpage extends StatefulWidget {
  String match;
  String date;
  String startTime;
  String location;
  String enrolledPersonId;
  String uid;
  String image1;
  String image2;
  String team1;
  String team2;

  Joinpage(
      {required this.match,
      required this.startTime,
      required this.location,
      required this.date,
      required this.enrolledPersonId,
      required this.uid,
      required this.image1,
      required this.image2,
      required this.team1,
      required this.team2});

  @override
  State<Joinpage> createState() => _JoinpageState();
}

class _JoinpageState extends State<Joinpage> {
  double height = 0;
  double width = 0;
  int _age = 0; // Initial age value
  String? imageUrl;
  String? seletedTeam;
  String? unseletedTeamImageUrl;
  String? unselectedTeamName;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3854DC),
        leading: Padding(
          padding: EdgeInsets.only(left: width * 0.05092686901),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/arrow.png",
              width: width * 0.0254634345,
            ),
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
        // actions: [ Padding(
        //   padding:  EdgeInsets.only(left: width*0.05092686901 ),
        //   child: Image.asset("assets/noti.png",width: width*0.07639030352 ,),
        // )],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: height * 0.28012773824,
              child: Image.asset(
                "assets/Status5.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    width * 0.0254634345 / 2 + height * 0.01211460415 / 2),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: width * 0.05092686901,
                    top: height * 0.01211460415,
                    bottom: height * 0.01211460415),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //   "Test Match",
                      widget.match.toString(),
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "14 / 24 members",
                          style: TextStyle(
                              color: Color(0xff242425),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: width * 0.07639030352,
                        ),
                        Text(
                          //  "Date: XX-XX-XXXX",
                          "Date: ${widget.date.toString()}",
                          style: TextStyle(
                              color: Color(0xff242425),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Start-time: ${widget.startTime.toString()}",
                          style: TextStyle(
                              color: Color(0xff242425),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: width * 0.0895561214,
                        ),
                        Image.asset(
                          "assets/loc.png",
                          width: width * 0.03819515176,
                        ),
                        SizedBox(
                          width: width * 0.020926869,
                        ),
                        Text(
                          "Location: ${widget.location.toString()}",
                          style: TextStyle(
                              color: Color(0xff242425),
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.04845841662,
                    horizontal: width * 0.05092686901),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Choose Your team:",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp),
                        ),
                        InkWell(
                          onTap: () {
                            imageUrl = widget.image1.toString();
                            seletedTeam = widget.team1.toString();
                            unseletedTeamImageUrl = widget.image2.toString();
                            unselectedTeamName = widget.team2.toString();
                          },
                          child: Column(
                            children: [
                              Container(
                                width: width * 0.12731717254,
                                height: width * 0.12639030352,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(widget.image1.toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // Image.asset(
                              //   "assets/Elli G.png",
                              //   width: width*0.12731717254,
                              // ),
                              Text(widget.team1.toString()),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            imageUrl = widget.image2.toString();
                            seletedTeam = widget.team2.toString();
                            unseletedTeamImageUrl = widget.image1.toString();
                            unselectedTeamName = widget.team1.toString();
                          },
                          child: Column(
                            children: [
                              Container(
                                width: width * 0.12731717254,
                                height: width * 0.12639030352,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(widget.image2.toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(widget.team2.toString()),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02422920831,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Enter Your name:",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp),
                        ),
                        Container(
                          width: width * 0.45834182114,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                width * 0.01273171725 / 2 +
                                    height * 0.00605730207),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                            shape: BoxShape.rectangle,
                          ),
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: width * 0.0254634345),
                              hintText: "Your Name",
                              hintStyle: TextStyle(
                                  color: Color(0xff989696),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02422920831,
                    ),
                    Row(
                      children: [
                        Text(
                          "Enter Your age:",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.09192686901),
                          child: Container(
                            width: width * 0.23553676919,
                            height: height * 0.04966987703,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  width * 0.01273171725 / 2 +
                                      height * 0.00605730207),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: width * 0.07639030352,
                                  child: Center(child: Text("$_age")),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.05092686901,
                                      top: height * 0.00484425713),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (_age >= 0) {
                                                  _age++;
                                                }
                                              });
                                            },
                                            child: Image.asset(
                                              "assets/Vector 5.png",
                                              width: width * 0.05092686901,
                                            )),
                                        SizedBox(
                                          height: height * 0.00605730207,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (_age >= 2) _age--;
                                              });
                                            },
                                            child: Image.asset(
                                              "assets/Vector 6.png",
                                              width: width * 0.05092686901,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02422920831,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Enter Phone-no:",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp),
                        ),
                        Container(
                          width: width * 0.45834182114,
                          height: height * 0.06057302077,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                width * 0.01273171725 / 2 +
                                    height * 0.00605730207),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                            shape: BoxShape.rectangle,
                          ),
                          child: TextField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: width * 0.0254634345),
                              hintText: "Your Phone Number",
                              hintStyle: TextStyle(
                                  color: Color(0xff989696),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02711460415,
                    ),
                    ElevatedButton(
                      child: Text(
                        'Confirm',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(width * 0.78, height * 0.056),
                        backgroundColor: Color(
                            0xff3854DC), // Change the background color here
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      onPressed: () {
                        if (nameController.text != "" &&
                            phoneController.text != "" &&
                            _age != 0 &&
                            imageUrl != null &&
                            seletedTeam != null &&
                            unselectedTeamName != null &&
                            unseletedTeamImageUrl != null) {
                          MatchData()
                              .createdMatch(context,
                                  id: FirebaseAuth.instance.currentUser!.uid,
                                  matchType: widget.match,
                                  members: '14 / 24 members ',
                                  startTime: widget.startTime,
                                  date: widget.date,
                                  location: widget.location,
                                  age: _age.toString(),
                                  phoneNumber: phoneController.text.toString(),
                                  teamName: seletedTeam.toString(),
                                  temamImageUrl: imageUrl.toString(),
                                  name: nameController.text.toString(),
                                  unselectedTeamName:
                                      unselectedTeamName.toString(),
                                  unseletedTeamImageUrl:
                                      unseletedTeamImageUrl.toString())
                              .then((value) {
                            NotificationService().showNotification(
                                title: 'Event joined successfully',
                                body: 'Succesfully created');
                          });
                        } else {
                          print('event creatinon failes');
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Error',
                                      style:
                                          TextStyle(color: Color(0xff3854DC))),
                                  content: Text(
                                      'Failed to join Event. Please fill in all the required fields.'),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: Text('OK',
                                          style: TextStyle(
                                              color: Color(0xff3854DC))),
                                    ),
                                  ],
                                );
                              });
                        }
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
