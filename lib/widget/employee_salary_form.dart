import 'package:admin/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../api.dart';
import '../models/salaryMaster.dart';

class EmployeeSalaryForm extends StatefulWidget {
  const EmployeeSalaryForm({Key? key}) : super(key: key);

  @override
  State<EmployeeSalaryForm> createState() => _EmployeeSalaryFormState();
}
  class _EmployeeSalaryFormState extends State<EmployeeSalaryForm> {

  final _formKey = GlobalKey<FormState>();

  String _molIdNo = '';

  var _employeeId = TextEditingController();
  var _preFixedMonthlySalary = TextEditingController();
  var _normalOvertimeRate = TextEditingController();
  var _specialOvertimeRate = TextEditingController();
  var _overSeasRate = TextEditingController();
  var _anchorageRate = TextEditingController();


   SalaryMaster _salaryMaster = SalaryMaster( id: 0, empCode: 0, salary: 0, nOtr: 0, sOtr: 0, overseas: 0, anchorage: 0, editBy: 0, editDt: DateTime.now(), creatBy: 0, creatDt:  DateTime.now());

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      // Submit the form data to a backend API or do something else with it
      print('Submitted form data:');
      print('Employee ID: $_employeeId');
      print('MOL ID No: $_molIdNo');
      print('Pre-fixed Monthly Salary: $_preFixedMonthlySalary');
      print('Normal Overtime Rate: $_normalOvertimeRate');
      print('Special Overtime Rate: $_specialOvertimeRate');
      print('OverSeas Rate: $_overSeasRate');
      print('OverSeas Rate: $_anchorageRate');
    }
    _salaryMaster.empCode = int.parse(_employeeId.text);
    _salaryMaster.salary = double.parse(_preFixedMonthlySalary.text);
    _salaryMaster.nOtr = double.parse(_normalOvertimeRate.text) ;
    _salaryMaster.sOtr = double.parse(_specialOvertimeRate.text);
    _salaryMaster.overseas = double.parse(_overSeasRate.text);
    _salaryMaster.anchorage = double.parse(_anchorageRate.text);

    bool status = await saveSalaryMaster(_salaryMaster);
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
    _employeeId.clear();

      _molIdNo = '';

      _preFixedMonthlySalary.clear();

      _normalOvertimeRate.clear();

      _specialOvertimeRate.clear();

      _overSeasRate.clear();

      _anchorageRate.clear();

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
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Employee Id'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter employee name';
                }
                return null;
              },
              controller: _employeeId,
              onSaved: (value) {
                // _employeeId = int.parse(value!);
              },
            ),
            // TextFormField(
            //   decoration: InputDecoration(labelText: 'MOL ID No'),
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return 'Please enter MOL ID No';
            //     }
            //     return null;
            //   },
            //   onSaved: (value) {
            //     _molIdNo = value!;
            //   },
            // ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Pre-Fixed Monthly Salary'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter pre-fixed monthly salary';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
                controller:_preFixedMonthlySalary,
              onSaved: (value) {
                // _preFixedMonthlySalary = double.parse(value!);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Normal Overtime Rate'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Normal Overtime Rate';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              controller:_normalOvertimeRate ,
              onSaved: (value) {
                // _normalOvertimeRate = double.parse(value!);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Special Overtime Rate'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Special Overtime Rate';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              controller:_specialOvertimeRate ,
              onSaved: (value) {
                // _specialOvertimeRate = double.parse(value!);
              },
            ),
            TextFormField(
              controller: _overSeasRate,
              decoration: InputDecoration(labelText: 'Overseas Rate'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Overseas Rate';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              onSaved: (value) {
                // _overSeasRate = double.parse(value!);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Anchorage Rate'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Anchorage Rate';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              controller: _anchorageRate,
              onSaved: (value) {
                // _anchorageRate = double.parse(value!);
              },
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                  ),
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
