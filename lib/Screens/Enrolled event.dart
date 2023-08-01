import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Editjoinpage.dart';
import 'Leave confirm.dart';

class Enrolledevent extends StatefulWidget {


   final String  match;
   final  String  location;
   final  String  date;
   final  String  startTime;
   final  String  seletedTeamName;
   final  String  name;
   final  String  age;
   final  String  phoneNumber;
   final  String selectedTeamImage;
   final  String documentUniqueId;
   final  String unselectedTeamName;
   final  String unseletedTeamImageUrl;
   


   Enrolledevent({
    required this.unseletedTeamImageUrl,
    required this.unselectedTeamName,
    required this.selectedTeamImage,
    required this.match,
    required this.location,
    required this.date,
    required this.startTime,
    required this.seletedTeamName,
    required this.name,
    required this.age,
    required this.phoneNumber,
     required this.documentUniqueId
  });

  @override
  State<Enrolledevent> createState() => _EnrolledeventState();
}

class _EnrolledeventState extends State<Enrolledevent> {
  double height = 0;
  double width = 0;
  int _age = 12; // Initial age value

 

  
  void deleteDocument() async {
  try {

    print(widget.unseletedTeamImageUrl.toString());
    print('11111111111111111111111111111111');
    // Get a reference to the document
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('enrollmentData')
        .doc(widget.documentUniqueId.toString());

    // Delete the document
    await documentReference.delete().then((value){
     
       Navigator.push(
          context,
         MaterialPageRoute(
        builder: (context) =>
          Leaveconfirm())); 
    });

    print('Event leaved  successfully.');
  } catch (e) {
    print('Error leaving Evemnt : $e');
  }
}

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                      widget.match,
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
                          "Start-time: ${widget.startTime.toString()}",
                          style: TextStyle(
                              color: Color(0xff242425),
                              fontSize: 10.sp,
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
                    Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Editjoinpage(
                                              unseletedTeamImageUrl:widget.unseletedTeamImageUrl,
                                              unselectedTeamName:widget.unselectedTeamName,
                                              match: widget.match, 
                                              location: widget.location,
                                              date: widget.date,
                                              startTime: widget.startTime,
                                              seletedTeamName: widget.seletedTeamName, 
                                            //  team2: team2,
                                              selectedTeamImage:widget.selectedTeamImage,
                                              name:widget.name,
                                              age:widget.age,
                                              phoneNumber:widget.phoneNumber,
                                              // image2: image2,
                                              documentUniqueId: widget.documentUniqueId

                                      )));
                            },
                            child: Image.asset(
                              "assets/edit.png",
                              width: 8.w,
                            ))),
                    SizedBox(
                      height: 1.h,
                    ),
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
                        Column(
                          children: [
                            Container(
                                                        width: width *
                                                            0.07639030352,
                                                        height: width *
                                                            0.07639030352,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(width *
                                                                  0.03819515176),
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                           widget.selectedTeamImage.toString()
                                                               ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                             Text(widget.seletedTeamName.toString()),
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
                        Text(
                          "Enter Your name:",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp),
                        ),
                        Container(
                          width: width*0.45834182114,
                          height: height*0.04845841662,

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
                          child: Padding(
                            padding:  EdgeInsets.only(left: width*0.0254634345 , top:height*0.00605730207 ),
                            child: Text(
                              widget.name.toString(),
                              style: TextStyle(
                                  color: Color(0xff989696),
                                  fontSize: 13.sp,
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
                                  child: Center(child: Text(widget.age.toString())),
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
                          child: Padding(
                            padding:  EdgeInsets.only(left: width*0.01273171725, top: height* 0.01211460415 ),
                            child: Text(
                              widget.date.toString(),
                              style: TextStyle(
                                  color: Color(0xff989696),
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height*0.02422920831 ,
                    ),
                    RoundButton(
                      title: "LEAVE EVENT",
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Color(0xff3854DC),
                            title: Center(
                                child:
                                    Image.asset("assets/boy.png", width:width*0.25463434508)),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Are you sure you want to leave",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xffFFFFFFDB),
                                    )),
                                Text("the event?",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xffFFFFFFDB),
                                    )),
                              ],
                            ),
                            actions: [
                              Container(
                                width: width*0.30556121409,
                                height: height*0.04845841662,
                                color: Color(0xffFFFFFFDB),
                                child: TextButton(
                                  onPressed: () {
                                    // Perform the log out action here
                                    // For example, you can call a log out function or navigate to the log out screen
                                    // ...
                                    // Close the alert dialog
                                    deleteDocument();
                                  },
                                  child: Text(
                                    "Yes,I am sure.",
                                    style: TextStyle(
                                        color: Color(0xff0C0C0C),
                                        fontSize: 7.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Container(
                                width: width*0.30556121409,
                                height: height*0.04845841662,
                                color: Color(0xffFFFFFFDB),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(
                                        context); // Close the alert dialog
                                  },
                                  child: Text(
                                    "No, I am not sure",
                                    style: TextStyle(
                                        color: Color(0xff0C0C0C),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 7.sp),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      color: Color(0xff3854DC),
                    )
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
