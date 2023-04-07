import 'package:admin/constants/style.dart';
import 'package:flutter/material.dart';

class EmployeeSalaryForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String _employeeName = '';

  int _workingDays = 0;

  int _holidaysTaken = 0;

  int _overtimeHours = 0;

  double _netPayout = 0.0;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      // Submit the form data to a backend API or do something else with it
      print('Submitted form data:');
      print('Employee Name: $_employeeName');
      print('Working Days: $_workingDays');
      print('Holidays Taken: $_holidaysTaken');
      print('Overtime Hours: $_overtimeHours');
      print('Net Payout: $_netPayout');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Employee Name'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter employee name';
              }
              return null;
            },
            onSaved: (value) {
              _employeeName = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Working Days'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter working days';
              }
              if (int.tryParse(value) == null) {
                return 'Please enter a valid number';
              }
              return null;
            },
            onSaved: (value) {
              _workingDays = int.parse(value!);
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Holidays Taken'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter holidays taken';
              }
              if (int.tryParse(value) == null) {
                return 'Please enter a valid number';
              }
              return null;
            },
            onSaved: (value) {
              _holidaysTaken = int.parse(value!);
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Overtime Hours'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter overtime hours';
              }
              if (int.tryParse(value) == null) {
                return 'Please enter a valid number';
              }
              return null;
            },
            onSaved: (value) {
              _overtimeHours = int.parse(value!);
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Net Payout'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter net payout';
              }
              if (double.tryParse(value) == null) {
                return 'Please enter a valid number';
              }
              return null;
            },
            onSaved: (value) {
              _netPayout = double.parse(value!);
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
    );
  }
}
