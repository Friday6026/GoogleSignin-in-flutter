import 'dart:async';

import 'package:flutter/material.dart';
import 'package:googlesigninwithfirebase/Screens/AboutScreen.dart';
import 'package:googlesigninwithfirebase/Screens/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var userToken;

  @override
  route() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => userToken == null || userToken == 'null' || userToken == '' ? HomeScreen() : AboutScreen(),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container();
  }

  Future startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }
}
