import 'package:cricket_app/auth/LOGIN.dart';
import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Utils/AuthService.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  double height = 0;
  double width = 0;

  final formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _ageController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(
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

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value!.length <= 7) {
      return "password must be greater than 7";
    }
    // You can add more complex validation logic here
    // For example, you can require a minimum length for the password.
    // if (value.length < 6) {
    //   return 'Password must be at least 6 characters long';
    // }
    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    }
    // You can add more complex validation logic here
    // For example, you can check if the age is within a certain range.
    // if (int.tryParse(value) < 18) {
    //   return 'You must be at least 18 years old';
    // }
    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEFF0F2),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05092686901,
                vertical: height * 0.02422920831),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Image.asset("assets/Startup.png",
                          width: width * 0.50926869016)),
                  Center(
                    child: Text(
                      "CricSpotter",
                      style: TextStyle(
                        color: Color(0xff3854DC),
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    "Enter your name",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: height * 0.00605730207),
                  Container(
                    height: height * 0.06057302077,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffC8C8C8)),
                      borderRadius: BorderRadius.circular(
                          height * 0.01211460415 / 2 +
                              width * 0.0254634345 / 2),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _nameController,
                      validator: validateName,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.05092686901),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffE4E7EB)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffE4E7EB)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.00605730207),
                  Text(
                    "Username",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: height * 0.00605730207),
                  Container(
                    height: height * 0.06057302077,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffC8C8C8)),
                      borderRadius: BorderRadius.circular(
                          height * 0.01211460415 / 2 +
                              width * 0.0254634345 / 2),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _usernameController,
                      validator: validateUsername,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.05092686901),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffE4E7EB)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffE4E7EB)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.00605730207),
                  Text(
                    "Email",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: height * 0.00605730207),
                  Container(
                    height: height * 0.06057302077,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffC8C8C8)),
                      borderRadius: BorderRadius.circular(
                          height * 0.01211460415 / 2 +
                              width * 0.0254634345 / 2),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: validateEmail,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.05092686901),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffE4E7EB)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffE4E7EB)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.00605730207),
                  Text(
                    "Password",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: height * 0.00605730207),
                  Container(
                    height: height * 0.06057302077,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffC8C8C8)),
                      borderRadius: BorderRadius.circular(
                          height * 0.01211460415 / 2 +
                              width * 0.0254634345 / 2),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      validator: validatePassword,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.05092686901),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffE4E7EB)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffE4E7EB)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.00605730207),
                  Text(
                    "Age",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: height * 0.00605730207),
                  Container(
                    height: height * 0.06057302077,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffC8C8C8)),
                      borderRadius: BorderRadius.circular(
                          height * 0.01211460415 / 2 +
                              width * 0.0254634345 / 2),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _ageController,
                      validator: validateAge,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.05092686901),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffE4E7EB)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffE4E7EB)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.00605730207),
                  Text(
                    "Address",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: height * 0.00605730207),
                  Container(
                    height: height * 0.06057302077,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffC8C8C8)),
                      borderRadius: BorderRadius.circular(
                          height * 0.01211460415 / 2 +
                              width * 0.0254634345 / 2),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      controller: _addressController,
                      validator: validateAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.05092686901),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffE4E7EB)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xffE4E7EB)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.02422920831  ),
                  RoundButton(
                    title: "Sign Up",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                       
                        await FirebaseServices.signUp(
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                            _usernameController.text.trim());
                            
                             Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      }
                    },
                    color: Color(0xff3854DC),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
