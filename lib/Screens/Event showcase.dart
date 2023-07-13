import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:flutter/material.dart';

import 'Create events.dart';
import 'Edit event.dart';
import 'JOIN PAGE.dart';
import 'Mesage event.dart';
import 'delete confirm.dart';

class Eventshowcase extends StatefulWidget {
  const Eventshowcase({super.key});

  @override
  State<Eventshowcase> createState() => _EventshowcaseState();
}

class _EventshowcaseState extends State<Eventshowcase> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3854DC),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            "assets/arrow.png",
            width: 10,
          ),
        ),
        title: const Text(
          "CricSpotter",
          style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/noti.png",
              width: 30,
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
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event Created",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 24,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>EditEvent()));
                            },
                            child: Image.asset("assets/edit.png",width: 20,))),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Match Type",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50.0,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "T20",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
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
                      height: 15,
                    ),
                    Text(
                      "Loctaion",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50.0,
                      child: Text("XXXX,XXX,XX,XXXX"),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
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
                      height: 25,
                    ),
                    Text(
                      "Date",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
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
                        'DD / MM / YYYY',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff989696)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Start-Time",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50.0,
                      child: Text(
                        "XX : XX",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff989696)),
                      ),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
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
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                child: Divider(
                  color: Color(0xffD9D9D9),
                  thickness: 1.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Enter team name",
                        style: TextStyle(color: Color(0xff000000)),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: Text("xyz",
                        style: TextStyle(
                            color: Color(0xff989696),
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
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
                    height: 20,
                  ),
                  Text(
                    "Insert team image",
                    style: TextStyle(color: Color(0xff000000)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Container(
                  //   height: 80.0,
                  //   width: 80,
                  //   child: Image.asset("assets/eventshowcase1.png",fit: BoxFit.cover,),
                  //   padding: EdgeInsets.all(10.0),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     border: Border.all(color: Colors.grey),
                  //     borderRadius: BorderRadius.circular(5.0),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black38,
                  //         blurRadius: 2.0,
                  //         offset: Offset(0, 2), // Shadow position from bottom
                  //       ),
                  //       BoxShadow(
                  //         color: Colors.black38,
                  //         blurRadius: 2.0,
                  //         offset: Offset(2, 0), // Shadow position from right
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    width: 80,
                      height: 80,
                      child: Image.asset("assets/eventshowcase1.png",fit: BoxFit.cover,)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                child: Divider(
                  color: Color(0xffD9D9D9),
                  thickness: 1.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Enter team name",
                        style: TextStyle(color: Color(0xff000000)),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: Text("ABC",
                        style: TextStyle(
                            color: Color(0xff989696),
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
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
                    height: 20,
                  ),
                  Text(
                    "Insert team image",
                    style: TextStyle(color: Color(0xff000000)),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                      width: 80,
                      height: 80,
                      child: Image.asset("assets/home2.png",fit: BoxFit.cover,)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RoundButton(
                title: 'DELETE EVENT',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Color(0xff3854DC),
                      title: Center(child: Image.asset("assets/boy.png", width: 100)),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Are you sure you want to", style: TextStyle(fontSize: 16,   color: Color(0xffFFFFFFDB),)),
                          Text(" delete the event?", style: TextStyle(fontSize: 16,   color: Color(0xffFFFFFFDB),)),
                        ],
                      ),
                      actions: [
                        Container(
                          width: 120,
                          height: 40,
                          color: Color(0xffFFFFFFDB),
                          child: TextButton(
                            onPressed: () {
                              // Perform the log out action here
                              // For example, you can call a log out function or navigate to the log out screen
                              // ...
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> deleteconfirm()));// Close the alert dialog
                            },
                            child: Text(
                              "Yes,I am sure.",
                              style:
                              TextStyle(color: Color(0xff0C0C0C),fontSize: 10,fontWeight: FontWeight.w400),

                            ),
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 40,
                          color: Color(0xffFFFFFFDB),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the alert dialog
                            },
                            child: Text(
                              "No, I am not sure",
                              style: TextStyle(color: Color(0xff0C0C0C),fontWeight: FontWeight.w400,fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                color: Color(0xff3854DC),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
