//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_app/firebaseServices/matchData.dart';
import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// import 'Confirmation page.dart';
// import 'Informationadded.dart';

class Joinpage extends StatefulWidget {

  String match;
  String date;
  String startTime;
  String location;
  String enrolledPersonId;
  String uid ;
  String image1;
  String image2;
  String team1;
  String team2;

  Joinpage({
    required this.match,
    required this.startTime,
    required this.location,
    required this.date,
    required this.enrolledPersonId,
    required this.uid,
    required this.image1,
    required this.image2,
    required this.team1,
    required this.team2
  });

  @override
  State<Joinpage> createState() => _JoinpageState();
}

class _JoinpageState extends State<Joinpage> {
  double height=0;
  double width=0;
  int _age = 12; // Initial age value
  String?  imageUrl;
  String?  seletedTeam;
  String? unseletedTeamImageUrl;
  String? unselectedTeamName;

  final  nameController=TextEditingController();
  final  phoneController=TextEditingController();
  

//   // Function to add the "participants" subcollection to a specific document
// Future<void> addParticipantsSubcollection() async {
//   try {
    
//       FirebaseAuth _auth = FirebaseAuth.instance;
//     User? user = _auth.currentUser;

//     if (user == null) {
//       print('User not signed in.');
//       return;
//     }
//   //   String uniqueDocumentID = Uuid().v4();
//     String userId = user.uid;


//     // Get the reference to the specific document in the "match" collection
//     final DocumentReference matchDocumentRef =
//         FirebaseFirestore.instance.collection('match').doc(widget.uid.toString());

//     //  Create the "participants" subcollection
//     final CollectionReference participantsCollectionRef =
//         matchDocumentRef.collection('participants');

//     // Add documents to the "participants" subcollection
//     await participantsCollectionRef.add({
//       'uid':FieldValue.serverTimestamp().toString(),
//       'name': nameController.text.toString(),
//       'age': _age.toString(),
//       'phoneNumber':phoneController.text.toString(),
//       'participantId':userId.toString()

//     }).then((value){
     
//      Navigator.push(context, MaterialPageRoute(builder: (context)=> Confirmationpage()));

//     });

//     // You can add more documents or use a loop to add multiple participants.

//     print('Participants subcollection added successfully.');
//   } catch (e) {
//     print('Error adding participants subcollection: $e');
//   }
// }

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
        title:  Text("CricSpotter",style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w400,fontSize: 24.sp),),
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
                "assets/Status5.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width*0.0254634345 /2 + height*0.01211460415 /2),
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
                     Text(
                    //   "Test Match",
                      widget.match.toString(),
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Text(
                          "14 / 24 members",
                          style: TextStyle(
                              color: Color(0xff242425),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400),
                        ),
                         SizedBox(
                          width: width*0.07639030352 ,
                        ),
                        Text(
                         //  "Date: XX-XX-XXXX",
                          "Date: ${widget.date.toString()}",
                          style: TextStyle(
                              color: Color(0xff242425),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Row(
                      children: [
                         Text(
                         //   "Start-time: 11: 00am",
                          "Start-time: ${widget.startTime.toString()}",
                          style: TextStyle(
                              color: Color(0xff242425),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400),
                        ),
                         SizedBox(
                          width: width* 0.0995561214,
                        ),
                         Image.asset(
                          "assets/loc.png",
                          width: width*0.03819515176,
                        ),
                         SizedBox(
                          width: width*0.0090926869,
                        ),
                        Text(
                          "Location: ${widget.location.toString()}",
                          style: TextStyle(
                              color: Color(0xff242425),
                              fontSize: 8.sp,
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
                         Text(
                          "Choose Your team:",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp),
                        ),
                        InkWell(
                          onTap: (){
                             imageUrl=widget.image1.toString();
                             seletedTeam=widget.team1.toString();
                            unseletedTeamImageUrl=widget.image2.toString();
                             unselectedTeamName=widget.team2.toString();
                          },
                          child: Column(
                            children: [
                               Container(
                                             width: width*0.12731717254,
                                                height: width * 0.12639030352,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(100),
                                                  image: DecorationImage(
                                                    image: NetworkImage(widget.image1.toString()),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                              // Image.asset(
                              //   "assets/Elli G.png",
                              //   width: width*0.12731717254,
                              // ),
                               Text(widget.team1.toString()),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            imageUrl=widget.image2.toString();
                             seletedTeam=widget.team2.toString();
                                unseletedTeamImageUrl=widget.image1.toString();
                             unselectedTeamName=widget.team1.toString();
                          },
                          child: Column(
                            children: [
                              Container(
                                             width: width*0.12731717254,
                                                height: width * 0.12639030352,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(100),
                                                  image: DecorationImage(
                                                    image: NetworkImage(widget.image2.toString()),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                               Text(widget.team2.toString()),
                            ],
                          ),
                        )
                      ],
                    ),
                     SizedBox(
                      height: height*0.02422920831 ,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "Enter Your name:",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp),
                        ),
                        Container(
                          width: width*0.45834182114,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width*0.01273171725/2 + height*0.00605730207),
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
                            controller: nameController,
                            decoration: InputDecoration(
                              contentPadding:  EdgeInsets.only(left: width*0.0254634345 ),
                              hintText: "Your Name",
                              hintStyle: TextStyle(
                                  color: Color(0xff989696),
                                  fontSize: 15.sp,
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
                         Text(
                          "Enter Your age:",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: width* 0.05092686901 ),
                          child: Container(
                            width: width*0.23553676919,
                            height: height*0.04966987703,


                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width*0.01273171725/2 + height*0.00605730207),
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
                         Text(
                          "Enter Phone-no:",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp),
                        ),
                        Container(
                          width: width*0.45834182114,
                          height: height*0.06057302077,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width*0.01273171725/2 + height*0.00605730207),
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
                            controller: phoneController,
                            decoration: InputDecoration(
                              contentPadding:  EdgeInsets.only(left: width* 0.0254634345 ),
                              hintText: "Your Phone Number",
                              hintStyle: TextStyle(
                                  color: Color(0xff989696),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(height: height*  0.01211460415  ,),
                    RoundButton(title: "confirm", onTap: (){

                      MatchData().createdMatch(
                        context,
                        id: FirebaseAuth.instance.currentUser!.uid,
                        matchType: widget.match,
                        members: '14 / 24 members ',
                        startTime:widget.startTime,
                        date: widget.date,
                        location: widget.location,
                        age: _age.toString(),
                        phoneNumber: phoneController.text.toString(),
                        teamName:seletedTeam.toString(),
                        temamImageUrl:imageUrl.toString(),
                        name: nameController.text.toString(),
                        unselectedTeamName: unselectedTeamName.toString(),
                        unseletedTeamImageUrl:unseletedTeamImageUrl.toString()
                      );
                      // addParticipantsSubcollection();

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
