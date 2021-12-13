
import 'package:facebook/Util/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  String name=' ';
  String cont=' ';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     getUser();
     getPhone();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            children: [
              Image.network('https://wallpapercave.com/wp/dLZ5oMU.png'),

            ],
          ),
          ClipOval(child: Image.network('https://www.pngitem.com/pimgs/m/581-5813504_avatar-dummy-png-transparent-png.png',scale: 13,)),
          Positioned( top: 70,left: 10,
            child: Text(name,style: TextStyle(color: Colors.white),),
          ),
          Positioned(right: 10,top: 20,
              child: Text(cont,style: TextStyle(color: Colors.white),)),
          Positioned(top: 90,left: 10,
              child: Text('theratap@yopmail.com',style: TextStyle(color: Colors.white),)),
          Positioned(top: 130,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(children: [
                Icon(Icons.account_box),
                SizedBox(width: 35,),
                Text('Interest',style: TextStyle(color: Colors.deepPurple),)
              ],),
              SizedBox(height:25,),
              Row(children: [
                Icon(Icons.public),
                SizedBox(width: 35,),
                Text('My Courses',style: TextStyle(color: Colors.deepPurple),)
              ],),
              SizedBox(height:25,),
              Row(children: [
                Icon(Icons.map),
                SizedBox(width: 35,),
                Text('Todo/Done',style: TextStyle(color: Colors.deepPurple),)
              ],),
              SizedBox(height:25,),
              Row(children: [
                Icon(Icons.download),
                SizedBox(width: 35,),
                Text('Offline Artical',style: TextStyle(color: Colors.deepPurple),)
              ],),
              SizedBox(height:25,),
              Row(children: [
                Icon(Icons.star),
                SizedBox(width: 35,),
                Text('Rate Us',style: TextStyle(color: Colors.deepPurple),)
              ],),
              SizedBox(height:25,),
              Row(children: [
                Icon(Icons.message),
                SizedBox(width: 35,),
                Text('Support',style: TextStyle(color: Colors.deepPurple),)
              ],),
              SizedBox(height:25,),
              Row(children: [
                Icon(Icons.settings),
                SizedBox(width: 35,),
                Text('Settings',style: TextStyle(color: Colors.deepPurple),)
              ],),
              SizedBox(height:25,),
              Row(children: [
                Icon(Icons.logout),
                SizedBox(width: 35,),
                Text('Log Out',style: TextStyle(color: Colors.deepPurple),)
              ],)
            ],),
          )
        ],
      ),
    );
  }
  Future <void> getUser() async {
    name=await getF();
    setState(() {

    });
        }
  Future <void> getPhone() async {
    cont=await getC();
    setState(() {

    });
  }
}


