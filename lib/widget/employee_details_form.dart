import 'package:admin/constants/style.dart';
import 'package:admin/models/empMaster.dart';
import 'package:admin/models/saveEmployeeDetails.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../api.dart';

class EmployeeDetailsForm extends StatefulWidget {
  dynamic closeDialog;
  EmployeeDetailsForm(this.closeDialog, {Key? key}) : super(key: key);

  @override
  State<EmployeeDetailsForm> createState() => _EmployeeDetailsFormState();
}

class _EmployeeDetailsFormState extends State<EmployeeDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  var _empCode = TextEditingController();
  var _name = TextEditingController();
  var _mobile1 = TextEditingController();
  var _mobile2 = TextEditingController();
  var _dob = TextEditingController();
  var _joiningDate = TextEditingController();
  late Map<String, dynamic> _selectedDepartment;
  late Map<String, dynamic> _selectedNationality;
  late Map<String, dynamic> _selectedStatus;

  List<Map<String, dynamic>> departments = <Map<String, dynamic>>[];
  List<Map<String, dynamic>> nationalities = <Map<String, dynamic>>[];
  List<Map<String, dynamic>> statuses = <Map<String, dynamic>>[];
  List<EmpMaster> assignedToOptions = <EmpMaster>[];

  getDropdownInputs() async {
    departments = await getDeparments();
    nationalities = await getEmployeeNationalities();
    statuses = await getEmployeeStatuses();
    assignedToOptions = await getEmpDetails();
  }

  SaveEmployeeDetails _employeeDetails = SaveEmployeeDetails(
      id: 0,
      empCode: 0,
      name: '',
      mobile1: '',
      mobile2: '',
      depId: 0,
      statusId: 0,
      natianalityId: 0,
      joinDt: DateTime.now(),
      birthDt: DateTime.now(),
      editBy: 1,
      editDate: DateTime.now(),
      creatBy: 1,
      creatDate: DateTime.now());

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      // Submit the form data to a backend API or do something else with it
      print('Submitted form data:');
      print('Employee Code: $_empCode');
      print('Employee Name: $_name');
      print('Mobile 1: $_mobile1');
      print('Mobile 2: $_mobile2');
      print('Department ID: $_selectedDepartment');
      print('Status ID: $_selectedStatus');
      print('Nationality ID: $_selectedNationality');
      print('Date of Birth: $_dob');
      print('Date of Joining: $_joiningDate');
    }
    _employeeDetails.empCode = int.parse(_empCode.text);
    _employeeDetails.name = _name.text;
    _employeeDetails.mobile1 = _mobile1.text;
    _employeeDetails.mobile2 = _mobile2.text;
    _employeeDetails.depId = _selectedDepartment['id'];
    _employeeDetails.statusId = _selectedStatus['id'];
    _employeeDetails.natianalityId = _selectedNationality['id'];
    _employeeDetails.joinDt = DateTime.parse(_joiningDate.text);
    _employeeDetails.birthDt = DateTime.parse(_dob.text);

    bool status = await saveEmployeeDetails(_employeeDetails);
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
      _dob.clear();

      Navigator.pop(context);
      widget.closeDialog();

      setState(() {});
    } else {
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
    return FutureBuilder<dynamic>(
        future: getDropdownInputs(),
        builder: (context, AsyncSnapshot<dynamic> _data) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Employee Code'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter employee code';
                      }
                      return null;
                    },
                    controller: _empCode,
                    onSaved: (value) {},
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Employee Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter employee name';
                      }
                      return null;
                    },
                    controller: _name,
                    onSaved: (value) {},
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Mobile 1'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Mobile 1';
                      }
                      return null;
                    },
                    controller: _mobile1,
                    onSaved: (value) {},
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Mobile 2'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Mobile 2';
                      }
                      return null;
                    },
                    controller: _mobile2,
                    onSaved: (value) {},
                  ),
                  DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select department';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(labelText: 'Department'),
                      items: departments.map<DropdownMenuItem<String>>(
                          (Map<String, dynamic> department) {
                        return DropdownMenuItem<String>(
                          value: department['description'],
                          child: Text(department['description']),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedDepartment = departments.firstWhere(
                              (department) =>
                                  department['description'] == value);
                        });
                      }),
                  DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select status';
                        }
                        return null;
                      },
                      decoration:
                      const InputDecoration(labelText: 'Status'),
                      items: statuses.map<DropdownMenuItem<String>>(
                              (Map<String, dynamic> status) {
                            return DropdownMenuItem<String>(
                              value: status['description'],
                              child: Text(status['description']),
                            );
                          }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedStatus = statuses.firstWhere(
                                  (status) =>
                              status['description'] == value);
                        });
                      }),
                  DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select nationality';
                        }
                        return null;
                      },
                      decoration:
                      const InputDecoration(labelText: 'Nationality'),
                      items: nationalities.map<DropdownMenuItem<String>>(
                              (Map<String, dynamic> nationality) {
                            return DropdownMenuItem<String>(
                              value: nationality['description'],
                              child: Text(nationality['description']),
                            );
                          }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedNationality = nationalities.firstWhere(
                                  (nationality) =>
                              nationality['description'] == value);
                        });
                      }),
                  TextFormField(
                    controller: _dob,
                    decoration:
                        const InputDecoration(labelText: 'Date of Birth'),
                    onTap: () async {
                      DateTime? date = DateTime(1900);
                      FocusScope.of(context).requestFocus(FocusNode());
                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        _dob.text =
                            DateFormat('yyyy-MM-dd').format(date);
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select date of birth';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _joiningDate,
                    decoration:
                    const InputDecoration(labelText: 'Date of Joining'),
                    onTap: () async {
                      DateTime? date = DateTime(1900);
                      FocusScope.of(context).requestFocus(FocusNode());
                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        _joiningDate.text =
                            DateFormat('yyyy-MM-dd').format(date);
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select date of joining';
                      }
                      return null;
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
        });
  }
}
