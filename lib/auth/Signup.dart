import 'package:cricket_app/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../Utils/AuthService.dart';
import '../widget/Roundbutton.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  double height = 0;
  double width = 0;

  final formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _cpass = TextEditingController();
  final _passcontroler = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _cpass.dispose();
    _passcontroler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Login()));
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: (height * 0.01817190623 / 2) + (width * 0.03819515176 / 2),
                )),

            ///15
            title: Text(
              "Go to login",
              style: TextStyle(
                  color: Color(0xff0F1828),
                  fontSize:
                  (height * 0.02180628747 / 2) + (width * 0.04583418211 / 2),
                  fontWeight: FontWeight.w400),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: height * 0.12114604155),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  ///25
                  Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: (height * 0.03028651038 / 2) +
                                (width * 0.06365858627 / 2),
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: height * 0.01817190623,
                  ),
                  Center(
                      child: Text(
                        "Please Login to continue",
                        style: TextStyle(
                            fontSize: (height * 0.01938336664 / 2) +
                                (width * 0.04074149521 / 2),
                            fontWeight: FontWeight.w300),
                      )),
                  SizedBox(
                    height: height * 0.02422920831,
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: width * 0.07639030352),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email is empty";
                            } else if (!RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value)) {
                              return "Email is not valid";
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                ///18
                                fontSize: (height * 0.02180628747 / 2) +
                                    (width * 0.04583418211 / 2),
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xffE4E7EB)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xff660099)),
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01211460415),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: width * 0.07639030352),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          ///10
                          borderRadius: BorderRadius.circular((height* 0.01211460415 /2)+(width*0.0254634345 /2)),
                        ),
                        child: TextFormField(
                          controller: _passcontroler,
                          validator: (value) {
                            if (value!.length <= 7) {
                              return "password must be greater than 7";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: (height * 0.02180628747 / 2) +
                                    (width * 0.04583418211 / 2),
                                fontWeight: FontWeight.w400,
                              ),
                              suffixIcon: Container(
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/111.png', // Replace with your image path
                                    width: width *
                                        0.06111224281, // Adjust the image width as per your requirement
                                    height: height * 0.02422920831,
                                    color: Colors
                                        .grey, // Adjust the image height as per your requirement
                                  ),
                                  onPressed: () {
                                    // Add your onPressed logic here
                                  },
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xffE4E7EB)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xff660099)),
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01211460415),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: width * 0.07639030352),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((height* 0.01211460415 /2)+(width*0.0254634345 /2)),
                        ),
                        child: TextFormField(
                          controller: _cpass,
                          validator: (value) {
                            if (value!.length <= 7) {
                              return "password must be greater than 7";
                            } else if (_passcontroler.text == _cpass.text) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Login()));
                              print('Passwords matched!');
                            } else {
                              // Passwords don't match, show an error message or handle the error
                              return 'Passwords does not matched!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                ///18
                                fontSize:(height*0.02180628747 /2)+(width*0.04583418211 /2) ,
                                fontWeight: FontWeight.w400,
                              ),
                              suffixIcon: Container(
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/111.png', // Replace with your image path
                                    width: width *
                                        0.06111224281, // Adjust the image width as per your requirement
                                    height: height * 0.02422920831,
                                    color: Colors
                                        .grey, // Adjust the image height as per your requirement
                                  ),
                                  onPressed: () {
                                    // Add your onPressed logic here
                                  },
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xffE4E7EB)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xff660099)),
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01211460415),
                  Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: width * 0.07639030352),
                      child: RoundButton(
                        title: 'Sign Up',
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            await FirebaseServices.signUp(
                                _emailController.text.trim(),
                                _passcontroler.text.trim(),
                                _cpass.text.trim());
                          }
                        }, color:  Color(0xff3854DC),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
