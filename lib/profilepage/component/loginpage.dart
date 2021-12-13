import 'dart:convert';
import 'package:facebook/Util/local_storage.dart';
import 'package:facebook/profilepage/component/homepage.dart';
import 'package:facebook/profilepage/component/texttile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var res;
  var apilength = 0;
  bool loading = false;
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange, Colors.pink]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50, right: 50),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Texttile(emailController, passwordController),
                          Positioned(
                            bottom: -20,
                            child: loading == true
                                ? CircularProgressIndicator()
                                : GestureDetector(
                                    onTap: () {
                                      if (formKey.currentState!.validate())
                                        apiTest();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 10)
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          gradient: LinearGradient(colors: [
                                            Colors.pink,
                                            Colors.orange
                                          ])),
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Forget Password?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 1,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "or",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 100,
                            height: 1,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        margin: EdgeInsets.only(left: 100, right: 70),
                        decoration: BoxDecoration(border: Border()),
                        child: Row(children: [
                          ClipOval(
                              child: Image.network(
                            'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c79e2a8d-f9ee-4acb-bd33-9cfec9cc0a95/dcx3378-2ad691a6-8095-4f4a-8fda-371b45ba45d2.'
                            'png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7In'
                            'BhdGgiOiJcL2ZcL2M3OWUyYThkLWY5ZWUtNGFjYi1iZDMzLTljZmVjOWNjMGE5NVwvZGN4MzM3OC0yYWQ2OTFhNi04MDk1LTRmNGEtOGZkYS0zNzFiNDViYTQ1ZDIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.'
                            'N5zD3QjPwSkvDJHhX7EnI32KK3VQZrujQY48m_6UVmU',
                            scale: 8,
                          )),
                          SizedBox(width: 20),
                          ClipOval(
                            child: Image.network(
                              'https://cdn.freebiesupply.com/logos/large/2x/google-g-2015-logo-png-transparent.png',
                              scale: 45,
                            ),
                          )
                        ]),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Do not have an account?Sign in',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> apiTest() async {
    setState(() {
      loading = true;
    });
    var url = Uri.parse('https://theratap.com:1337/api/v1/user/login');
    var response = await http.post(url, body: {
      "email": emailController.text.toString(),
      "password": passwordController.text.toString()
    }).timeout(Duration(seconds: 20));
    print(response.body);
    setState(() {
      loading = false;
    });
    res = jsonDecode(response.body);
    showMessage(res['message']);
    if (res['code'] == 200) {
      saveUserId(
        res['data']['userInfo']['_id'],
        res['data']['userInfo']['firstName'],
        res['data']['userInfo']['lastName'],
        res['data']['userInfo']['mobile_no'],
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
    print(res);
    setState(() {
      apilength = res.length;
    });
  }

  showMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
