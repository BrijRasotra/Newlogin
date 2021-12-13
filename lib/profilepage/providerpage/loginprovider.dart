import 'dart:convert';
import 'package:facebook/Model/log_in_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier{
  LoginModel? loginModel;
  bool loading=false;

  Future<void> hitLogin(String email,String pass) async{
    loading=true;
    notifyListeners();
    var url=Uri.parse('https://theratap.com:1337/api/v1/user/login');
    var response= await http.post(url,body: {'email':email,'password':pass});
    loginModel=LoginModel.fromJson(jsonDecode(response.body));
    loading=false;

    notifyListeners();
  }
}