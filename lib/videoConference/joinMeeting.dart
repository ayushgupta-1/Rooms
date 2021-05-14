import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:zoom_app/variables.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'dart:io';

class JoinMeeting extends StatefulWidget {
  @override
  _JoinMeetingState createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  String username = '';

  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  getUserData() async {
    DocumentSnapshot userDoc =
        await userCollection.doc(FirebaseAuth.instance.currentUser.uid).get();
    setState(() {
      username = userDoc.data()['username'];
    });
  }

  joinMeeting() async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      if (Platform.isAndroid) {
        featureFlag.callIntegrationEnabled = false;
      } else if (Platform.isIOS) {
        featureFlag.pipEnabled = false;
      }

      var options = JitsiMeetingOptions()
        ..room = codeController.text
        ..userDisplayName =
            nameController.text == '' ? username : nameController.text
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted
        ..featureFlag = featureFlag;

      await JitsiMeet.joinMeeting(options);
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                "Room Code",
                style: myStyle(20),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                maxLength: 6,
                controller: codeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter code here.....",
                    labelStyle: myStyle(14)),
                onChanged: (value) {},
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: myStyle(20),
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name (Leave if you want your username)",
                    labelStyle: myStyle(14)),
              ),
              SizedBox(
                height: 16,
              ),
              CheckboxListTile(
                value: isVideoMuted,
                onChanged: (value) {
                  setState(() {
                    isVideoMuted = value;
                  });
                },
                title: Text(
                  "Video Muted",
                  style: myStyle(18, Colors.black),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CheckboxListTile(
                value: isAudioMuted,
                onChanged: (value) {
                  setState(() {
                    isAudioMuted = value;
                  });
                },
                title: Text(
                  "Audio Muted",
                  style: myStyle(18, Colors.black),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Of course, you can customize your settings in the meeting",
                style: myStyle(15),
                textAlign: TextAlign.center,
              ),
              Divider(
                height: 24,
                thickness: 2,
              ),
              InkWell(
                onTap: () => joinMeeting(),
                child: Container(
                  width: double.maxFinite,
                  height: 64,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: GradientColors.cherry,
                  )),
                  child: Center(
                    child: Text(
                      "Join Meeting",
                      style: myStyle(20, Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
