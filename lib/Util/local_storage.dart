import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserId(String uId, String fName, String lName, String contact) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('uID', uId);
  prefs.setString('fName', fName);
  prefs.setString('lName', lName);
  prefs.setString('contact', contact);
  print(uId);
}

Future<String?> getUID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('uID');
}
 getF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return '${prefs.getString('fName')} ${prefs.getString('lName')} ';
}
getC()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return'${prefs.getString('contact')}';
}
clearLocalData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  print('logout');
}
