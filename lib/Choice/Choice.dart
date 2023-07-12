
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/Signup.dart';
import '../auth/login.dart';
import '../widget/Roundbutton.dart';


class Choice extends StatefulWidget {
  Choice({Key? key}) : super(key: key);

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  double height = 0;

  double width = 0;



  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    print("width of screen is $width");
    print("height of screen is $height");
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  "assets/ball G.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                )),
            Positioned(
              top: height * 0.53304258283,
              child: Container(
                height: height,
                color: Color(0xffF6F6F6),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.02422920831,
                      left: width * 0.05092686901,
                      right: width * 0.05092686901,
                      bottom: height * 0.07268762493),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Logo",
                              style: TextStyle(
                                  color: Color(0xff660099),
                                  fontSize: (height * 0.02665212914 / 2) +
                                      (width * 0.05601955591 / 2),
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              " is the largest platform to find",
                              style: TextStyle(
                                  fontSize: (height * 0.02422920831 / 2) +
                                      (width * 0.05092686901 / 2),
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Text("best job ever",
                            style: TextStyle(
                                fontSize: (height * 0.02422920831 / 2) +
                                    (width * 0.05092686901 / 2),
                                fontWeight: FontWeight.w400)),
                        Text("in publishing and graphic design, Lorem ipsum is",
                            style: TextStyle(
                                fontSize: (height * 0.01938336664 / 2) +
                                    (width * 0.04074149521 / 2),
                                fontWeight: FontWeight.w300)),
                        Text("a placeholder text commonly used to",
                            style: TextStyle(
                                fontSize: (height * 0.01938336664 / 2) +
                                    (width * 0.04074149521 / 2),
                                fontWeight: FontWeight.w300)),
                        Text("demonstrate the visual form of a document",
                            style: TextStyle(
                                fontSize: (height * 0.01938336664 / 2) +
                                    (width * 0.04074149521 / 2),
                                fontWeight: FontWeight.w300)),
                        SizedBox(
                          height: height * 0.03634381246,
                        ),
                        // RoundButton(
                        //   title: 'Login',
                        //   onTap: () {
                        //     Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                        //
                        //   }, color: Color(0xff3854DC),
                        // ),
                        Container(
                          height: height * 0.06057302077,
                          width: width * 0.89122020778,
                          decoration: BoxDecoration(
                            color: Color(0xff3854DC),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 1.0,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Text(
                                "Login",

                                ///18
                                style: TextStyle(
                                  fontSize: (height * 0.02180628747 / 2) +
                                      (width * 0.04583418211 / 2),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01211460415,
                        ),
                        Container(
                          height: height * 0.06057302077,
                          width: width * 0.89122020778,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 1.0,
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signup()));
                              },
                              child: Text(
                                "Sign up",

                                ///18
                                style: TextStyle(
                                  fontSize: (height * 0.02180628747 / 2) +
                                      (width * 0.04583418211 / 2),
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
