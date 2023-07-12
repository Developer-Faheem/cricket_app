import 'package:cricket_app/HOME.dart';
import 'package:cricket_app/JOIN%20PAGE.dart';
import 'package:cricket_app/main.dart';
import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Editjoinpage.dart';
import 'Leave confirm.dart';

class Enrolledevent extends StatefulWidget {
  const Enrolledevent({Key? key});

  @override
  State<Enrolledevent> createState() => _EnrolledeventState();
}

class _EnrolledeventState extends State<Enrolledevent> {
  int _age = 12; // Initial age value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              child: Image.asset(
                "assets/bat.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow:  [
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
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Test Match",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 24,
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "14 / 24 members",
                          style: TextStyle(
                              color: Color(0xff242425),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          "Date: XX-XX-XXXX",
                          style: TextStyle(
                              color: Color(0xff242425),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Start-time: 11: 00am",
                          style: TextStyle(
                              color: Color(0xff242425),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Image.asset(
                          "assets/loc.png",
                          width: 15,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        const Text(
                          "Location: new plaza bahria town, islamabad",
                          style: TextStyle(
                              color: Color(0xff242425),
                              fontSize: 10,
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
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Editjoinpage()));
                          },
                            child: Image.asset("assets/edit.png",width: 20,))),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Choose Your team:",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),

                        Column(
                          children: [
                            Image.asset(
                              "assets/ball G.png",
                              width: 50,
                            ),
                            const Text("Mighty Ducks"),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Enter Your name:",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                        Container(
                          width: 180,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            boxShadow:  [
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
                            padding: const EdgeInsets.only(left: 10,top: 5),
                            child: Text("Cereal Killer",style: TextStyle(
                                color: Color(0xff989696),
                                fontSize: 18,
                                fontWeight: FontWeight.w400),

                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Enter Your age:",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 92.5,
                            height: 41,


                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow:  [
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
                                  width: 30,
                                  child: Center(child: Text("$_age")),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,top: 4),
                                  child: Container(


                                    child: Column(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (_age > 0) {
                                                  _age--;
                                                }
                                              });
                                            },

                                            child: Image.asset("assets/Vector 5.png",width: 20,)),
                                        SizedBox(height: 5,),

                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                _age++;
                                              });
                                            },

                                            child: Image.asset("assets/Vector 6.png",width: 20,)),


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
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Enter Phone-no:",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                        Container(
                          width: 180,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            boxShadow:  [
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
                            padding: const EdgeInsets.only(left: 5,top: 10),
                            child: Text("0000-0000000",style:TextStyle(
                                color: Color(0xff989696),
                                fontSize: 18,
                                fontWeight: FontWeight.w400),

                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    RoundButton(
                      title: "LEAVE EVENT",
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
                                Text("Are you sure you want to leave", style: TextStyle(fontSize: 16,   color: Color(0xffFFFFFFDB),)),
                                Text("the event?", style: TextStyle(fontSize: 16,   color: Color(0xffFFFFFFDB),)),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Leaveconfirm()));// Close the alert dialog
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
