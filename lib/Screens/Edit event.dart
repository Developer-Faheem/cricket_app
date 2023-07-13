import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:flutter/material.dart';

import 'Edit message.dart';
import 'Mesage event.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({super.key});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  String? selectedOption;
  DateTime? selectedDate;
  List<String> matchOptions = ['Select Match Type', 'Test Match', 'T20 Match', 'Championship'];
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }


  @override
  void initState() {
    super.initState();
    selectedOption = matchOptions[0]; // Set initial value
  }

  void _showOptions(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Match Type'),
          content: DropdownButton<String>(
            value: selectedOption,
            items: matchOptions.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue;
              });
              Navigator.of(context).pop(newValue);
            },
          ),
        );
      },
    );

    if (result != null) {
      setState(() {
        selectedOption = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3854DC),
        leading:  Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset("assets/arrow.png",width: 10,),
        ),
        title: const Text("CricSpotter",style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w400,fontSize: 24),),
        centerTitle: true,
        actions: [ Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Image.asset("assets/noti.png",width: 30,),
        )],
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Event created",style: TextStyle(color: Color(0xff000000),fontSize: 24,fontWeight: FontWeight.w400),),
                    SizedBox(height: 15,),
                    Text("Match Type",style: TextStyle(color: Color(0xff000000),fontSize: 16,fontWeight: FontWeight.w400),),
                    SizedBox(height: 15,),
                    Container(
                      height: 50.0,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              selectedOption!,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          IconButton(
                            icon: Image.asset("assets/Vector 6.png"),
                            onPressed: () {
                              _showOptions(context);
                            },
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
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
                    SizedBox(height: 15,),
                    Text("Loctaion",style: TextStyle(color: Color(0xff000000),fontSize: 16,fontWeight: FontWeight.w400),),
                    SizedBox(height: 15,),
                    Container(
                      height: 50.0,
                      child: TextField(

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 2,bottom: 10),
                            hintText: "Location"

                        ),

                      ),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
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
                    SizedBox(height: 15,),
                    Text("Date",style: TextStyle(color: Color(0xff000000),fontSize: 16,fontWeight: FontWeight.w400),),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(

                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
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
                          child:  Text(
                            selectedDate != null ? selectedDate.toString() : 'DD / MM / YYYY',
                            style: TextStyle(fontSize: 16,color: Color(0xff989696)),
                          ),

                        ),
                        IconButton(
                          icon: Image.asset("assets/calendar.png",width: 40,),
                          onPressed: () {
                            _pickDate(context);
                          },
                        ),
                      ],



                    ),
                    SizedBox(height: 15,),
                    Text("Start-Time",style: TextStyle(color: Color(0xff000000),fontSize: 16,fontWeight: FontWeight.w400),),
                    SizedBox(height: 10,),
                    Container(
                      height: 50.0,
                      child: Text("XX : XX",style: TextStyle(fontSize: 16,color: Color(0xff989696)),),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
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


                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                child: Divider(
                  color: Color(0xffD9D9D9),
                  thickness: 1.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(alignment: Alignment.topLeft,
                      child: Text("TEAM - 01",style: TextStyle(color: Color(0xff000000)),)),
                  SizedBox(height: 10,),
                  Align(alignment: Alignment.topLeft,
                      child: Text("Enter team name",style: TextStyle(color: Color(0xff000000)),)),
                  SizedBox(height: 10,),
                  Container(
                    height: 50.0,
                    child: TextField(

                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 2,bottom: 10),
                          hintText: "XYZ",
                          hintStyle: TextStyle(color: Color(0xff989696),fontSize: 16,fontWeight: FontWeight.w400)

                      ),

                    ),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
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
                  SizedBox(height: 20,),
                  Text("Insert team image",style: TextStyle(color: Color(0xff000000)),),
                  SizedBox(height: 10,),
                  Container(
                    height: 80.0,
                    width: 80,
                    child: Center(child: Text("+",style: TextStyle(fontSize: 40,color: Color(0xff989696)),)),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                child: Divider(
                  color: Color(0xffD9D9D9),
                  thickness: 1.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(alignment: Alignment.topLeft,
                      child: Text("TEAM - 02",style: TextStyle(color: Color(0xff000000)),)),
                  SizedBox(height: 10,),
                  Align(alignment: Alignment.topLeft,
                      child: Text("Enter team name",style: TextStyle(color: Color(0xff000000)),)),
                  SizedBox(height: 10,),
                  Container(
                    height: 50.0,
                    child: TextField(

                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 2,bottom: 10),
                          hintText: "ABC",
                          hintStyle: TextStyle(color: Color(0xff989696),fontSize: 16,fontWeight: FontWeight.w400)

                      ),

                    ),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
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
                  SizedBox(height: 20,),
                  Text("Insert team image",style: TextStyle(color: Color(0xff000000)),),
                  SizedBox(height: 10,),
                  Container(
                    height: 80.0,
                    width: 80,
                    child: Center(child: Text("+",style: TextStyle(fontSize: 40,color: Color(0xff989696)),)),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
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
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RoundButton(title: 'SAVE EVENT',onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Editmesaage()));

              }, color: Color(0xff3854DC),),
            )
          ],
        ),
      ),
    ));
  }
}





















