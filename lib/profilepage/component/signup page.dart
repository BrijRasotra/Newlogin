import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var contactController = TextEditingController();
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool valuefirst = false;
  bool loading = false, hidepassword = true, hidepassword1 = true;
  var formKey = GlobalKey<FormState>();
  var res;
  var apilength = 0;
  var checkboxvalue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
              children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(200)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.orange, Colors.pink])),
                ),
                Positioned(
                  bottom: -20,
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 10)
                        ], color: Colors.white, shape: BoxShape.circle),
                        child: ClipOval(
                            child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSefW2T8BGhHrcrEOgGMOMpKgBKMahj9ClYDQ&usqp=CAU')),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 10)
                            ],
                          ),
                          child: Icon(Icons.add),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 7),
                            ]),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_box,
                              color: Colors.black12,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                  controller: firstnameController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  textInputAction: TextInputAction.next,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    hintText: 'First Name',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.black),
                                  ),
                                  validator: (val) {
                                    if (val.toString().isEmpty)
                                      return "Enter first name";
                                    else
                                      null;
                                  }),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 7),
                            ]),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_box,
                              color: Colors.black12,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                  controller: lastnameController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  textInputAction: TextInputAction.next,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    hintText: 'Last Name',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.black),
                                  ),
                                  validator: (val) {
                                    if (val.toString().isEmpty)
                                      return "Enter Last name";
                                    else
                                      null;
                                  }),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 7),
                          ]),
                      child: Row(children: [
                        Icon(
                          Icons.email,
                          color: Colors.black12,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: 'Email id..',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.black),
                              ),
                              validator: (val) {
                                if (val.toString().isEmpty)
                                  return "Enter Email id..";
                                else
                                  null;
                              }),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 7),
                          ]),
                      child: Row(children: [
                        Icon(
                          Icons.phone,
                          color: Colors.black12,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                              maxLength: 10,
                              keyboardType: TextInputType.phone,
                              controller: contactController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                counterText: " ",
                                hintText: 'Contect number',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.black),
                              ),
                              validator: (val) {
                                if (val.toString().isEmpty)
                                  return "Enter Contact controller";
                                else if (val.toString().length < 10)
                                  return "Enter contact numbers 10";
                                else
                                  null;
                              }),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 7),
                            ]),
                        child: Row(
                          children: [
                            Icon(
                              Icons.lock,
                              color: Colors.black12,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                  controller: passwordController,
                                  obscureText: hidepassword,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  textInputAction: TextInputAction.next,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    hintStyle: TextStyle(color: Colors.black),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          hidepassword
                                              ? hidepassword = false
                                              : hidepassword = true;
                                        });
                                      },
                                      color: Colors.black38,
                                      icon: Icon(hidepassword
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val.toString().isEmpty)
                                      return "Enter password";
                                    else
                                      null;
                                  }),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 7),
                            ]),
                        child: Row(
                          children: [
                            Icon(
                              Icons.lock,
                              color: Colors.black12,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                  obscureText: hidepassword1,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  textInputAction: TextInputAction.next,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Confirm Password',
                                    hintStyle: TextStyle(color: Colors.black),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          hidepassword1
                                              ? hidepassword1 = false
                                              : hidepassword1 = true;
                                        });
                                      },
                                      color: Colors.black38,
                                      icon: Icon(hidepassword1
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val.toString().isEmpty)
                                      return "Enter password";
                                    else
                                      null;
                                  }),
                            ),
                          ],
                        )),
                    FormField(validator: (value) {
                      if (value == false) {
                        return 'Required.';
                      }
                    }, builder: (FormFieldState<dynamic> field) {
                      return CheckboxListTile(
                        value: checkboxvalue,
                        onChanged: (val) {
                          setState(() {
                            checkboxvalue = val!;
                          });
                        },
                        title: Text(
                          'I agree to all conditions.',
                          style: TextStyle(fontSize: 15),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.green,
                      );
                    }),
                    Center(
                      child: loading == true
                          ? CircularProgressIndicator()
                          : GestureDetector(
                              onTap: () {
                                if (formKey.currentState!
                                    .validate()) if (checkboxvalue)
                                  apiTest();
                                else
                                  showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 100,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.rectangle),
                                                child: Text(
                                                    'Accept terms and conditions'),
                                              ),
                                            ],
                                          )));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26, blurRadius: 10)],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    gradient: LinearGradient(
                                        colors: [Colors.pink, Colors.orange])),
                                child: Text(
                                  'Signup',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(child: Text('Already have an account.Login')),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 50, right: 70),
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
                        SizedBox(width: 50),
                        ClipOval(
                          child: Image.network(
                            'https://cdn.freebiesupply.com/logos/large/2x/google-g-2015-logo-png-transparent.png',
                            scale: 45,
                          ),
                        )
                      ]),
                    ),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> apiTest() async {
    setState(() {
      loading = true;
    });
    var url = Uri.parse('http://192.168.1.100:8000/api/v1/register');
    var response = await http.post(url, body: {
      "firstName": firstnameController.text.toString(),
      "lastName": lastnameController.text.toString(),
      "email": emailController.text.toString(),
      "contact": contactController.text.toString(),
      "password": passwordController.text.toString()
    }).timeout(Duration(seconds: 4));
    print(response.body);
    setState(() {
      loading = false;
    });
    res = jsonDecode(response.body);
    showMessage(res['message']);
    if (res['code'] == 200) {
      print('correct');
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
