import 'package:flutter/material.dart';
import 'package:googlesigninwithfirebase/Screens/HomeScreen.dart';
import 'package:googlesigninwithfirebase/Utils/Constant.dart';
import 'package:googlesigninwithfirebase/Utils/GoogleSignin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String? user_Token;

  String? userName;

  String? userEmail;

  String? userImage;

  @override
  void initState() {
    GetData();
    super.initState();
  }

  GetData() async {
    final prefs = await SharedPreferences.getInstance();
    user_Token = prefs.getString('UserToken');
    userName = prefs.getString('userName');
    userEmail = prefs.getString('userEmail');
    userImage = prefs.getString('userImage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipOval(
            child: Image.asset(userImage!),
          ),
          Text('$userName', style: TextStyle(fontSize: 20)),
          Text('$userEmail', style: TextStyle(fontSize: 20)),
          InkWell(
            onTap: () {
              signOutGoogle();
              clearPrefData();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
            },
            child: Center(
              child: Container(
                height: 100,
                width: 200,
                child: Text('Sign Out', style: TextStyle(fontSize: 20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
