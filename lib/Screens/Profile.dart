
import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:flutter/material.dart';

import 'Profile edit.dart';



class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xffF7F6F6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text("Profile",style: TextStyle(color: Color(0xff000000),fontSize: 20,fontWeight: FontWeight.w400),),
                          Spacer(),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileEdit()));
                            },
                              child: Image.asset("assets/edit.png",width: 30,))
                        ],
                      ),

                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Center(child: Image.asset("assets/boy.png",width: 200,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name:",style: TextStyle(color: Color(0xff000000),fontSize: 18,fontWeight: FontWeight.w400),),
                        SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          child: Text("John Doe",style: TextStyle(color: Color(0xff6E7781)),),
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
                        SizedBox(height: 10,),
                        Text("User Name:",style: TextStyle(color: Color(0xff000000),fontSize: 18,fontWeight: FontWeight.w400),),
                        SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          child: Text("John Doe",style: TextStyle(color: Color(0xff6E7781)),),
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
                        SizedBox(height: 10,),
                        Text("Email:",style: TextStyle(color: Color(0xff000000),fontSize: 18,fontWeight: FontWeight.w400),),
                        SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          child: Text("John_Doe@gmail.com",style: TextStyle(color: Color(0xff6E7781)),),
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
                        SizedBox(height: 10,),
                        Text("Age:",style: TextStyle(color: Color(0xff000000),fontSize: 18,fontWeight: FontWeight.w400),),
                        SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          child: Text("21",style: TextStyle(color: Color(0xff6E7781)),),
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
                        SizedBox(height: 10,),
                        Text("Address:",style: TextStyle(color: Color(0xff000000),fontSize: 18,fontWeight: FontWeight.w400),),
                        SizedBox(height: 10,),
                        Container(
                          width: double.infinity,

                          child: Text("Cricket lover | Software engineer by day,cricketer by evening | Passionate about the game | Team player | Striving for sixes and wickets | Balancing code and cricket | living for the sound of leather on willow | Chasing boundaries and career goals | Making every match count!",style: TextStyle(color: Color(0xff6E7781)),),
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


                ],
              ),
            ),
          )
        ));
  }
}
