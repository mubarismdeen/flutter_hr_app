import 'dart:convert';

import 'package:admin/models/quotationDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'models/attendance.dart';
import 'models/docDetails.dart';
import 'models/empMaster.dart';
import 'models/salaryMaster.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
var url = 'http://192.168.0.134:5001/api/Notes/';
// String ip = "10.0.2.2:5001";
//  String ip = gip;
// String ip = "192.168.1.200:81";
//String ip = "192.168.1.127:5001";
String ip = "localhost:5001";
// String ip = "172.11.7.254:88"; //live
//String ip = "172.11.7.254:98"; //test


Future<bool> userValidation(String userID, String password) async {
  // globals.userID2 = userID;
  // if(userID == '1' && password == '123'){
  //   return '1';
  // }else{
  //   return '2';
  // }
  try {
    final response = await http.get(
        Uri.parse(url + 'userValidat?userCd=' + userID + '&password=' + password));
    if (response.statusCode == 200) {
      // globals.isLoggedIn = true;
      // var data = json.decode(response.body);
      bool data = response.body as bool;
      // globals.userID = userID;
      // globals.userName = data;
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('userID', userID);
      // prefs.setString('password', password);
      // if (data != '2') {
      //   data = '1';
      // }
      return data;
    } else {
      // globals.isLoggedIn = false;
      throw Exception('Failed');
      // return 3;
    }
  } catch (e) {
    //throw Exception('Failed');
    return false;
  }
}

Future<bool> userValidate(String userID, String password) async {
  try {
    final response = await http.get(Uri.parse(
        "http://$ip/Hrms/userValidat?userCd=$userID&password=$password"));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      // var userMap =
      // jsonResponse.map((job) => new UserDetails.fromJson(job)).toList();
      // globals.showLoading = false;
      // userAbbr = userMap[0].abbr;

      // bool data = response.body as bool;
      // if (jsonResponse) {
      //   return false;
      // }
      return jsonResponse;
    } else {
      throw Exception('Failed');
    }
  } catch (e) {
    // Get.to(ErrorPage());
    throw Exception('Failed');
  }

}

Future<List<DocDetails>> getDocumentDetails() async {
  try {
    final response = await http
        .get(Uri.parse("http://$ip/Hrms/getDocDetails"));
    if (response.statusCode == 200) {
      List<DocDetails> userMap = DocDetails.toJson() as List<DocDetails>;
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isNotEmpty) {
        userMap =
            jsonResponse.map((job) => DocDetails.fromJson(job)).toList();
      }
      return userMap;
    } else {
      // globals.show = false;
      // globals.showLoading = false;
      throw Exception('Failed');
    }
  } catch (e) {
    // Get.to(ErrorPage());
    // globals.showLoading = false;
    // globals.show = false;
    throw Exception('Failed');
  }
}

Future<List<Map<String, dynamic>>> getDocDetails() async {
  try {
    final response = await http.get(
        Uri.parse("http://$ip/Hrms/getDocDetails"));
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> list = (jsonDecode(response.body) as List)
          .map((dynamic e) => e as Map<String, dynamic>)
          .toList();
      return list;
    } else {
      throw Exception('Failed');
    }
  } catch (e) {
    throw Exception('Failed');
  }
}

Future<bool> saveSalaryMaster(SalaryMaster salaryMaster) async {
  try {
    var jsonData = jsonEncode(salaryMaster);
    final response = await http.post(Uri.parse('http://$ip/Hrms/saveSalaryMaster'),
        headers: {"Content-Type": "application/json"}, body: jsonData);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed');
    }

  } catch (e) {
    return false;
  }
}

Future<bool> saveDocDetails(DocDetails docDetails) async {
  try {
    var jsonData = jsonEncode(docDetails);
    final response = await http.post(Uri.parse('http://$ip/Hrms/saveDocDetails'),
        headers: {"Content-Type": "application/json"}, body: jsonData);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed');
    }

  } catch (e) {
    return false;
  }
}

Future<bool> saveQuotationDetails(QuotationDetails quotationDetails) async {
  try {
    var jsonData = jsonEncode(quotationDetails);
    final response = await http.post(Uri.parse('http://$ip/Hrms/saveQuotationDetails'),
        headers: {"Content-Type": "application/json"}, body: jsonData);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed');
    }

  } catch (e) {
    return false;
  }
}

Future<bool> saveAttendance(List<Attendance> attendanceList) async {
  try {
    var jsonData = jsonEncode(attendanceList);
    final response = await http.post(Uri.parse('http://$ip/Hrms/saveAttendance'),
        headers: {"Content-Type": "application/json"}, body: jsonData);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed');
    }
  } catch (e) {
    return false;
  }
}


Future<List<EmpMaster>> getEmpDetails() async {
  try {
    final response = await http
        .get(Uri.parse("http://$ip/Hrms/getEmpDetails"));
    if (response.statusCode == 200) {
      List<EmpMaster> userMap = List<EmpMaster>.empty();
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isNotEmpty) {
        userMap =
            jsonResponse.map((job) => EmpMaster.fromJson(job)).toList();
      }
      return userMap;
    } else {
      // globals.show = false;
      // globals.showLoading = false;
      throw Exception('Failed');
    }
  } catch (e) {
    // Get.to(ErrorPage());
    // globals.showLoading = false;
    // globals.show = false;
    throw Exception('Failed');
  }
}