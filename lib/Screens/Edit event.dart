import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_app/Screens/Edit%20message.dart';
import 'package:cricket_app/notification/notification_service.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class EditEvent extends StatefulWidget {
  String match;
  String location;
  String date;
  String startTime;
  String team1;
  String team2;
  String image1;
  String image2;
  String uid;

  EditEvent(
      {required this.date,
      required this.image1,
      required this.image2,
      required this.location,
      required this.match,
      required this.startTime,
      required this.team1,
      required this.team2
      ,required this.uid});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
   bool isLoading=false;
  double height=0;
  double width=0;
  String? selectedOption;
  DateTime? selectedDate;
   final timeController = TextEditingController();
  final team1Controller = TextEditingController();
  final team2Controller = TextEditingController();
  final locationController = TextEditingController();
  List<String> matchOptions = ['Select Match Type', 'Test Match', 'T20 Match', 'Championship'];


   File? _imageFile;
      File? _imageFile1;
       final firestore = FirebaseFirestore.instance.collection('match');
  firebase_storage.FirebaseStorage storage= firebase_storage.FirebaseStorage.instance ;
  

  Future<void> _pickImage(bool team) async {
    final pickedFile = await  ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if(team==true){
             _imageFile = File(pickedFile.path);
        }else{
            _imageFile1 = File(pickedFile.path);
        }     
      });
    }
  }


  //   uploading the image to firebase storage 
    Future<void> _uploadData1() async {
        setState(() {
                   
                   isLoading=true;
                 });

     String? team1ImageUrl ;
     String? team2ImageUrl;

     try {

          if(_imageFile1!=null){

        firebase_storage.Reference ref1 = firebase_storage.FirebaseStorage.instance.refFromURL(widget.image1);
        firebase_storage.UploadTask uploadTask1 = ref1.putFile(_imageFile1!);
        firebase_storage.TaskSnapshot snapshot1 = await uploadTask1;
         team1ImageUrl = await ref1.getDownloadURL();
          }
          if(_imageFile!=null){
    // Upload the second image
     //   String uniqueImageName1 = Uuid().v4();
        firebase_storage.Reference ref2 = firebase_storage.FirebaseStorage.instance.refFromURL(widget.image2);
        firebase_storage.UploadTask uploadTask2 = ref2.putFile(_imageFile!);
         firebase_storage.TaskSnapshot snapshot2 = await uploadTask2;
         team2ImageUrl = await ref2.getDownloadURL();
          }
    // String userId = user.uid;
         CollectionReference usersCollection = FirebaseFirestore.instance.collection("match");

    // Update the fields you want to edit in the user document
    Map<String, dynamic> updatedData = {
          
          'data':selectedDate==null||selectedDate.toString()=="null"?widget.date.toString():selectedDate.toString(),
          'location':locationController.text==""?widget.location.toString():locationController.text.toLowerCase(),
          'title':selectedOption==matchOptions[0]?widget.match.toString(): selectedOption.toString(),
          'startTime': timeController.text.trim().toString()==""?widget.startTime.toString():timeController.text.trim().toString(),
          'team1': team1Controller.text.trim().toString()==""?widget.team1.toString(): team1Controller.text.trim().toString(),
          'team2': team2Controller.text.trim().toString()==""?widget.team2.toString(): team2Controller.text.trim().toString(),
          'team1ImageUrl': team1ImageUrl==null? widget.image1.toString(): team1ImageUrl.toString(),
          'team2ImageUrl': team2ImageUrl==null? widget.image2.toString(): team2ImageUrl.toString(),
       
    };

          // Perform the update operation
          await usersCollection.doc(widget.uid.toString()).update(updatedData).then((value) => {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Editmesaage()))
          });
           
      
                    NotificationService().showNotification(
          title: 'Event edited successfully', body: 'Succesfully edited');
         
          
                setState(() {
                  isLoading=false;
                });
      } catch (e) {
        print("Error: $e");
        
                setState(() {
                  isLoading=false;
                });
      }

  }


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
    selectedOption = matchOptions[0];  // Set initial value
  }

  void _showOptions(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Match Type"),
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
          child: GestureDetector(onTap: (){
            Navigator.pop(context);
          }, child: Image.asset("assets/arrow.png",width: width* 0.0254634345 ,)),
        ),
        title:  Text("CricSpotter",style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w400,fontSize: 24.sp),),
        centerTitle: true,
        // actions: [ Padding(
        //   padding:  EdgeInsets.only(right:  width* 0.05092686901 ),
        //   child: Image.asset("assets/noti.png",width: width* 0.07639030352 ,),
        // )],
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
                    Text("Edit event details",style: TextStyle(color: Color(0xff000000),fontSize: 18.sp,fontWeight: FontWeight.w400),),
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
                    Text("location",style: TextStyle(color: Color(0xff000000),fontSize: 16.sp,fontWeight: FontWeight.w400),),
                    SizedBox(height: height*0.01817190623 ,),
                    Container(
                height: height * 0.06057302077,
              
                child: TextField(
                 
                  controller: locationController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: width * 0.023926869,
                        bottom: height * 0.01211460415,
                      ),
                      hintText: widget.location.toString(),
                      hintStyle: TextStyle(
                          color: Color(0xff989696),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400)),
                ),
                padding: EdgeInsets.only(
                    left: width * 0.0050926869,
                    bottom: height * 0.01211460415),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(
                      (height * 0.00605730207 / 2) +
                          (width * 0.01273171725 / 2)),
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
                            selectedDate != null ? selectedDate.toString() : widget.date.toString(),
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
                height: height * 0.06057302077,
                width: width*0.390000,
                child: TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: width * 0.023926869,
                        bottom: height * 0.01211460415,
                      ),
                      hintText: widget.startTime.toString(),
                      hintStyle: TextStyle(
                          color: Color(0xff989696),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400)),
                ),
                padding: EdgeInsets.only(
                    left: width * 0.0050926869,
                    bottom: height * 0.01211460415),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(
                      (height * 0.00605730207 / 2) +
                          (width * 0.01273171725 / 2)),
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
              padding:  EdgeInsets.only(top: height*0.008034381246 ),
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
                      child: Text("TEAM - 01",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                      )),
                  SizedBox(height: height* 0.01211460415,),
                  Align(alignment: Alignment.topLeft,
                      child: Text("Enter team name",style: TextStyle(color: Color(0xff000000)),)),
                  SizedBox(height: height* 0.01211460415,),
                  Container(
                    height: height* 0.06057302077,
                    child: TextField(
                      controller: team1Controller,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: width*0.0050926869,bottom:  height* 0.01211460415,),
                          hintText: widget.team1.toString(),
                          hintStyle: TextStyle(color: Color(0xff989696),fontSize: 12.sp,fontWeight: FontWeight.w400)

                      ),

                    ),
                    padding: EdgeInsets.only(  left: width * 0.023926869,bottom: height* 0.01211460415 ),
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
                   _imageFile1==null? InkWell(
                  onTap: () => _pickImage(false),
                   child:  Container(
                      width: width * 0.20370747606,
                      height: height * 0.09691683324,
                      child: Container(
                                            decoration: BoxDecoration(                                     
                                              image: DecorationImage(
                                                image: NetworkImage(widget.image1.toString()),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                      ),
                 ): Container( height: height * 0.09691683324,
                      width: width * 0.20370747606,child:Image.file( _imageFile1!) ,) ,
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top:  height*0.008034381246 ),
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
                      child: Text("TEAM - 02",
                       style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                      )),
                  SizedBox(height: height* 0.01211460415,),
                  Align(alignment: Alignment.topLeft,
                      child: Text("Enter team name",style: TextStyle(color: Color(0xff000000)),)),
                  SizedBox(height: height* 0.01211460415,),
                  Container(
                    height: height* 0.06057302077,
                    child: TextField(
                      controller: team2Controller,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: width*0.0050926869,bottom:  height* 0.01211460415,),
                          hintText:  widget.team2.toString(),
                          hintStyle: TextStyle(color: Color(0xff989696),fontSize: 12.sp,fontWeight: FontWeight.w400)

                      ),

                    ),
                    padding: EdgeInsets.only(  left: width * 0.023926869,bottom: height* 0.01211460415 ),
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
                _imageFile==null? InkWell(
                  onTap: () => _pickImage(true),
                   child: Container(
                      width: width * 0.20370747606,
                      height: height * 0.09691683324,
                      child: Container(
                                            decoration: BoxDecoration(                                     
                                              image: DecorationImage(
                                                image: NetworkImage(widget.image2.toString()),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                      ),
                 ): Container( height: height * 0.09691683324,
                      width: width * 0.20370747606,child:Image.file( _imageFile!) ,)
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width* 0.05092686901,vertical: height*0.02 ),
              child: ElevatedButton(
                child: isLoading ? CircularProgressIndicator(color: Colors.white,) : Text('SAVE EVENT',style: TextStyle(color: Colors.white),),
               style: ElevatedButton.styleFrom(
                    minimumSize: Size(width*0.78, height*0.056),
                    backgroundColor: Color(0xff3854DC), // Change the background color here
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                      ),
              onPressed:  (){
                
              
                if(timeController.text!=""||locationController.text!=""||team1Controller.text!=""||team2Controller.text!=""||_imageFile!=null||_imageFile1!=null||selectedDate!=null||selectedOption!=matchOptions[0]){
                 
                                 _uploadData1();
                }else{
                 
                   showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                      
                       title: Text('Error', style: TextStyle(color: Color(0xff3854DC))),
                        content: Text('Failed to Update Event info. No changes to update.'),
                       contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text('OK', style: TextStyle(color: Color(0xff3854DC))),
                      ),
                    ],
                      );
                    });                   
                }
              
              }, 
              ),
            )
          ],
        ),
      ),
    ));
  }
}





















