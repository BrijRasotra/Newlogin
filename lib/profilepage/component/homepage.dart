import 'dart:convert';
import 'package:facebook/Util/local_storage.dart';
import 'package:facebook/profilepage/component/loginpage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drare.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var apilength = 0;
  var res;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiTest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF736ab7),
      drawer:DrawerPage() ,
      appBar: AppBar(
        title: Center(
            child: Text(
              'Movies',
              style: TextStyle(fontSize: 20),
            )),
        actions: [
          IconButton(
              onPressed: () {
                logoutApp();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemBuilder: (context, index) =>
            Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 30,
                      top: 20,
                    ),
                    padding: EdgeInsets.only(left: 50),
                    height: 100,
                    width: 340,
                    decoration: BoxDecoration(
                        color: Color(0xFF333366),
                        boxShadow: [BoxShadow(blurRadius: 5)]),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${res[index]['title'].toString()}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Rating:-${res[index]['rating'].toString()}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF736ab7),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text('${getData(res[index]['genre'])}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF736ab7),
                                  )),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    '${res[index]['releaseYear'].toString()}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF736ab7),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 35,
                left: 8,
                child: Container(
                  height: 73,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                        )
                      ]),
                  child: Image.network(
                    res[index]['image'],
                  ),
                ),
              ),
            ]),
        itemCount: apilength,
      ),
    );
  }

  Future<void> apiTest() async {
    setState(() {
      loading = true;
    });
    var url = Uri.parse('https://api.androidhive.info/json/movies.json');
    var response = await http.get(url);
    res = jsonDecode(response.body);
    setState(() {
      loading = false;
    });
    setState(() {
      apilength = res.length;
    });
  }

  getData(List<dynamic> data) {
    String d = ' ';
    for (int i = 0; i < data.length; i++) {
      d += data[i] + ',';
    }
    return d;
  }

  void logoutApp() {
    showDialog(
        context: context,
        builder: (context) =>
            Dialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                height: 80,
                width: 200,
                color: Colors.white,
                child: Column(
                  children: [
                    Text('Are you sure you want to logout ?'),
                    Row(
                      children: [
                        Spacer(),
                        TextButton(onPressed: () {
                          clearLocalData();
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                                  (
                                  route) => false);
                        }, child: Text('Yes')),
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text('No')),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
