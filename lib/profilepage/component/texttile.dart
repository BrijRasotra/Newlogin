import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Texttile extends StatefulWidget {
  TextEditingController emailController, passwordController;

  Texttile(this.emailController, this.passwordController);

  @override
  _TexttileState createState() =>
      _TexttileState(emailController, passwordController);
}

class _TexttileState extends State<Texttile> {
  bool hidePassword = true;
  TextEditingController emailController, passwordController;

  _TexttileState(this.emailController, this.passwordController);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          TextFormField(
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              controller: emailController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter email id...',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black26,
                  )),
              validator: (val) {
                if (val.toString().isEmpty)
                  return "Enter email address";
                else
                  null;
              }),
          Divider(
            height: 20,
            thickness: 1,
            color: Colors.black26,
          ),
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: passwordController,
              obscureText: hidePassword,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Password',
                counterText: '',
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black38,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword ? hidePassword = false : hidePassword = true;
                    });
                  },
                  color: Colors.black38,
                  icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility),
                ),
              ),
              validator: (val) {
                if (val.toString().isEmpty)
                  return "Enter password minimum 10 character";
                else if (val.toString().length < 10)
                  return 'enter password minimum 10 character';
                else
                  null;
              }),
        ]),
      ),
    );
  }
}
