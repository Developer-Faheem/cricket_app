
import 'package:cricket_app/Screens/Profile.dart';
import 'package:cricket_app/Screens/Status.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Screens/Create events.dart';
import 'Screens/HOME.dart';
import 'Screens/Serach page.dart';
import 'Screens/Startup1.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ( context,  orientation,  deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:   
        //Events(),
         Startup1(),
      );
    },

    );
  }
}





class btmnavigation extends StatefulWidget {
  @override
  _btmnavigationState createState() => _btmnavigationState();
}

class _btmnavigationState extends State<btmnavigation> {
  int _currentIndex = 0;
  double height = 0;
  double width = 0;
  List<bool> _selectedStates = [
    true,
    false,
    false,
    false,
    false
  ]; // Maintain selected states of icons

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _selectedStates = List.generate(5,
              (i) => i == index); // Update the selected state of the clicked icon
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _getBodyWidget(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        selectedItemColor: Color(0xff660099),
        showUnselectedLabels: false,
        iconSize: height * 0.04845841662 / 2 + width * 0.10185373803 / 2,
        items: [
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: _selectedStates[0]
                  ? ColorFilter.mode(Color(0xff3854DC), BlendMode.srcIn)
                  : ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
              child: Image.asset(
                "assets/Home.png",
                width: width * 0.07639030352,
              ),
            ),
            label: 'camera',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: _selectedStates[1]
                  ? ColorFilter.mode(Color(0xff3854DC), BlendMode.srcIn)
                  : ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
              child: Image.asset(
                "assets/Search.png",
                width: width * 0.07639030352,
              ),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: _selectedStates[2]
                  ? ColorFilter.mode(Color(0xff3854DC), BlendMode.srcIn)
                  : ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
              child: Image.asset(
                "assets/Create.png",
                width:width* 0.12731717254,
              ),
            ),
            label: 'camera',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: _selectedStates[3]
                  ? ColorFilter.mode(Color(0xff3854DC), BlendMode.srcIn)
                  : ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
              child: Image.asset(
                "assets/Status.png",
                width: width * 0.07639030352,
              ),
            ),
            label: 'person',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: _selectedStates[4]
                  ? ColorFilter.mode(Color(0xff3854DC), BlendMode.srcIn)
                  : ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
              child: Image.asset(
                "assets/Profile.png",
                width: width * 0.07639030352,
              ),
            ),
            label: 'person',
          ),
        ],
      ),
    );
  }

  _getBodyWidget() {
    switch (_currentIndex) {
      case 0:
        return Home();
      case 1:
        return Search();
      case 2:
        return Events();
      case 3:
        return Status();
      case 4:
        return Profile();
      default:
        return Container();
    }
  }
}
