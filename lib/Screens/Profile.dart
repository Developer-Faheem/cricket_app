import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Profile edit.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

   String? email;
   String? name;
   String? userName; 
   String? age;
   String bio="";
   String profilePicture="";

  double height = 0;
  double width = 0;


void fetchProfileData() async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      User? user = _auth.currentUser;

      if (user == null) {
        print('User not signed in.');
        //   return;
      }

      String userId = user!.uid;
      print(userId);
      print('---------------------+++++++++++++++++++++++++++++++++=');

        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('Users data')
        .doc(userId.toString())
        .get();

      // Check if the document exists before accessing its data
if (userSnapshot.exists) {
  // Access the data using the data() method
  Map<String, dynamic> userData = userSnapshot.data() as Map<String,dynamic>;

  // Now you can access individual fields in the document using their keys
  setState(() {
     name = userData['name']; // Replace 'field1' with your actual field name
   userName = userData['username'];
   email=userData['email'];
   age = userData['age'];
   profilePicture=userData['profilePicture'] ;
     bio=userData['bio'] ;// Replace 'field2' with your actual field name
  });
  

  print(name.toString());
  print(userName);
  // Do something with the data...
} else {
  // The document doesn't exist
}

  
    } catch (e) {
      print('Error fetching data: $e');
      //return [];
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchProfileData();
  }

  
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff3854DC),
              automaticallyImplyLeading: false,
              leading:  Padding(
          padding:  EdgeInsets.only(left: width* 0.05092686901 ),
          child: GestureDetector(onTap: (){
           Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  btmnavigation()),
                );
          }, child: Image.asset("assets/arrow.png",width: width* 0.0254634345 ,)),
        ),
              title: Text(
                "CricSpotter",
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w400,
                    fontSize: 24.sp),
              ),
              centerTitle: true,
            
            ),
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.07268762493,
                      decoration: BoxDecoration(
                        color: Color(0xffF7F6F6),
                        borderRadius: BorderRadius.circular(
                            height * 0.02422920831 / 2 +
                                width * 0.05092686901 / 2),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.05092686901),
                        child: Row(
                          children: [
                            Text(
                              "Profile",
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfileEdit(
                                            email:email,
                                            name : name,
                                            userName :userName,
                                            age:age,
                                            profilePicture:profilePicture,
                                            bio:bio
                                          )));
                                },
                                child: Image.asset(
                                  "assets/edit.png",
                                  width: width * 0.07639030352,
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01211460415,
                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                    width: width * 0.50926869016,
                    height: width * 0.50926869016, // Make the height equal to the width to create a perfect circle
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.50926869016 / 2), // Half of the width makes it a circle
                      color: Colors.transparent, // Optional, set a color if you want a background color for the container
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(width * 0.50926869016 / 2), // Same as the container's decoration
                     child: profilePicture == "" 
                              ? Image.asset(
                                  "assets/pp.png",
                                  width: width * 0.50926869016,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  profilePicture,
                                  width: width * 0.50926869016,
                                  fit: BoxFit.cover,
                                ),
                            ),
                  ),
                    ],
                  ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.07639030352,
                          vertical: height * 0.02422920831),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name:",
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: height * 0.01211460415,
                          ),
                          Container(
                            width: double.infinity,
                            height: height * 0.06057302077,
                            child: Text(
                              "$name",
                              style: TextStyle(color: Color(0xff6E7781)),
                            ),
                            padding: EdgeInsets.all(height * 0.01211460415 / 2 +
                                width * 0.0254634345 / 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(
                                  width * 0.01273171725 / 2 +
                                      height * 0.00605730207 / 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 2.0,
                                  offset: Offset(
                                      0, 2), // Shadow position from bottom
                                ),
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 2.0,
                                  offset: Offset(
                                      2, 0), // Shadow position from right
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01211460415,
                          ),
                          Text(
                            "User Name:",
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: height * 0.01211460415,
                          ),
                          Container(
                            width: double.infinity,
                            height: height * 0.06057302077,
                            child: Text(
                              "$userName",
                              style: TextStyle(color: Color(0xff6E7781)),
                            ),
                            padding: EdgeInsets.all(height * 0.01211460415 / 2 +
                                width * 0.0254634345 / 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(
                                  width * 0.01273171725 / 2 +
                                      height * 0.00605730207 / 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 2.0,
                                  offset: Offset(
                                      0, 2), // Shadow position from bottom
                                ),
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 2.0,
                                  offset: Offset(
                                      2, 0), // Shadow position from right
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01211460415,
                          ),
                          Text(
                            "Email:",
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: height * 0.01211460415,
                          ),
                         Container(
                          width: double.infinity,
                          height: height * 0.06057302077,
                          child: Center(
                            child: Text(
                              email.toString(),
                              style: TextStyle(color: Color(0xff6E7781)),
                            ),
                          ),
                          padding: EdgeInsets.all(height * 0.01211460415 / 2 + width * 0.0254634345 / 2),
                          decoration: BoxDecoration(
                            color: Colors.grey, // Set the background color to grey
                            borderRadius: BorderRadius.circular(width * 0.01273171725 / 2 + height * 0.00605730207 / 2),
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
                            height: height * 0.01211460415,
                          ),
                          Text(
                            "Age:",
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: height * 0.01211460415,
                          ),
                          Container(
                            width: double.infinity,
                            height: height * 0.06057302077,
                            child: Text(
                              "$age",
                              style: TextStyle(color: Color(0xff6E7781)),
                            ),
                            padding: EdgeInsets.all(height * 0.01211460415 / 2 +
                                width * 0.0254634345 / 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(
                                  width * 0.01273171725 / 2 +
                                      height * 0.00605730207 / 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 2.0,
                                  offset: Offset(
                                      0, 2), // Shadow position from bottom
                                ),
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 2.0,
                                  offset: Offset(
                                      2, 0), // Shadow position from right
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01211460415,
                          ),
                          Text(
                            "Bio:",
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: height * 0.01211460415,
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              bio==""? "please add your bio":bio.toString() ,
                              style: TextStyle(color: Color(0xff6E7781)),
                            ),
                            padding: EdgeInsets.all(height * 0.01211460415 / 2 +
                                width * 0.0254634345 / 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(
                                  width * 0.01273171725 / 2 +
                                      height * 0.00605730207 / 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 2.0,
                                  offset: Offset(
                                      0, 2), // Shadow position from bottom
                                ),
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 2.0,
                                  offset: Offset(
                                      2, 0), // Shadow position from right
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
            )));
  }
}
