import 'package:facebook/profilepage/container%20page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewLogin extends StatelessWidget {
  const NewLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://d160p8tq559394.cloudfront.net/images/login/login-form-img.png')),
            color: Colors.black,
          ),
          child: Containerpage()),
    );
  }
}
