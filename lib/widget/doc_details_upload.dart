import 'package:admin/constants/style.dart';
import 'package:admin/models/docDetails.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../api.dart';

class DocDetailsUpload extends StatefulWidget {
  const DocDetailsUpload({Key? key}) : super(key: key);

  @override
  State<DocDetailsUpload> createState() => _DocDetailsUploadState();
}
class _DocDetailsUploadState extends State<DocDetailsUpload> {

  final _formKey = GlobalKey<FormState>();

  var _narration = TextEditingController();
  var _document = TextEditingController();
  var _dueDate = TextEditingController();
  var _renewedDate = TextEditingController();


  DocDetails _docDetails = DocDetails(id: 0, narration: "", docType: "", dueDate: DateTime.now(), renewedDate: DateTime.now(), creatBy: "", creatDt: DateTime.now(), editBy: "", editDt: DateTime.now());

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      // Submit the form data to a backend API or do something else with it
      print('Submitted form data:');
      print('Name: $_narration');
      print('Document: $_document');
      print('Due Date: $_dueDate');
      print('Renewed Date: $_renewedDate');
    }
    _docDetails.narration = _narration.text;
    _docDetails.docType = _document.text;
    _docDetails.dueDate = DateTime.parse(_dueDate.text) ;
    _docDetails.renewedDate = DateTime.parse(_renewedDate.text);

    bool status = await saveDocDetails(_docDetails);
    if( status){
      Fluttertoast.showToast(
        msg: "Saved",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
        webPosition :"center",
        webShowClose :false,
      );
      _narration.clear();

      _document.clear();

      _dueDate.clear();

      _renewedDate.clear();

      setState(() {  });
      // _salaryMaster = SalaryMaster as SalaryMaster;
    }else{
      Get.showSnackbar(
        const GetSnackBar(
          title: "failed to save",
          message: '',
          icon: Icon(Icons.refresh),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter name';
                }
                return null;
              },
              controller: _narration,
              onSaved: (value) {
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Document Type'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter document type';
                }
                return null;
              },
              controller:_document,
              onSaved: (value) {
                // _preFixedMonthlySalary = double.parse(value!);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Due Date'),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Due Date';
                }
                if (DateTime.tryParse(value) == null) {
                  return 'Please enter a valid date';
                }
                return null;
              },
              controller:_dueDate ,
              onSaved: (value) {
                // _normalOvertimeRate = double.parse(value!);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Renewed Date'),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Renewed Date';
                }
                if (DateTime.tryParse(value) == null) {
                  return 'Please enter a valid date';
                }
                return null;
              },
              controller:_renewedDate ,
              onSaved: (value) {
                // _specialOvertimeRate = double.parse(value!);
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                  ),
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
