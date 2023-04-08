import 'package:admin/constants/style.dart';
import 'package:flutter/material.dart';

class EmployeeSalaryForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String _employeeId = '';

  String _molIdNo = '';

  double _preFixedMonthlySalary = 0;

  double _normalOvertimeRate = 0;

  double _specialOvertimeRate = 0;

  double _overSeasRate = 0.0;

  double _anchorageRate = 0.0;

  void _submitForm() {
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
              onSaved: (value) {
                _employeeId = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'MOL ID No'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter MOL ID No';
                }
                return null;
              },
              onSaved: (value) {
                _molIdNo = value!;
              },
            ),
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
              onSaved: (value) {
                _preFixedMonthlySalary = double.parse(value!);
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
              onSaved: (value) {
                _normalOvertimeRate = double.parse(value!);
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
              onSaved: (value) {
                _specialOvertimeRate = double.parse(value!);
              },
            ),
            TextFormField(
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
                _overSeasRate = double.parse(value!);
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
              onSaved: (value) {
                _anchorageRate = double.parse(value!);
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
