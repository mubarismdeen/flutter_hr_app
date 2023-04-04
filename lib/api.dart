import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
var url = 'http://192.168.0.134:5001/api/Notes/';
String ip = "10.0.2.2:5001";
//  String ip = gip;
// String ip = "192.168.1.200:81";
//String ip = "192.168.1.127:5001";
//String ip = "localhost:5001";
// String ip = "172.11.7.254:88"; //live
//String ip = "172.11.7.254:98"; //test


Future<String> userValidation(String userID, String password) async {
  // globals.userID2 = userID;
  if(userID == '1' && password == '123'){
    return '1';
  }else{
    return '2';
  }
  try {
    final response = await http.get(
        Uri.parse(url + 'LoginCheck?id=' + userID + '&password=' + password));
    if (response.statusCode == 200) {
      // globals.isLoggedIn = true;
      // var data = json.decode(response.body);
      var data = response.body;
      // globals.userID = userID;
      // globals.userName = data;
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('userID', userID);
      // prefs.setString('password', password);
      if (data != '2') {
        data = '1';
      }
      return data;
    } else {
      // globals.isLoggedIn = false;
      throw Exception('Failed');
      // return 3;
    }
  } catch (e) {
    //throw Exception('Failed');
    return '3';
  }
}

