import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:zoom_app/authentication/navigateAuthScreen.dart';
import 'package:zoom_app/variables.dart';

class IntroAuthScreen extends StatefulWidget {
  @override
  _IntroAuthScreenState createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: "Welcome",
            body: "Welcome to Rooms, the best video conferencing app",
            image: Center(
              child: Image.asset('images/welcome.png', height: 175),
            ),
            decoration: PageDecoration(
              bodyTextStyle: myStyle(20, Colors.black),
              titleTextStyle: myStyle(20, Colors.black),
            )),
        PageViewModel(
            title: "Join or Start Meetings",
            body: "Easy to use interface, join or start meetings at ease",
            image: Center(
              child: Image.asset('images/conference.png', height: 175),
            ),
            decoration: PageDecoration(
              bodyTextStyle: myStyle(20, Colors.black),
              titleTextStyle: myStyle(20, Colors.black),
            )),
        PageViewModel(
            title: "Security",
            body:
                "Your security is important to us, Our servers are secure and reliable",
            image: Center(
              child: Image.asset('images/secure.jpg', height: 175),
            ),
            decoration: PageDecoration(
              bodyTextStyle: myStyle(20, Colors.black),
              titleTextStyle: myStyle(20, Colors.black),
            ))
      ],
      onDone: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavigateAuthScreen()));
      },
      onSkip: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavigateAuthScreen()));
      },
      showSkipButton: true,
      skip: const Icon(
        Icons.skip_next,
        size: 45,
      ),
      next: const Icon(Icons.arrow_forward_ios),
      done: Text(
        "Done",
        style: myStyle(20, Colors.black),
      ),
    );
  }
}
