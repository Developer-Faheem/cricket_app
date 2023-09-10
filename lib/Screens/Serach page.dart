import 'package:cricket_app/Screens/JOIN%20PAGE.dart';
import 'package:cricket_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final cityController = TextEditingController();

  // Constants for segmented control values
  static const int searchByDateIndex = 0;
  static const int searchByCityIndex = 1;

  // Current selected index in the segmented control
  int _selectedIndex = searchByDateIndex;

  String? selectedDate;
  String? selectedCity;
  double height = 0;
  double width = 0;
  //DateTime? selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate.toString();
      });
    }
  }

  void setCity() {
    setState(() {
      //  print(selectedCity);
      selectedCity = cityController.text.toLowerCase().toString();
      //   print(cityController.text.toLowerCase().toString());
    });
    //
    // }
  }

  Future<List<DocumentSnapshot>> fetchDataByDate(String? date) async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      User? user = _auth.currentUser;

      String userId = user!.uid;

      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('match')
          .where('data', isEqualTo: date)
          .where('eventCreatorId', isNotEqualTo: userId)
          .get();

      print(date);
      print(snapshot.docs);

      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  Future<List<DocumentSnapshot>> fetchDataByCity(String? city) async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      User? user = _auth.currentUser;

      String userId = user!.uid;

      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('match')
          .where('location', isEqualTo: city)
          .where('eventCreatorId', isNotEqualTo: userId)
          .get();

      print(city);
      //print(snapshot.docs);

      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.02422920831,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05092686901),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Segmented control for selecting search option
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = searchByDateIndex;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: _selectedIndex == searchByDateIndex
                                ? const Color(0xff3854DC)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Search by Date',
                              style: TextStyle(
                                color: _selectedIndex == searchByDateIndex
                                    ? Colors.white
                                    : Color(0xff000000),
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = searchByCityIndex;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: _selectedIndex == searchByCityIndex
                                ? const Color(0xff3854DC)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Search by Location',
                              style: TextStyle(
                                color: _selectedIndex == searchByCityIndex
                                    ? Colors.white
                                    : Color(0xff000000),
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01211460415),
                if (_selectedIndex ==
                    searchByDateIndex) // Conditional rendering based on the selected option
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Date",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: height * 0.01211460415),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            (height * 0.00605730207 / 2) +
                                (width * 0.01273171725 / 2),
                          ),
                          border: Border.all(color: Color(0xff000000)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: width * 0.68751273171,
                              height: height * 0.06057302077,
                              child: Center(
                                child: Text(
                                  selectedDate != null
                                      ? selectedDate.toString()
                                      : 'DD / MM / YYYY',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Color(0xff989696),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: width * 0.06370747606,
                              height: height * 0.05057302077,
                              decoration: BoxDecoration(),
                              child: GestureDetector(
                                onTap: () async {
                                  await _pickDate(context);
                                  //       fetchDataByDate(selectedDate.toString());
                                },
                                child: Image.asset(
                                  "assets/Vector 6.png",
                                  width: width * 0.0154634345,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                if (_selectedIndex ==
                    searchByCityIndex) // Conditional rendering based on the selected option
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Search location", // Updated text
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: height * 0.01211460415),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            (height * 0.00605730207 / 2) +
                                (width * 0.01273171725 / 2),
                          ),
                          border: Border.all(color: Color(0xff000000)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: width * 0.68751273171,
                              height: height * 0.06057302077,
                              child: Center(
                                child: TextField(
                               
                                  controller: cityController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: width * 0.0254634345),
                                    hintText: "Enter location",
                                    hintStyle: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xff989696),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: width * 0.12370747606,
                              height: height * 0.05057302077,
                              decoration: BoxDecoration(),
                              child: GestureDetector(
                                onTap: () {
                                   setState(() {
                                    selectedCity = cityController.text.toLowerCase().toString();
                                  });
                                },
                                child: Center(child: Text('search')),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          // ],
          //     ),
          //   )

          Expanded(
            child: Container(
                width: double.infinity,
                //    height: height * 0.49960445817,
                child: selectedDate == null && selectedCity==null
                    ? SizedBox()
                    : FutureBuilder<List<DocumentSnapshot>>(
                        future: _selectedIndex == 0
                            ? fetchDataByDate(selectedDate.toString())
                            : fetchDataByCity(selectedCity.toString()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error fetching data'),
                            );
                          } else {
                            List<DocumentSnapshot>? data = snapshot.data;

                            if (data == null || data.isEmpty) {
                              return Center(
                                child: Text('No Record found! '),
                              );
                            }

                            // Use the data to display in your widget
                            return ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                var matchData =
                                    data[index].data() as Map<String, dynamic>;

                                String location =
                                    matchData['location'].toString();
                                String date = matchData['data'].toString();
                                String startTime =
                                    matchData['startTime'].toString();
                                String match = matchData['title'].toString();
                                String eventId =
                                    matchData['eventCreatorId'].toString();
                                String image1 =
                                    matchData['team1ImageUrl'].toString();
                                String image2 =
                                    matchData['team2ImageUrl'].toString();
                                String team1 = matchData['team1'].toString();
                                String team2 = matchData['team2'].toString();

                                String uid = matchData['uid'].toString();

                                // String uid= snapshot.data!.docs[index]['uid'].toString();
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.05092686901,
                                      vertical: 8.sp),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              3), // horizontal, vertical offset
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(
                                          height * 0.02422920831 / 2 +
                                              width * 0.05092686901 / 2),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: width * 0.48380525565,
                                          height: height * 0.2422920831,
                                          child: Image.asset(
                                            matchData['image'].toString(),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: height * 0.03634381246),
                                          child: Container(
                                            width: width * 0.40741495212,
                                            height: height * 0.18171906233,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      width * 0.0254634345),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Center(
                                                    child: Text(
                                                      matchData['title']
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: height *
                                                          0.00363438124),
                                                  Container(
                                                    width:
                                                        width * 0.50926869016,
                                                    height:
                                                        height * 0.00242292083,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                      height: height *
                                                          0.00363438124),
                                                  Center(
                                                    child: Text(
                                                      matchData['members']
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 7.sp,
                                                        color:
                                                            Color(0xff262D33),
                                                      ),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      "Start time :${matchData['startTime'].toString()} ",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 7.sp,
                                                        color:
                                                            Color(0xff262D33),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                       height: height * 0.01605730207),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                            width: width *
                                                                0.07639030352,
                                                            height: width *
                                                                0.07639030352,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          width *
                                                                              0.03819515176),
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    matchData[
                                                                            'team1ImageUrl']
                                                                        .toString()),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            matchData['team1']
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 7.sp,
                                                              color: Color(
                                                                  0xff000000),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      // Spacer(),
                                                      Column(
                                                        children: [
                                                          Container(
                                                            width: width *
                                                                0.07639030352,
                                                            height: width *
                                                                0.07639030352,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          width *
                                                                              0.03819515176),
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    matchData[
                                                                            'team2ImageUrl']
                                                                        .toString()),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            matchData['team2']
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 7.sp,
                                                              color: Color(
                                                                  0xff000000),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                     height: height * 0.02211460415),
                                                  Center(
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Joinpage(
                                                                        location:
                                                                            location,
                                                                        date: date.substring(
                                                                            0,
                                                                            10),
                                                                        startTime:
                                                                            startTime,
                                                                        match:
                                                                            match,
                                                                        image1:
                                                                            image1,
                                                                        image2:
                                                                            image2,
                                                                        enrolledPersonId:
                                                                            eventId,
                                                                        uid:
                                                                            uid,
                                                                        team1:
                                                                            team1,
                                                                        team2:
                                                                            team2,
                                                                      )),
                                                        );
                                                      },
                                                      child: Container(
                                                        width: width *
                                                            0.25463434508,
                                                        height: height *
                                                            0.03028651038,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xff3854DC),
                                                            borderRadius: BorderRadius
                                                                .circular((height *
                                                                        0.00605730207 /
                                                                        2) +
                                                                    (width *
                                                                        0.01273171725 /
                                                                        2))),
                                                        child: Center(
                                                          child: Text(
                                                            "Join",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      )),
          ),
        ],
      ),
    );
  }
}
