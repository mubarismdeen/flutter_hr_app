import 'dart:io';

import 'package:admin/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

class AttendanceExcelUpload extends StatefulWidget {
  @override
  _AttendanceExcelUploadState createState() => _AttendanceExcelUploadState();
}

class _AttendanceExcelUploadState extends State<AttendanceExcelUpload> {
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
    return sheet!.rows.map((row) => row.map((cell) => cell!.value).toList()).toList();
  }

  void _uploadFile() async {
    try {
      String filePath = await pickExcelFile();
      List<List<dynamic>> excelData = readExcelData(filePath);

      // Use the `excelData` list as needed
      print(excelData);
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

