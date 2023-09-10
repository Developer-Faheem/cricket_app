import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_app/notification/notification_service.dart';
import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Informationadded.dart';

class Editjoinpage extends StatefulWidget {
  final String match;
  final String location;
  final String date;
  final String startTime;
  final String seletedTeamName;
  final String name;
  final String age;
  final String phoneNumber;
  final String selectedTeamImage;
  final String documentUniqueId;
  final String unselectedTeamName;
  final String unseletedTeamImageUrl;

  Editjoinpage(
      {required this.unseletedTeamImageUrl,
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
      required this.documentUniqueId});

  @override
  State<Editjoinpage> createState() => _EditjoinpageState();
}

class _EditjoinpageState extends State<Editjoinpage> {
  late int _age;
  double height = 0;
  double width = 0;
  // int _age = 12; // Initial age value
  String? UpdatedImageUrl;
  String? UpdatedSeletedTeam;
  String? UpdatedUnseletedTeamImageUrl;
  String? UpdatedUnselectedTeamName;
  final updatedName = TextEditingController();
  final updatedPhoneNumber = TextEditingController();

  void editEnrollment() async {
    try {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection("enrollmentData");

      // Update the fields you want to edit in the user document
      Map<String, dynamic> updatedData = {
        'name': updatedName.text == ""
            ? widget.name.toString()
            : updatedName.text.toString(),
        'phoneNumber': updatedPhoneNumber.text == ""
            ? widget.phoneNumber.toString()
            : updatedPhoneNumber.text.toString(),
        'teamName': UpdatedSeletedTeam == null
            ? widget.seletedTeamName.toString()
            : UpdatedSeletedTeam,
        'teamImageUrl': UpdatedImageUrl == null
            ? widget.selectedTeamImage
            : UpdatedImageUrl,
        'unselectedTeamName': UpdatedUnselectedTeamName == null
            ? widget.unselectedTeamName.toString()
            : UpdatedUnselectedTeamName,
        'unselectedTeamImageUrl': UpdatedUnseletedTeamImageUrl == null
            ? widget.unseletedTeamImageUrl.toString()
            : UpdatedUnseletedTeamImageUrl,
        "age": _age.toString()
      };

      // Perform the update operation
      await usersCollection
          .doc(widget.documentUniqueId.toString())
          .update(updatedData)
          .then((value) => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditedConfirmation())),
                NotificationService().showNotification(
                    title: 'Event edited successfully',
                    body: 'Succesfully edited')
              });

      print('enrollment data updated successfully.');
    } catch (e) {
      print('Error updating enrollment data: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String ageToParse = widget.age.toString();
    _age = int.parse(ageToParse);
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
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/arrow.png",
              // width: width * 0.0254634345,
            ),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: height * 0.28012773824,
              child: Image.asset(
                "assets/Status5.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    width * 0.0254634345 / 2 + height * 0.01211460415 / 2),
                color: Colors.white,
                boxShadow: [
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
                padding: EdgeInsets.only(
                    left: width * 0.05092686901,
                    top: height * 0.01211460415,
                    bottom: height * 0.01211460415),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
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
                          width: width * 0.07639030352,
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
                    SizedBox(
                      height: 5,
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
                          width: width * 0.0895561214,
                        ),
                        Image.asset(
                          "assets/loc.png",
                          width: width * 0.03819515176,
                        ),
                        SizedBox(
                          width: width * 0.020926869,
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
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.04845841662,
                    horizontal: width * 0.05092686901),
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
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                UpdatedImageUrl =
                                    widget.selectedTeamImage.toString();
                                UpdatedSeletedTeam =
                                    widget.seletedTeamName.toString();
                                UpdatedUnseletedTeamImageUrl =
                                    widget.unseletedTeamImageUrl.toString();
                                UpdatedUnselectedTeamName =
                                    widget.unselectedTeamName.toString();
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: width * 0.12731717254,
                                    height: width * 0.12639030352,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                        image: NetworkImage(widget
                                            .selectedTeamImage
                                            .toString()),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(widget.seletedTeamName.toString()),
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                UpdatedImageUrl =
                                    widget.unseletedTeamImageUrl.toString();
                                UpdatedSeletedTeam =
                                    widget.unselectedTeamName.toString();
                                UpdatedUnseletedTeamImageUrl =
                                    widget.selectedTeamImage.toString();
                                UpdatedUnselectedTeamName =
                                    widget.seletedTeamName.toString();
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: width * 0.12731717254,
                                    height: width * 0.12639030352,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                        image: NetworkImage(widget
                                            .unseletedTeamImageUrl
                                            .toString()),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(widget.unselectedTeamName.toString()),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02422920831,
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
                          width: width * 0.45834182114,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                width * 0.01273171725 / 2 +
                                    height * 0.00605730207),
                            color: Colors.white,
                            boxShadow: [
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
                            controller: updatedName,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: width * 0.0254634345),
                              hintText: widget.name.toString(),
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
                      height: height * 0.02422920831,
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
                          padding: EdgeInsets.only(left: width * 0.09192686901),
                          child: Container(
                            width: width * 0.23553676919,
                            height: height * 0.04966987703,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  width * 0.01273171725 / 2 +
                                      height * 0.00605730207),
                              color: Colors.white,
                              boxShadow: [
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
                                  width: width * 0.07639030352,
                                  child: Center(child: Text("$_age")),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.05092686901,
                                      top: height * 0.00484425713),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (_age >= 0) {
                                                  _age++;
                                                }
                                              });
                                            },
                                            child: Image.asset(
                                              "assets/Vector 5.png",
                                              width: width * 0.05092686901,
                                            )),
                                        SizedBox(
                                          height: height * 0.00605730207,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (_age >= 2) _age--;
                                              });
                                            },
                                            child: Image.asset(
                                              "assets/Vector 6.png",
                                              width: width * 0.05092686901,
                                            )),
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
                      height: height * 0.02422920831,
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
                          width: width * 0.45834182114,
                          height: height * 0.06057302077,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                width * 0.01273171725 / 2 +
                                    height * 0.00605730207),
                            color: Colors.white,
                            boxShadow: [
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
                            controller: updatedPhoneNumber,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: width * 0.0254634345),
                              hintText: widget.phoneNumber.toString(),
                              hintStyle: TextStyle(
                                  color: Color(0xff989696),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01211460415,
                    ),
                    RoundButton(
                      title: "SAVE",
                      onTap: () {
                        if (updatedName.text != "" ||
                            updatedPhoneNumber.text != "" ||
                            UpdatedImageUrl != null ||
                            UpdatedSeletedTeam != null ||
                            UpdatedUnseletedTeamImageUrl != null ||
                            UpdatedUnselectedTeamName != null ||
                            _age.toString() != widget.age.toString()) {
                          editEnrollment();
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Error',
                                      style:
                                          TextStyle(color: Color(0xff3854DC))),
                                  content: Text(
                                      'Failed to Update joining info. No changes to update.'),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: Text('OK',
                                          style: TextStyle(
                                              color: Color(0xff3854DC))),
                                    ),
                                  ],
                                );
                              });
                        }
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
