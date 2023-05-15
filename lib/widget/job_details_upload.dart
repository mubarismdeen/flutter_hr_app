import 'package:admin/constants/style.dart';
import 'package:admin/models/empMaster.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../api.dart';
import '../models/jobDetails.dart';

class JobDetailsUpload extends StatefulWidget {
  dynamic closeDialog;
  JobDetailsUpload(this.closeDialog, {Key? key}) : super(key: key);

  @override
  State<JobDetailsUpload> createState() => _JobDetailsUploadState();
}

class _JobDetailsUploadState extends State<JobDetailsUpload> {
  final _formKey = GlobalKey<FormState>();

  var _jobName = TextEditingController();
  var _narration = TextEditingController();
  var _assignedDate = TextEditingController();
  var _dueDate = TextEditingController();
  late EmpMaster _selectedAssignedTo;
  late Map<String, dynamic> _selectedJobStatus;

  List<Map<String, dynamic>> jobStatuses = <Map<String, dynamic>>[];
  List<EmpMaster> assignedToOptions = <EmpMaster>[];

  getDropdownInputs() async {
    jobStatuses = await getJobStatuses();
    assignedToOptions = await getEmpDetails();
  }

  JobDetails _jobDetails = JobDetails(
      id: 0,
      job: "",
      narration: "",
      assignedDate: "",
      jobStatus: 0,
      assignedTo: 0,
      dueDate: "",
      creatBy: 1,
      creatDt: DateTime.now(),
      editBy: 1,
      editDt: DateTime.now());

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      // Submit the form data to a backend API or do something else with it
      print('Submitted form data:');
      print('Client Name: $_jobName');
      print('Name: $_assignedDate');
      print('Narration: $_narration');
      print('PO Status: $_selectedAssignedTo');
      print('Type: $_selectedJobStatus');
      print('Due Date: $_dueDate');
    }
    _jobDetails.job = _jobName.text;
    _jobDetails.narration = _narration.text;
    _jobDetails.assignedTo = _selectedAssignedTo.id;
    _jobDetails.assignedDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(_assignedDate.text));
    _jobDetails.jobStatus = _selectedJobStatus['id'];
    _jobDetails.dueDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(_dueDate.text));

    bool status = await saveJobDetails(_jobDetails);
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
      _assignedDate.clear();

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
                    decoration: const InputDecoration(labelText: 'Job'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter client name';
                      }
                      return null;
                    },
                    controller: _jobName,
                    onSaved: (value) {},
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Narration'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter narration';
                      }
                      return null;
                    },
                    controller: _narration,
                    onSaved: (value) {},
                  ),
                  DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select assigned to';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Assigned To'),
                      items: assignedToOptions
                          .map<DropdownMenuItem<String>>((EmpMaster employee) {
                        return DropdownMenuItem<String>(
                          value: employee.name,
                          child: Text(employee.name),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedAssignedTo = assignedToOptions.firstWhere(
                                  (employee) => employee.name == value);
                        });
                      }),
                  TextFormField(
                    controller: _assignedDate,
                    decoration: const InputDecoration(labelText: 'Assigned Date'),
                    onTap: () async {
                      DateTime? date = DateTime(1900);
                      FocusScope.of(context).requestFocus(FocusNode());
                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        _assignedDate.text = DateFormat('yyyy-MM-dd').format(date);
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select assigned date';
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select job status';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Status'),
                      items: jobStatuses
                          .map<DropdownMenuItem<String>>((dynamic value) {
                        return DropdownMenuItem<String>(
                          value: value['description'].toString(),
                          child: Text(value['description']),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedJobStatus = jobStatuses.firstWhere(
                                  (jobStatus) => jobStatus['description'] == value);
                        });
                      }),
                  TextFormField(
                    controller: _dueDate,
                    decoration: const InputDecoration(labelText: 'Due Date'),
                    onTap: () async {
                      DateTime? date = DateTime(1900);
                      FocusScope.of(context).requestFocus(FocusNode());
                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        _dueDate.text = DateFormat('yyyy-MM-dd').format(date);
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select Due Date';
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
