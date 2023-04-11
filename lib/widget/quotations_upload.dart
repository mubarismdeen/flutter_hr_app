import 'package:admin/constants/style.dart';
import 'package:admin/models/quotationDetails.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../api.dart';

class QuotationsUpload extends StatefulWidget {
  const QuotationsUpload({Key? key}) : super(key: key);

  @override
  State<QuotationsUpload> createState() => _QuotationsUploadState();
}
class _QuotationsUploadState extends State<QuotationsUpload> {

  final _formKey = GlobalKey<FormState>();

  var _quotation = TextEditingController();
  var _company = TextEditingController();
  var _state = TextEditingController();

  QuotationDetails _quotationDetails = QuotationDetails(id: 0, quotation: "", company: "", state: "", creatBy: "", creatDt: DateTime.now(), editBy: "", editDt: DateTime.now());

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      // Submit the form data to a backend API or do something else with it
      print('Submitted form data:');
      print('Name: $_quotation');
      print('Document: $_company');
      print('Due Date: $_state');
    }
    _quotationDetails.quotation = _quotation.text;
    _quotationDetails.company = _company.text;
    _quotationDetails.state = _state.text ;

    bool status = await saveQuotationDetails(_quotationDetails);
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
      _quotation.clear();

      _company.clear();

      _state.clear();

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
              decoration: const InputDecoration(labelText: 'Quotation'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter quotation';
                }
                return null;
              },
              controller: _quotation,
              onSaved: (value) {
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Company'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter company';
                }
                return null;
              },
              controller:_company,
              onSaved: (value) {
                // _preFixedMonthlySalary = double.parse(value!);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'State'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter state';
                }
                return null;
              },
              controller:_state ,
              onSaved: (value) {
                // _normalOvertimeRate = double.parse(value!);
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
