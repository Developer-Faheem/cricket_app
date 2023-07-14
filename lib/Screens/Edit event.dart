import 'package:cricket_app/Screens/Edit%20message.dart';
import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Mesage event.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({super.key});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  double height=0;
  double width=0;
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
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return SafeArea(child:Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3854DC),
        leading:  Padding(
          padding:  EdgeInsets.only(left: width* 0.05092686901 ),
          child: Image.asset("assets/arrow.png",width: width* 0.0254634345 ,),
        ),
        title:  Text("CricSpotter",style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w400,fontSize: 24.sp),),
        centerTitle: true,
        actions: [ Padding(
          padding:  EdgeInsets.only(right:  width* 0.05092686901 ),
          child: Image.asset("assets/noti.png",width: width* 0.07639030352 ,),
        )],
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.only(topLeft: Radius.circular((height* 0.03634381246/2)+(width*0.07639030352 /2)),topRight: Radius.circular((height* 0.03634381246/2)+(width*0.07639030352 /2)),)
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: width* 0.05092686901,vertical: height* 0.03634381246),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Create an event",style: TextStyle(color: Color(0xff000000),fontSize: 18.sp,fontWeight: FontWeight.w400),),
                    SizedBox(height: height*0.01817190623 ,),
                    Text("Match Type",style: TextStyle(color: Color(0xff000000),fontSize: 16.sp,fontWeight: FontWeight.w400),),
                    SizedBox(height: height*0.01817190623 ,),
                    Container(
                      height: height* 0.06057302077,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              selectedOption!,
                              style: TextStyle(fontSize: 12.sp),
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
                      padding: EdgeInsets.all(height* 0.01211460415/2 + width*0.0254634345 /2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular((height*0.00605730207/2)+(width* 0.01273171725/2)),
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
                    SizedBox(height: height*0.01817190623 ,),
                    Text("Loctaion",style: TextStyle(color: Color(0xff000000),fontSize: 16.sp,fontWeight: FontWeight.w400),),
                    SizedBox(height: height*0.01817190623 ,),
                    Container(
                      height: height* 0.06057302077,
                      child: TextField(

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: width*0.0050926869,bottom: height*0.01211460415 ),
                            hintText: "Location"

                        ),

                      ),
                      padding: EdgeInsets.all((height*0.01211460415 /2)+(width*0.0254634345 )),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular((height*0.00605730207/2)+(width* 0.01273171725/2)),
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
                    SizedBox(height: height*0.01817190623 ,),
                    Text("Date",style: TextStyle(color: Color(0xff000000),fontSize: 16.sp,fontWeight: FontWeight.w400),),
                    SizedBox(height: height* 0.01211460415 ,),
                    Row(
                      children: [
                        Container(

                          padding: EdgeInsets.all((height*0.01211460415 /2)+(width*0.0254634345 )),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular((height*0.00605730207/2)+(width* 0.01273171725/2)),
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
                            style: TextStyle(fontSize: 12.sp,color: Color(0xff989696)),
                          ),

                        ),
                        IconButton(
                          icon: Image.asset("assets/calendar.png",width: width*0.10185373803,),
                          onPressed: () {
                            _pickDate(context);
                          },
                        ),
                      ],



                    ),
                    SizedBox(height: height* 0.01817190623,),
                    Text("Start-Time",style: TextStyle(color: Color(0xff000000),fontSize: 16.sp,fontWeight: FontWeight.w400),),
                    SizedBox(height: height* 0.01211460415 ,),
                    Container(
                      height: height* 0.06057302077,
                      child: Text("XX : XX",style: TextStyle(fontSize: 12.sp,color: Color(0xff989696)),),
                      padding: EdgeInsets.all((height*0.01211460415 /2)+(width*0.0254634345 )),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular((height*0.00605730207/2)+(width* 0.01273171725/2)),
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
              padding:  EdgeInsets.only(top: height*0.03634381246 ),
              child: Container(
                child: Divider(
                  color: Color(0xffD9D9D9),
                  thickness: 1.0,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.05092686901,vertical: height* 0.01211460415 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(alignment: Alignment.topLeft,
                      child: Text("TEAM - 01",style: TextStyle(color: Color(0xff000000)),)),
                  SizedBox(height: height* 0.01211460415,),
                  Align(alignment: Alignment.topLeft,
                      child: Text("Enter team name",style: TextStyle(color: Color(0xff000000)),)),
                  SizedBox(height: height* 0.01211460415,),
                  Container(
                    height: height* 0.06057302077,
                    child: TextField(

                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: width*0.0050926869,bottom:  height* 0.01211460415,),
                          hintText: "XYZ",
                          hintStyle: TextStyle(color: Color(0xff989696),fontSize: 12.sp,fontWeight: FontWeight.w400)

                      ),

                    ),
                    padding: EdgeInsets.only(left: width* 0.0050926869,bottom: height* 0.01211460415 ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular((height*0.00605730207/2)+(width* 0.01273171725/2)),
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
                  SizedBox(height: height*0.02422920831 ,),
                  Text("Insert team image",style: TextStyle(color: Color(0xff000000)),),
                  SizedBox(height: height*0.01211460415,),
                  Container(
                    height: height*0.09691683324,
                    width: width*0.20370747606,
                    child: Center(child: Text("+",style: TextStyle(fontSize: 30.sp,color: Color(0xff989696)),)),
                    padding: EdgeInsets.all((height*0.01211460415 /2)+(width*0.0254634345 )),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular((height*0.00605730207/2)+(width* 0.01273171725/2)),
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
              padding:  EdgeInsets.only(top: height*0.03634381246 ),
              child: Container(
                child: Divider(
                  color: Color(0xffD9D9D9),
                  thickness: 1.0,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.05092686901,vertical: height* 0.01211460415 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(alignment: Alignment.topLeft,
                      child: Text("TEAM - 02",style: TextStyle(color: Color(0xff000000)),)),
                  SizedBox(height: height* 0.01211460415,),
                  Align(alignment: Alignment.topLeft,
                      child: Text("Enter team name",style: TextStyle(color: Color(0xff000000)),)),
                  SizedBox(height: height* 0.01211460415,),
                  Container(
                    height: height* 0.06057302077,
                    child: TextField(

                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: width*0.0050926869,bottom:  height* 0.01211460415,),
                          hintText: "ABC",
                          hintStyle: TextStyle(color: Color(0xff989696),fontSize: 12.sp,fontWeight: FontWeight.w400)

                      ),

                    ),
                    padding: EdgeInsets.only(left: width* 0.0050926869,bottom: height* 0.01211460415 ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular((height*0.00605730207/2)+(width* 0.01273171725/2)),
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
                  SizedBox(height: height* 0.02422920831 ,),
                  Text("Insert team image",style: TextStyle(color: Color(0xff000000)),),
                  SizedBox(height: height*0.01211460415,),
                  Container(
                    height: height*0.09691683324,                    width: width*0.20370747606,
                    child: Center(child: Text("+",style: TextStyle(fontSize: 30.sp,color: Color(0xff989696)),)),
                    padding: EdgeInsets.only(left: width* 0.0050926869,bottom: height* 0.01211460415 ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular((height*0.00605730207/2)+(width* 0.01273171725/2)),
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
              padding:  EdgeInsets.symmetric(horizontal: width* 0.05092686901 ),
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





















