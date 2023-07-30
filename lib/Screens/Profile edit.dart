
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Profile confirm.dart';



class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {

  double height = 0;
  double width = 0;
  String? name;
  String? email;
  String? username;
  String? age;

  final nameController=TextEditingController();
  final usernameController=TextEditingController();
  final emailController=TextEditingController();
   final ageContoller=TextEditingController();
  

void editProfile(String name ,String email,String age,String username)async{
 try {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;

    if (user == null) {
      print('User not signed in.');
      return;
    }

    String userId = user.uid;
    print(userId);

   
    CollectionReference usersCollection = FirebaseFirestore.instance.collection("Users data");


    String userDocumentId = userId;

    // Update the fields you want to edit in the user document
    Map<String, dynamic> updatedData = {
      'name': name, 
      'email': email,
      'username':username, 
      "age":age
    };

    // Perform the update operation
    await usersCollection.doc(userDocumentId).update(updatedData).then((value) => {
     Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileConfirm()))
    });

    print('Profile data updated successfully.');
  } catch (e) {
    print('Error updating profile data: $e');
  }

}

  
  // void getcurrentUserData()async{
  //   //reference of collection
  //      CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users data');
  //       //get specific document
  //       FirebaseAuth _auth = FirebaseAuth.instance;
  //   User? user = _auth.currentUser;
  //   print(user!.uid);

  //       var documentSnapshot =
  //       await usersCollection.doc(user!.uid).get();

  //       print(documentSnapshot['name']);
  // }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
   // getcurrentUserData();

  }
    
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff3854DC),
              leading: Padding(
                padding: EdgeInsets.only(left: width * 0.05092686901),
                child: Image.asset(
                  "assets/arrow.png",
                  width: width * 0.0254634345,
                ),
              ),
              title: Text(
                "CricSpotter",
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w400,
                    fontSize: 24.sp),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: EdgeInsets.only(left: width * 0.05092686901),
                  child: Image.asset(
                    "assets/noti.png",
                    width: width * 0.07639030352,
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
                      height: height*0.07268762493,
                      decoration: BoxDecoration(
                        color: Color(0xffF7F6F6),
                        borderRadius: BorderRadius.circular(height* 0.02422920831 /2 + width*  0.05092686901 /2),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width*  0.05092686901 ),
                        child: Row(
                          children: [
                            Text("Profile",style: TextStyle(color: Color(0xff000000),fontSize: 15.sp,fontWeight: FontWeight.w400),),

                          ],
                        ),

                      ),
                    ),
                    SizedBox(height: height* 0.01211460415,),
                    Container(
                      child: Center(child: Image.asset("assets/boy.png",width: width*0.50926869016,)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.07639030352,
                          vertical: height * 0.02422920831),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name:",style: TextStyle(color: Color(0xff000000),fontSize: 14.sp,fontWeight: FontWeight.w400),),
                          SizedBox(height: height* 0.01211460415,),
                          Container(
                            width: double.infinity,
                            height: height * 0.06057302077,
                            child: TextField(
                              controller: nameController,
                            keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: "John Doe",
                                hintStyle:  TextStyle(color: Color(0xff6E7781)),
                              ),
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
                          SizedBox(height: height* 0.01211460415,),
                          Text("User Name:",style: TextStyle(color: Color(0xff000000),fontSize: 14.sp,fontWeight: FontWeight.w400),),
                          SizedBox(height: height* 0.01211460415,),
                          Container(
                            width: double.infinity,
                            height: height * 0.06057302077,
                            child: TextField(
                              controller: usernameController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(

                                hintText: "John Doe",
                                hintStyle:  TextStyle(color: Color(0xff6E7781)),
                              ),
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
                          SizedBox(height: height* 0.01211460415,),
                          Text("Email:",style: TextStyle(color: Color(0xff000000),fontSize: 14.sp,fontWeight: FontWeight.w400),),
                          SizedBox(height: height* 0.01211460415,),
                          Container(
                            width: double.infinity,
                            height: height * 0.06057302077,
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: "John_Doe@gmail.com",
                                hintStyle:  TextStyle(color: Color(0xff6E7781)),
                              ),
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
                          SizedBox(height: height* 0.01211460415,),
                          Text("Age:",style: TextStyle(color: Color(0xff000000),fontSize:14.sp,fontWeight: FontWeight.w400),),
                          SizedBox(height: height* 0.01211460415,),
                          Container(
                            width: double.infinity,
                            height: height * 0.06057302077,
                            child: TextField(
                              controller: ageContoller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "21",
                                hintStyle:  TextStyle(color: Color(0xff6E7781)),
                              ),
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
                          SizedBox(height: height* 0.01211460415,),
                          Text("Address:",style: TextStyle(color: Color(0xff000000),fontSize: 14.sp,fontWeight: FontWeight.w400),),
                          SizedBox(height: height* 0.01211460415,),
                          Container(
                            width: double.infinity,
                            child: Text(
                              "Cricket lover | Software engineer by day,cricketer by evening | Passionate about the game | Team player | Striving for sixes and wickets | Balancing code and cricket | living for the sound of leather on willow | Chasing boundaries and career goals | Making every match count!",
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


                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width* 0.05092686901 ,vertical:   height* 0.01211460415,),
                      child: RoundButton(title: "SAVE CHANGES", onTap: (){

                      editProfile(nameController.text.toString(),emailController.text.toString(),ageContoller.text.toString(),usernameController.text.toString());
                     
                      }, color: Color(0xff3854DC)),
                    )


                  ],
                ),
              ),
            )
        ));
  }
}
