import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_app/Screens/Confirmation%20page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class MatchData {

   

  Future<void> createdMatch(
      BuildContext context,
     {required String  id,required String matchType,
      required members,
     required  String startTime,
      required String date,
     required  String teamName,
      required String temamImageUrl,
     required  String location,
     required  String name,
      required String age,
      required String phoneNumber,
      required String unseletedTeamImageUrl,
       required String unselectedTeamName}) async {


    //      FirebaseAuth _auth = FirebaseAuth.instance;
    // User? user = _auth.currentUser;

    // if (user == null) {
    //   print('User not signed in.');
    //   return;
    // }

    
    String uniqueDocumentID = Uuid().v4();
    
    
    await _firebaseFirestore.collection('enrollmentData').doc(uniqueDocumentID).set({
      'documentId':uniqueDocumentID,
      'id': id,
      'name': name,
      'age': age,
      'phoneNumber':phoneNumber,
      'matchType': matchType,
      'members': members,
      'startTime': startTime,
      'date': date,
      'teamName': teamName,
      'teamImageUrl': temamImageUrl,
      'locaton': location,
      'unseletedTeamImageUrl':unseletedTeamImageUrl,
      'unselectedTeamName':unselectedTeamName
    }).then((value) {
       Navigator.push(context, MaterialPageRoute(builder: (context)=> Confirmationpage()));
      print('enrolled sucessful');
    });
  }
}
