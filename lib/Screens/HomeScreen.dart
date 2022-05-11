import 'package:flutter/material.dart';
import 'package:googlesigninwithfirebase/Screens/AboutScreen.dart';
import 'package:googlesigninwithfirebase/Utils/Constant.dart';
import 'package:googlesigninwithfirebase/Utils/GoogleSignin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: InkWell(
              onTap: () async {
                await signInWithGoogle().then(
                  (result) async {
                    if (result != null) {
                      await setPrefData(key: 'userName', value: gName.toString());
                      await setPrefData(key: 'userEmail', value: gEmail.toString());
                      await setPrefData(key: 'userImage', value: image.toString());
                      await setPrefData(key: 'UserToken', value: googleAuth.toString());

                      Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
                    }
                  },
                );
              },
              child: Container(
                height: 100,
                width: 200,
                color: Colors.blue,
                child: Text('Google Signin'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
