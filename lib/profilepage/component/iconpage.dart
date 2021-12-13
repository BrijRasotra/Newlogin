
import 'dart:async';

import 'package:facebook/Util/local_storage.dart';
import 'package:facebook/profilepage/component/homepage.dart';
import 'package:facebook/profilepage/component/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    startTimer();
  }
  startTimer()async{
    var duration=Duration(seconds: 5);
    return Timer(duration, route);
  }
  route() async {
    var id=await getUID();
    if(id==null)
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginPage()));
    else
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomePage()));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.network('https://i.pinimg.com/originals/17/76/0a/17760a6daad2edf7f4d9b837b5437246.jpg',scale:3),
            ),
            Padding(padding: EdgeInsets.only(top: 120)),
            Text('Welcome to instagram',style: TextStyle(fontSize: 20),),
            Padding(padding: EdgeInsets.only(top: 20)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}
