import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Create events.dart';
import 'Edit event.dart';
import 'JOIN PAGE.dart';
import 'Mesage event.dart';
import 'delete confirm.dart';

class Eventshowcase extends StatefulWidget {
  String match;
  String location;
  String date;
  String startTime;
  String team1;
  String team2;
  String image1;
  String image2;
  String uid;

  Eventshowcase(
      {required this.date,
      required this.image1,
      required this.image2,
      required this.location,
      required this.match,
      required this.startTime,
      required this.team1,
      required this.team2
      ,required this.uid});

  @override
  State<Eventshowcase> createState() => _EventshowcaseState();
}

class _EventshowcaseState extends State<Eventshowcase> {


  void deleteDocument() async {
  try {
  
 
    // Get a reference to the document
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('match')
        .doc(widget.uid.toString());

    // Delete the document
    await documentReference.delete().then((value){
     
       Navigator.push(
           context,
          MaterialPageRoute(
             builder: (context) =>
        deleteconfirm()));
    });

    print('Document deleted successfully.');
  } catch (e) {
    print('Error deleting document: $e');
  }
}


  double height = 0;
  double width = 0;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                    height * 0.03634381246 / 2 + width * 0.07639030352 / 2),
                topRight: Radius.circular(
                    height * 0.03634381246 / 2 + width * 0.07639030352 / 2),
              )),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05092686901,
                    vertical: height * 0.03634381246),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event Created",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: height * 0.01817190623,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditEvent(
                                              match: widget.match,
                                              location: widget.location,
                                              date: widget.date,
                                              startTime: widget.startTime,
                                              team1: widget.team1,
                                              team2: widget.team2,
                                              image1: widget.image1,
                                              image2: widget.image2,
                                              uid: widget.uid,
                                      
                                      )));
                            },
                            child: Image.asset(
                              "assets/edit.png",
                              width: width * 0.05092686901,
                            ))),
                    SizedBox(
                      height: height * 0.01817190623,
                    ),
                    Text(
                      "Match Type",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: height * 0.01817190623,
                    ),
                    Container(
                      height: height * 0.06057302077,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.match.toString(),
                              style: TextStyle(
                                  fontSize: 12.sp, color: Color(0xff989696)),
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(height * 0.01211460415 / 2 +
                          width * 0.0254634345 / 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                            (height * 0.00605730207 / 2) +
                                (width * 0.01273171725 / 2)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 2.0,
                            offset: Offset(0, 2), // Shadow position from bottom
                          ),
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 2.0,
                            offset: Offset(2, 0), // Shadow position from right
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01817190623,
                    ),
                    Text(
                      "Location",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: height * 0.01817190623,
                    ),
                    Container(
                      height: height * 0.06057302077,
                      child: Text(
                        widget.location.toString(),
                        style: TextStyle(
                            fontSize: 12.sp, color: Color(0xff989696)),
                      ),
                      padding: EdgeInsets.all(height * 0.01211460415 / 2 +
                          width * 0.0254634345 / 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                            (height * 0.00605730207 / 2) +
                                (width * 0.01273171725 / 2)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 2.0,
                            offset: Offset(0, 2), // Shadow position from bottom
                          ),
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 2.0,
                            offset: Offset(2, 0), // Shadow position from right
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03028651038,
                    ),
                    Text(
                      "Date",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: height * 0.01817190623,
                    ),
                    Container(
                      padding: EdgeInsets.all(height * 0.01211460415 / 2 +
                          width * 0.0254634345 / 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                            (height * 0.00605730207 / 2) +
                                (width * 0.01273171725 / 2)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 2.0,
                            offset: Offset(0, 2), // Shadow position from bottom
                          ),
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 2.0,
                            offset: Offset(2, 0), // Shadow position from right
                          ),
                        ],
                      ),
                      child: Text(
                        widget.date.toString(),
                        style: TextStyle(
                            fontSize: 12.sp, color: Color(0xff989696)),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03028651038,
                    ),
                    Text(
                      "Start-Time",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: height * 0.03028651038,
                    ),
                    Container(
                      height: height * 0.06057302077,
                      child: Text(
                        widget.startTime.toString(),
                        style: TextStyle(
                            fontSize: 12.sp, color: Color(0xff989696)),
                      ),
                      padding: EdgeInsets.all(height * 0.01211460415 / 2 +
                          width * 0.0254634345 / 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                            (height * 0.00605730207 / 2) +
                                (width * 0.01273171725 / 2)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 2.0,
                            offset: Offset(0, 2), // Shadow position from bottom
                          ),
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 2.0,
                            offset: Offset(2, 0), // Shadow position from right
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.03634381246),
              child: Container(
                child: Divider(
                  color: Color(0xffD9D9D9),
                  thickness: 1.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05092686901,
                  vertical: height * 0.01211460415),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "TEAM - 01",
                        style: TextStyle(color: Color(0xff000000)),
                      )),
                  SizedBox(
                    height: height * 0.01211460415,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Enter team name",
                        style: TextStyle(color: Color(0xff000000)),
                      )),
                  SizedBox(
                    height: height * 0.01211460415,
                  ),
                  Container(
                    width: double.infinity,
                    height: height * 0.06057302077,
                    child: Text(widget.team1.toString(),
                        style: TextStyle(
                            color: Color(0xff989696),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400)),
                    padding: EdgeInsets.all(
                        height * 0.01211460415 / 2 + width * 0.0254634345 / 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(
                          (height * 0.00605730207 / 2) +
                              (width * 0.01273171725 / 2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2.0,
                          offset: Offset(0, 2), // Shadow position from bottom
                        ),
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2.0,
                          offset: Offset(2, 0), // Shadow position from right
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02422920831,
                  ),
                  Text(
                    "Insert team image",
                    style: TextStyle(color: Color(0xff000000)),
                  ),
                  SizedBox(
                    height: height * 0.01211460415,
                  ),
                  Container(
                      width: width * 0.20370747606,
                      height: height * 0.09691683324,
                      child: Container(
                                            decoration: BoxDecoration(                                     
                                              image: DecorationImage(
                                                image: NetworkImage(widget.image1.toString()),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                      ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.03634381246),
              child: Container(
                child: Divider(
                  color: Color(0xffD9D9D9),
                  thickness: 1.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05092686901,
                  vertical: height * 0.01211460415),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "TEAM - 02",
                        style: TextStyle(color: Color(0xff000000)),
                      )),
                  SizedBox(
                    height: height * 0.01211460415,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Enter team name",
                        style: TextStyle(color: Color(0xff000000)),
                      )),
                  SizedBox(
                    height: height * 0.01211460415,
                  ),
                  Container(
                    width: double.infinity,
                    height: height * 0.06057302077,
                    child: Text(widget.team2.toString(),
                        style: TextStyle(
                            color: Color(0xff989696),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400)),
                    padding: EdgeInsets.all(
                        height * 0.01211460415 / 2 + width * 0.0254634345 / 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(
                          (height * 0.00605730207 / 2) +
                              (width * 0.01273171725 / 2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2.0,
                          offset: Offset(0, 2), // Shadow position from bottom
                        ),
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2.0,
                          offset: Offset(2, 0), // Shadow position from right
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02422920831,
                  ),
                  Text(
                    "Insert team image",
                    style: TextStyle(color: Color(0xff000000)),
                  ),
                  SizedBox(
                    height: height * 0.01211460415,
                  ),
                  Container(
                      width: width * 0.20370747606,
                      height: height * 0.09691683324,
                      child: 
                      Container(
                                            decoration: BoxDecoration(                                     
                                              image: DecorationImage(
                                                image: NetworkImage(widget.image2.toString()),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                      ),
                ],
              ),
            ),
            Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: width * 0.05092686901),
                child: RoundButton(
                  title: "DELETE EVENT",
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Color(0xff3854DC),
                        title: Center(
                            child: Image.asset("assets/boy.png",
                                width: width * 0.25463434508)),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Are you sure you want to delete",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xffFFFFFFDB),
                                )),
                            Text("the event?",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xffFFFFFFDB),
                                )),
                          ],
                        ),
                        actions: [
                          Container(
                            width: width * 0.30556121409,
                            height: height * 0.04845841662,
                            color: Color(0xffFFFFFFDB),
                            child: TextButton(
                              onPressed: () {
                                // Perform the log out action here
                                // For example, you can call a log out function or navigate to the log out screen
                                // ...

                                deleteDocument();
                               // Close the alert dialog
                              },
                              child: Text(
                                "Yes,I am sure.",
                                style: TextStyle(
                                    color: Color(0xff0C0C0C),
                                    fontSize: 7.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.30556121409,
                            height: height * 0.04845841662,
                            color: Color(0xffFFFFFFDB),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(
                                    context); // Close the alert dialog
                              },
                              child: Text(
                                "No, I am not sure",
                                style: TextStyle(
                                    color: Color(0xff0C0C0C),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 7.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  color: Color(0xff3854DC),
                ))
          ],
        ),
      ),
    ));
  }
}
