import 'package:facebook/profilepage/providerpage/loginprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Containerpage extends StatelessWidget {
  LoginProvider? _provider;
  var emailController = TextEditingController();
  var passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _provider = context.read<LoginProvider>();
    return Stack(clipBehavior: Clip.none, children: [
      Positioned(
          top: 80,
          left: 140,
          child: Text(
            'LOGIN',
            style: TextStyle(color: Colors.deepPurple[200], fontSize: 60),
          )),
      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 250,left: 70),
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          height: 170,width: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white60,
          ),
          child:  Column(children: [
               TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'User Name',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
               TextFormField(
                  controller: passController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      hintText: 'password',
                      hintStyle: TextStyle(color: Colors.black)),
                ),
            ]),
          ),
      ),
      Positioned(
         top: 400,
          left: 150,
          child: Consumer<LoginProvider>(
            builder: (context, val, child){

              return val.loading
                  ? Center(child: CircularProgressIndicator())
                  : GestureDetector(
                onTap: () {
                  _provider!.hitLogin(emailController.text.toString(),
                      passController.text.toString());
                },
                child: Container(
                  height: 60,
                  width: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              );
            }
          )),
    ]);
  }
}
