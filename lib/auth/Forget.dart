
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'LOGIN.dart';



class Forget extends StatefulWidget {
  Forget({Key? key}) : super(key: key);

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  double height = 0;

  double width = 0;

  final auth=FirebaseAuth.instance;
  TextEditingController email=TextEditingController();


  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => Third()));
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                )),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: height * 0.12114604155),
            child: Column(
              children: [
                Center(
                    child: Text(
                      "Forget Password",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: height * 0.14537524986,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.07639030352),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Color(0xff999999),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Color(0xff999999)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Color(0xff660099)),
                            )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01211460415,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.07639030352),
                  child: Container(
                    height: height * 0.06057302077,
                    width: width * 1.01853738032,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login()));
                          auth.sendPasswordResetEmail(email: email.text.toString()).then((value) {

                            Fluttertoast.showToast(msg: "we have sent you link please check your email");
                            }
                          ).onError((error, stackTrace) {

                            Fluttertoast.showToast(msg: error.toString());
                          });
                        },
                        child: Text(
                          "Send Code",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
