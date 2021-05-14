import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:zoom_app/authentication/loginScreen.dart';
import 'package:zoom_app/authentication/registerScreen.dart';
import 'package:zoom_app/variables.dart';

class NavigateAuthScreen extends StatefulWidget {
  @override
  _NavigateAuthScreenState createState() => _NavigateAuthScreenState();
}

class _NavigateAuthScreenState extends State<NavigateAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[250],
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: GradientColors.beautifulGreen)),
            child: Center(
              child: Image.asset(
                'images/logo.png',
                height: 100,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.6,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: const Offset(0, 3))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen())),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 60,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: GradientColors.blue),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "SIGN IN",
                          style: myStyle(30, Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen())),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 60,
                      decoration: BoxDecoration(
                          gradient:
                              LinearGradient(colors: GradientColors.cherry),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "SIGN UP",
                          style: myStyle(30, Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
