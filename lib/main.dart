import 'dart:io';
import 'package:facebook/profilepage/component/iconpage.dart';
import 'package:facebook/profilepage/component/loginpage.dart';
import 'package:facebook/profilepage/component/signup%20page.dart';
import 'package:facebook/profilepage/newlogin.dart';
import 'package:facebook/profilepage/providerpage/loginprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:ChangeNotifierProvider(create: (_)=>LoginProvider(),
      child: NewLogin(),)
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

