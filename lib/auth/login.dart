import 'package:cricket_app/HOME.dart';
import 'package:cricket_app/auth/Signup.dart';
import 'package:flutter/material.dart';



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
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          //h 160
          padding:  EdgeInsets.only(top: height*0.19383366648),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: (height*0.03028651038/2)+(width*0.06365858627/2), fontWeight: FontWeight.w600),
                    ),
                  ),
                  //height 20
                  SizedBox(height: height*0.02422920831),
                  Padding(
                    //width 30
                    padding:  EdgeInsets.symmetric(horizontal:width*0.07639030352),
                    child: Center(
                      child: Container(
                        height: height*0.07268762493,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((height* 0.01211460415 /2)+(width*0.0254634345 /2)),
                        ),
                        child: TextFormField(
                          controller: emailcontroler,
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
                                fontSize:(height*0.02180628747 /2)+(width*0.04583418211 /2) ,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xff660099)),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                  //heih 10
                  SizedBox(height: height*0.01211460415),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:width*0.07639030352),
                    child: Center(
                      child: Container(
                        //hei 60
                        height: height*0.07268762493,
                        decoration: BoxDecoration(
                          ///10
                          borderRadius: BorderRadius.circular((height* 0.01211460415 /2)+(width*0.0254634345 /2)),
                        ),
                        child: TextFormField(
                          controller: passcontroler,
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
                                fontSize:(height*0.02180628747 /2)+(width*0.04583418211 /2) ,
                                fontWeight: FontWeight.w400,
                              ),
                              suffixIcon: Container(
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/111.png', // Replace with your image path
                                    width: width*0.06111224281, // Adjust the image width as per your requirement
                                    height: height*0.02422920831 ,
                                    color: Colors.grey,// Adjust the image height as per your requirement
                                  ),
                                  onPressed: () {

                                  },
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xff660099)),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.01211460415),
                  Padding(
                      padding:  EdgeInsets.symmetric(horizontal:width*0.07639030352),
                      child: RoundButton(title: 'Login', onTap: () async {   if (formkey.currentState!.validate()) {
                        if (formkey.currentState!.validate()) {
                          await FirebaseServices.login(emailcontroler.text.trim(), passcontroler.text.trim());
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => btmnavigation()));
                        }

                      } }, color:  Color(0xff3854DC),)
                  ),
                  SizedBox(height: height*0.03819515176),
                  Container(

                    width: width*0.84029333876,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Forget()));
                      },
                      child: Text(
                        "Forget Password",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    //width 30
                    padding:  EdgeInsets.symmetric(horizontal:width*0.07639030352),
                    child: Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'or',
                            ///16
                            style: TextStyle(fontSize:(height* 0.01938336664 /2)+(width*0.04074149521 /2) ,),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey)),
                      ],
                    ),
                  ),
                  SizedBox(height: height*0.01211460415),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:width*0.07639030352),
                    child: Container(
                      ///height 50
                        height: height*0.06057302077,
                        decoration: BoxDecoration(
                          ///5
                            borderRadius: BorderRadius.circular((height* 0.00605730207/2)+(width*0.01273171725/2)),
                            border: Border.all(color: Color(0xff000000))
                        ),
                        child: Padding(
                          ///10
                          padding:  EdgeInsets.symmetric(horizontal: width*0.0254634345),
                          child: Row(
                            children: [
                              Icon(
                                Icons.facebook,

                                color: Colors.blue,
                              ),
                              SizedBox(width: width*0.10185373803,),
                              Text("Login with Facebook",style:TextStyle(
                                color: Colors.grey,
                                ///18
                                fontSize: (height*0.02180628747   /2)+(width*0.04583418211/2),
                                fontWeight: FontWeight.w400,
                              ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: height*0.01211460415),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:width*0.07639030352),
                    child: Container(
                        height: height*0.06057302077,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular((height* 0.00605730207/2)+(width*0.01273171725/2)),
                            border: Border.all(color: Color(0xff000000))
                        ),
                        child: Padding(
                          // w 10
                          padding:  EdgeInsets.symmetric(horizontal: height*0.0254634345),
                          child: Row(
                            children: [
                              Icon(
                                Icons.g_translate_rounded,

                                color: Colors.red,
                              ),
                              SizedBox(width: width *0.10185373803,),
                              Text("Login with Google",style:TextStyle(
                                color: Colors.grey,
                                fontSize: (height*0.02180628747   /2)+(width*0.04583418211/2),
                                fontWeight: FontWeight.w400,
                              ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                  //height 100
                  SizedBox(height: height*0.12114604155,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(
                        " Dont have an account ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize:(height* 0.01938336664 /2)+(width*0.04074149521 /2),
                            color: Colors.grey
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                      }, child: Text("Sign up",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),))
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
