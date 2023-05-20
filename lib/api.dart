import 'dart:convert';

import 'package:admin/models/clientDetails.dart';
import 'package:admin/models/employeeDetails.dart';
import 'package:admin/models/jobDetails.dart';
import 'package:admin/models/leaveSalary.dart';
import 'package:admin/models/quotationDetails.dart';
import 'package:admin/models/salaryPaid.dart';
import 'package:admin/models/saveEmployeeDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'models/attedanceDto.dart';
import 'models/attendanceModel.dart';
import 'models/docDetails.dart';
import 'models/empMaster.dart';
import 'models/salaryMaster.dart';
import 'models/salaryMasterGet.dart';
import 'models/salaryPay.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
var url = 'http://192.168.0.134:5001/api/Notes/';
// String ip = "10.0.2.2:5001";
//  String ip = gip;
// String ip = "192.168.1.200:81";
//String ip = "192.168.1.127:5001";
String ip = "localhost:5001";
// String ip = "localhost:81";       // IIS
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
        Uri.parse('${url}userValidat?userCd=$userID&password=$password'));
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

Future<List<Map<String, dynamic>>> getDocType() async {
  try {
    final response = await http.get(
        Uri.parse("http://$ip/Hrms/getDocType"));
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

Future<List<Map<String, dynamic>>> getQuotationType() async {
  try {
    final response = await http.get(
        Uri.parse("http://$ip/Hrms/getQuotationType"));
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

Future<List<Map<String, dynamic>>> getPoStatus() async {
  try {
    final response = await http.get(
        Uri.parse("http://$ip/Hrms/getpoStatus"));
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

Future<List<Map<String, dynamic>>> getInvoiceStatus() async {
  try {
    final response = await http.get(
        Uri.parse("http://$ip/Hrms/getinvStatus"));
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

Future<List<Map<String, dynamic>>> getQuotationDetails() async {
  try {
    final response = await http.get(
        Uri.parse("http://$ip/Hrms/getQuotationDetails"));
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
    final response = await http.post(Uri.parse('http://$ip/Hrms/saveQuotation'),
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

Future<bool> saveAttendance(List<AttendanceModel> attendanceList) async {
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

Future<List<AttendanceDto>> getAttendanceDetails(String date) async {
  try {
    final response = await http
        .get(Uri.parse("http://$ip/Hrms/getAttendance?date=$date"));
    if (response.statusCode == 200) {
      List<AttendanceDto>? userMap = List<AttendanceDto>.empty();
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isNotEmpty) {
        userMap =
            jsonResponse.map((job) => AttendanceDto.fromJson(job)).cast<AttendanceDto>().toList();
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

Future<List<SalaryPay>> getSalaryPay(String date) async {
  try {
    final response = await http
        .get(Uri.parse("http://$ip/Hrms/getSalaryPay?date=$date"));
    if (response.statusCode == 200) {
      List<SalaryPay>? userMap = List<SalaryPay>.empty();
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isNotEmpty) {
        userMap =
            jsonResponse.map((job) => SalaryPay.fromJson(job)).cast<SalaryPay>().toList();
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

Future<List<SalaryMasterGet>> getSalaryMaster(String date) async {
  try {
    final response = await http
        .get(Uri.parse("http://$ip/Hrms/getSalary?date=$date"));
    if (response.statusCode == 200) {
      List<SalaryMasterGet>? userMap = List<SalaryMasterGet>.empty();
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isNotEmpty) {
        userMap =
            jsonResponse.map((job) => SalaryMasterGet.fromJson(job)).cast<SalaryMasterGet>().toList();
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

Future<List<EmployeeDetails>> getEmployeeDetails() async {
  try {
    final response = await http
        .get(Uri.parse("http://$ip/Hrms/getEmployeeDetails"));
    if (response.statusCode == 200) {
      List<EmployeeDetails>? userMap = List<EmployeeDetails>.empty();
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isNotEmpty) {
        userMap =
            jsonResponse.map((job) => EmployeeDetails.fromJson(job)).cast<EmployeeDetails>().toList();
      }
      return userMap;
    } else {
      throw Exception('Failed');
    }
  } catch (e) {
    throw Exception('Failed');
  }
}

Future<List<LeaveSalary>> getLeaveSalary(String year) async {
  try {
    final response = await http
        .get(Uri.parse("http://$ip/Hrms/getLeaveSalary?year=$year"));
    if (response.statusCode == 200) {
      List<LeaveSalary>? userMap = List<LeaveSalary>.empty();
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isNotEmpty) {
        userMap =
            jsonResponse.map((job) => LeaveSalary.fromJson(job)).cast<LeaveSalary>().toList();
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

Future<bool> saveSalaryPaid(SalaryPaid salaryPaid) async {
  try {
    var jsonData = jsonEncode(salaryPaid);
    final response = await http.post(Uri.parse('http://$ip/Hrms/saveSalaryPaid'),
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

Future<List<Map<String, dynamic>>> getJobDetails() async {
  try {
    final response = await http.get(
        Uri.parse("http://$ip/Hrms/getJobDetails"));
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

Future<bool> saveJobDetails(JobDetails jobDetails) async {
  try {
    var jsonData = jsonEncode(jobDetails);
    final response = await http.post(Uri.parse('http://$ip/Hrms/saveJobDetail'),
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

Future<bool> saveEmployeeDetails(SaveEmployeeDetails employeeDetails) async {
  try {
    var jsonData = jsonEncode(employeeDetails);
    final response = await http.post(Uri.parse('http://$ip/Hrms/saveEmployeeDetails'),
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

Future<List<Map<String, dynamic>>> getJobStatuses() async {
  try {
    final response = await http.get(
        Uri.parse("http://$ip/Hrms/getjobStatus"));
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

Future<List<Map<String, dynamic>>> getDeparments() async {
  try {
    final response = await http.get(
        Uri.parse("http://$ip/Hrms/getDeparments"));
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

Future<List<Map<String, dynamic>>> getEmployeeStatuses() async {
  try {
    final response = await http.get(
        Uri.parse("http://$ip/Hrms/getEmployeeStatuses"));
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

Future<List<Map<String, dynamic>>> getEmployeeNationalities() async {
  try {
    final response = await http.get(
        Uri.parse("http://$ip/Hrms/getEmployeeNationalities"));
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

Future<List<ClientDetails>> getClientDetails() async {
  try {
    final response = await http
        .get(Uri.parse("http://$ip/Hrms/getClientDetails"));
    if (response.statusCode == 200) {
      List<ClientDetails>? userMap = List<ClientDetails>.empty();
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isNotEmpty) {
        userMap =
            jsonResponse.map((job) => ClientDetails.fromJson(job)).cast<ClientDetails>().toList();
      }
      return userMap;
    } else {
      throw Exception('Failed');
    }
  } catch (e) {
    throw Exception('Failed');
  }
}

Future<bool> saveClientDetails(ClientDetails clientDetails) async {
  try {
    var jsonData = jsonEncode(clientDetails);
    final response = await http.post(Uri.parse('http://$ip/Hrms/saveClientDetails'),
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

