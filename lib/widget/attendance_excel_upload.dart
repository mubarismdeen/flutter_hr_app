import 'dart:io';

import 'package:admin/api.dart';
import 'package:admin/constants/style.dart';
import 'package:admin/models/attendanceModel.dart';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AttendanceExcelUpload extends StatefulWidget {
  Function closeDialog;
  DateTime pickedDate;

  AttendanceExcelUpload(this.closeDialog, this.pickedDate);

  @override
  _AttendanceExcelUploadState createState() => _AttendanceExcelUploadState();
}

class _AttendanceExcelUploadState extends State<AttendanceExcelUpload> {
  List<AttendanceModel> _attendanceList = List<AttendanceModel>.empty();
  final _formKey = GlobalKey<FormState>();

  Future<String> pickExcelFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null) {
      return result.files.single.path!;
    } else {
      throw Exception('No file selected');
    }
  }

  List<List<dynamic>> readExcelData(String filePath) {
    var bytes = File(filePath).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);

    var sheet = excel.tables[excel.tables.keys.first];
    return sheet!.rows
        .map((row) => row.map((cell) => cell!.value).toList())
        .toList();
  }

  void _uploadFile() async {
    try {
      String filePath = await pickExcelFile();
      List<List<dynamic>> excelData = readExcelData(filePath);

      if (excelData.length > 1) {
        for (int i = 1; i < excelData.length; i++) {
          List<dynamic> rowData = excelData[i];
          if (i == 1) {
            _attendanceList = [
              AttendanceModel(
                  id: 0,
                  empCode: rowData[0].toInt(),
                  attendance: double.parse(rowData[2].toString()),
                  offdays: double.parse(rowData[3].toString()),
                  lop: double.parse(rowData[4].toString()),
                  novt: double.parse(rowData[5].toString()),
                  sovt: double.parse(rowData[6].toString()),
                  overseas: double.parse(rowData[7].toString()),
                  anchorage: double.parse(rowData[8].toString()),
                  date: DateFormat('yyyy-MM').format(widget.pickedDate),
                  editBy: 1,
                  editDt: DateTime.now(),
                  creatBy: 1,
                  creatDt: DateTime.now())
            ];
          } else {
            _attendanceList.add(AttendanceModel(
                id: 0,
                empCode: rowData[0].toInt(),
                attendance: double.parse(rowData[2].toString()),
                offdays: double.parse(rowData[3].toString()),
                lop: double.parse(rowData[4].toString()),
                novt: double.parse(rowData[5].toString()),
                sovt: double.parse(rowData[6].toString()),
                overseas: double.parse(rowData[7].toString()),
                anchorage: double.parse(rowData[8].toString()),
                date: DateFormat('yyyy-MM').format(widget.pickedDate),
                editBy: 1,
                editDt: DateTime.now(),
                creatBy: 1,
                creatDt: DateTime.now()));
          }
        }
      }
      bool status = await saveAttendance(_attendanceList);
      if (status) {
        Fluttertoast.showToast(
          msg: "Saved",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
          webPosition: "center",
          webShowClose: false,
        );
      }

      Navigator.pop(context);
      widget.closeDialog();
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0, top: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
              ),
              onPressed: _uploadFile,
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Select Excel File'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}