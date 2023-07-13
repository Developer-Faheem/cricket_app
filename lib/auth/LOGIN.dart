
import 'package:cricket_app/auth/Sign%20in.dart';

import 'package:flutter/material.dart';



import '../Screens/onboarding.dart';
import '../Utils/AuthService.dart';

import '../main.dart';

import '../widget/Roundbutton.dart';

import 'Forget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double height=0;
  double width=0;
  final formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return "Email is not valid";
    }
    // You can add more complex validation logic here
    // For example, you can use regular expressions to check for a valid email format.
    // Here's a basic example using a regular expression pattern:
    // if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b').hasMatch(value)) {
    //   return 'Please enter a valid email address';
    // }
    return null;
  }
  TextEditingController passcontroler = TextEditingController();
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else  if (value!.length <= 7) {
      return "password must be greater than 7";
    }
    // You can add more complex validation logic here
    // For example, you can require a minimum length for the password.
    // if (value.length < 6) {
    //   return 'Password must be at least 6 characters long';
    // }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEFF0F2),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset("assets/Startup.png", width: 200)),
                  Center(
                    child: Text(
                      "CricSpotter",
                      style: TextStyle(
                        color: Color(0xff3854DC),
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  //height 20
                  SizedBox(height: height*0.02422920831),
                  Text(
                    "Email",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: height * 0.06057302077,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffC8C8C8)),
                      borderRadius: BorderRadius.circular(
                          height * 0.01211460415 / 2 + width * 0.0254634345 / 2),
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      validator: validateEmail,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Password",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: height * 0.06057302077,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffC8C8C8)),
                      borderRadius: BorderRadius.circular(
                          height * 0.01211460415 / 2 + width * 0.0254634345 / 2),
                    ),
                    child: TextFormField(
                      controller: passcontroler,
                      validator: validatePassword,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                        ),
                      ),
                    ),
                  ),

                  //heih 10
                  SizedBox(height: height*0.01211460415),

                  SizedBox(height: height*0.01211460415),
                  RoundButton(title: 'Login', onTap: () async {   if (formkey.currentState!.validate()) {
                    if (formkey.currentState!.validate()) {
                      await FirebaseServices.login(_emailController.text.trim(), passcontroler.text.trim());
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Onbaording()));
                    }

                  } }, color:  Color(0xff3854DC),),
                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(
                        " Dont have an account ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize:(height* 0.01938336664 /2)+(width*0.04074149521 /2),
                            color: Color(0xff000000)
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
                      }, child: Text("Sign up",style: TextStyle(color:  Color(0xff3854DC),fontWeight: FontWeight.bold),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
