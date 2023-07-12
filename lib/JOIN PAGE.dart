import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:flutter/material.dart';

import 'Confirmation page.dart';
import 'Informationadded.dart';

class Joinpage extends StatefulWidget {
  const Joinpage({Key? key});


  @override
  State<Joinpage> createState() => _JoinpageState();
}

class _JoinpageState extends State<Joinpage> {
  double height=0;
  double width=0;
  int _age = 12; // Initial age value

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3854DC),
        leading:  Padding(
          padding:  EdgeInsets.only(left: width*0.05092686901 ),
          child: Image.asset("assets/arrow.png",width:width* 0.0254634345,),
        ),
        title: const Text("CricSpotter",style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w400,fontSize: 24),),
        centerTitle: true,
        actions: [ Padding(
          padding:  EdgeInsets.only(left: width*0.05092686901 ),
          child: Image.asset("assets/noti.png",width: width*0.07639030352 ,),
        )],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: height* 0.28012773824,
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
                padding:  EdgeInsets.only(left:width*0.05092686901  , top: height*0.01211460415, bottom: height*0.01211460415),
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
                         SizedBox(
                          width: width*0.07639030352 ,
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
                         SizedBox(
                          width: width* 0.0305561214,
                        ),
                         Image.asset(
                          "assets/loc.png",
                          width: width*0.03819515176,
                        ),
                         SizedBox(
                          width: width*0.0050926869,
                        ),
                        Text(
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
                padding:  EdgeInsets.symmetric(vertical: height*0.04845841662, horizontal: width*0.05092686901 ),
                child: Column(
                  children: [
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
                              "assets/Elli G.png",
                              width: width*0.12731717254,
                            ),
                            const Text("Rising Stars"),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/ball G.png",
                              width: width*0.12731717254,
                            ),
                            const Text("Mighty Ducks"),
                          ],
                        )
                      ],
                    ),
                     SizedBox(
                      height: height*0.02422920831 ,
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
                          width: width*0.45834182114,
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
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding:  EdgeInsets.only(left: width*0.0254634345 ),
                              hintText: "Cereal Killer",
                              hintStyle: TextStyle(
                                  color: Color(0xff989696),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ),
                     SizedBox(
                      height: height*0.02422920831 ,
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
                          padding:  EdgeInsets.only(left: width* 0.05092686901 ),
                          child: Container(
                            width: width*0.23553676919,
                            height: height*0.04966987703,


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
                                  width: width*0.07639030352 ,
                                  child: Center(child: Text("$_age")),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: width*0.05092686901,top: height*0.00484425713),
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

                                            child: Image.asset("assets/Vector 5.png",width: width*0.05092686901,)),
                                        SizedBox(height: height*0.00605730207,),

                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                _age++;
                                              });
                                            },

                                            child: Image.asset("assets/Vector 6.png",width: width* 0.05092686901 ,)),


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
                      height: height*0.02422920831 ,
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
                          width: width*0.45834182114,
                          height: height*0.06057302077,
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
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding:  EdgeInsets.only(left: width* 0.0254634345 ),
                              hintText: "0000-0000000",
                              hintStyle: TextStyle(
                                  color: Color(0xff989696),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(height: height*  0.01211460415  ,),
                    RoundButton(title: "confirm", onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=> Confirmationpage()));
                    }, color: Color(0xff3854DC),)
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
