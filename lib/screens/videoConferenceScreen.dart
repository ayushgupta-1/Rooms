import 'package:flutter/material.dart';
import 'package:zoom_app/variables.dart';
import 'package:zoom_app/videoConference/createMeeting.dart';
import 'package:zoom_app/videoConference/joinMeeting.dart';

class VideoConferenceScreen extends StatefulWidget {
  @override
  _VideoConferenceScreenState createState() => _VideoConferenceScreenState();
}

class _VideoConferenceScreenState extends State<VideoConferenceScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  buildTab(String name) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.7,
      height: 50,
      child: Center(
        child: Text(
          name,
          style: myStyle(15, Colors.white, FontWeight.w700),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Rooms",
          style: headerStyle(35),
        ),
        bottom: TabBar(
          indicatorColor: Colors.lightBlueAccent,
          controller: tabController,
          tabs: [buildTab("Join Meeting"), buildTab("Create Meeting")],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue,Colors.yellowAccent],
              begin: Alignment.topLeft,
              end: Alignment.topRight),
              ),
              ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          JoinMeeting(),
          CreateMeeting(),
        ],
      ),
    );
  }
}
