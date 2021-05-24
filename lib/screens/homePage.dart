import 'package:flutter/material.dart';
import 'package:zoom_app/screens/profileScreen.dart';
import 'package:zoom_app/screens/videoConferenceScreen.dart';
import 'package:zoom_app/variables.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int page = 0;
  List pageOptions = [
    VideoConferenceScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[250],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: myStyle(17, Colors.blue),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: myStyle(17, Colors.black),
        currentIndex: page,
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: Text("Video Call").toString(),
            icon: Icon(
              Icons.video_call,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            label: Text("Profile").toString(),
            icon: Icon(
              Icons.person,
              size: 32,
            ),
          )
        ],
      ),
      body: pageOptions[page],
    );
  }
}
