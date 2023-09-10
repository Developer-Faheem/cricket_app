import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_app/Screens/Startup1.dart';
import 'package:cricket_app/notification/notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';
import 'Profile confirm.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileEdit extends StatefulWidget {
  String? name;
  String? profilePicture;
  String? userName;
  String? age;
  String? email;
  String? bio;

  ProfileEdit(
      {required this.bio,
      required this.email,
      required this.name,
      required this.userName,
      required this.age,
      required this.profilePicture});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  double height = 0;
  double width = 0;

  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final ageContoller = TextEditingController();
  final bioController = TextEditingController();

  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void editProfile(String name, String age, String username, String bio) async {
    setState(() {
      isLoading = true;
    });

    String? profileUrl;

    try {
      if (_imageFile != null) {
        String uniqueImageName = Uuid().v4();

        // Upload the first image
        if (widget.profilePicture == "" || widget.profilePicture == null) {
          firebase_storage.Reference ref1 = firebase_storage
              .FirebaseStorage.instance
              .ref('/profilePictures/$uniqueImageName');
          firebase_storage.UploadTask uploadTask1 = ref1.putFile(_imageFile!);
          firebase_storage.TaskSnapshot snapshot1 = await uploadTask1;
          profileUrl = await ref1.getDownloadURL();
          print('from "');
        } else {
          firebase_storage.Reference ref1 = firebase_storage
              .FirebaseStorage.instance
              .refFromURL(widget.profilePicture!);
          firebase_storage.UploadTask uploadTask1 = ref1.putFile(_imageFile!);
          firebase_storage.TaskSnapshot snapshot1 = await uploadTask1;
          profileUrl = await ref1.getDownloadURL();
          print('from elsse');
        }

        //     firebase_storage.Reference ref1 = firebase_storage.FirebaseStorage.instance.refFromURL('/profilePictures/$uniqueImageName');
      }

      FirebaseAuth _auth = FirebaseAuth.instance;
      User? user = _auth.currentUser;

      if (user == null) {
        print('User not signed in.');
        return;
      }

      String userId = user.uid;
      print(userId);

      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection("Users data");

      String userDocumentId = userId;

      print(name);
      print(username);
      print(age);

      // Update the fields you want to edit in the user document
      Map<String, dynamic> updatedData = {
        'bio': bio == "" ? widget.bio.toString() : bio,
        'name': name == "" ? widget.name.toString() : name,
        'username': username == "" ? widget.userName.toString() : username,
        "age": age == "" ? widget.age.toString() : age,
        "profilePicture":
            profileUrl == null ? widget.profilePicture.toString() : profileUrl,
      };

      // Perform the update operation
      await usersCollection
          .doc(userDocumentId)
          .update(updatedData)
          .then((value) => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileConfirm()))
              });

      NotificationService().showNotification(
          title: 'Profile edited successfully', body: 'Succesfully edited');

      print('Profile data updated successfully.');
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Error updating profile data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

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
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/arrow.png",
                    width: width * 0.0254634345,
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
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                      iconSize: 35,
                      color: Colors.white,
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Sign Out',
                                    style: TextStyle(color: Color(0xff3854DC))),
                                content: Text('Do you wanna signout?'),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      await _auth.signOut().then((value) =>
                                          (Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Startup1()))));
                                      // Close the dialog
                                    },
                                    child: Text('OK',
                                        style: TextStyle(
                                            color: Color(0xff3854DC))),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: Text('Cancel',
                                        style: TextStyle(
                                            color: Color(0xff3854DC))),
                                  ),
                                ],
                              );
                            });
                      },
                      icon: Icon(Icons.logout)),
                )
              ],
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
                        GestureDetector(
                          onTap: () {
                            // Handle tap actions if needed
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: width * 0.50926869016,
                                height: width * 0.50926869016,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      width * 0.50926869016 / 2),
                                  color: Colors.transparent,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      width * 0.50926869016 / 2),
                                  child: _imageFile == null
                                      ? widget.profilePicture == ""
                                          ? Image.asset(
                                              "assets/pp.png",
                                              width: width * 0.50926869016,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              widget.profilePicture.toString(),
                                              width: width * 0.50926869016,
                                              fit: BoxFit.cover,
                                            )
                                      : Image.file(_imageFile!),
                                ),
                              ),
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        width * 0.50926869016 / 2),
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            _pickImage(ImageSource.gallery);
                                            // Handle gallery image selection
                                          },
                                          icon: Icon(
                                            Icons.photo_library,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                        ),
                                        SizedBox(width: 16.0),
                                        IconButton(
                                          onPressed: () {
                                            _pickImage(ImageSource.camera);
                                            // Handle camera image capture
                                          },
                                          icon: Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
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
                            child: TextField(
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: widget.name.toString(),
                                hintStyle: TextStyle(color: Color(0xff6E7781)),
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
                            child: TextField(
                              controller: usernameController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: widget.userName.toString(),
                                hintStyle: TextStyle(color: Color(0xff6E7781)),
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
                                widget.email.toString(),
                                style: TextStyle(color: Color(0xff6E7781)),
                              ),
                            ),
                            padding: EdgeInsets.all(height * 0.01211460415 / 2 +
                                width * 0.0254634345 / 2),
                            decoration: BoxDecoration(
                              color: Colors
                                  .grey, // Set the background color to grey
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
                            child: TextField(
                              controller: ageContoller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: widget.age.toString(),
                                hintStyle: TextStyle(color: Color(0xff6E7781)),
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
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: widget.bio.toString(),
                                hintStyle: TextStyle(color: Color(0xff6E7781)),
                              ),
                              controller: bioController,
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
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.1092686901,
                        vertical: height * 0.01211460415,
                      ),
                      child: ElevatedButton(
                          //title: "SAVE CHANGES",
                          child: isLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'SAVE CHANGES',
                                  style: TextStyle(color: Colors.white),
                                ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(width * 0.78, height * 0.056),
                            backgroundColor: Color(
                                0xff3854DC), // Change the background color here
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          onPressed: () {
                            if (nameController.text != "" ||
                                ageContoller.text != "" ||
                                usernameController.text != "" ||
                                bioController.text != "" ||
                                _imageFile != null) {
                              editProfile(
                                  nameController.text.toString(),
                                  ageContoller.text.toString(),
                                  usernameController.text.toString(),
                                  bioController.text.toString());
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      //   icon: Icon(Icons.error),
                                      title: Text('Error',
                                          style: TextStyle(
                                              color: Color(0xff3854DC))),
                                      content: Text(
                                          'Failed to Update Profile info. No changes to update.'),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
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
                          }),
                    )
                  ],
                ),
              ),
            )));
  }
}
