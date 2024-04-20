import 'package:admin/constants/style.dart';
import 'package:admin/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../api.dart';
import '../models/empMaster.dart';

class JobDetailsFilter extends StatefulWidget {
  dynamic applyFilter;
  StatusEntity selectedJobStatus;
  StatusEntity selectedAssignedTo;
  String selectedDueDate;

  JobDetailsFilter(
      {required this.applyFilter,
      required this.selectedAssignedTo,
      required this.selectedJobStatus,
      required this.selectedDueDate});

  @override
  State<JobDetailsFilter> createState() => _JobDetailsFilterState();
}

class _JobDetailsFilterState extends State<JobDetailsFilter> {
  final _formKey = GlobalKey<FormState>();

  final _dueDate = TextEditingController();

  StatusEntity _selectedJobStatus = StatusEntity();
  StatusEntity _selectedAssignedTo = StatusEntity();
  String _selectedDueDate = '';

  bool _showLoading = true;

  late List<StatusEntity> jobStatuses;
  late List<EmpMaster> assignedToOptions;

  getDropdownInputs() async {
    jobStatuses = await getJobStatuses();
    assignedToOptions = await getEmpDetails();
  }

  Future<void> _applyForm() async {
    _selectedDueDate = _dueDate.text;
    widget.applyFilter(
        _selectedJobStatus, _selectedAssignedTo, _selectedDueDate);
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    _selectedJobStatus = widget.selectedJobStatus;
    _selectedAssignedTo = widget.selectedAssignedTo;
    _selectedDueDate = widget.selectedDueDate;

    _dueDate.text = _selectedDueDate;

    _initializeDropdownInputs();
  }

  Future<void> _initializeDropdownInputs() async {
    jobStatuses = await getJobStatuses();
    assignedToOptions = await getEmpDetails();

    setState(() {
      _showLoading = false;
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return _showLoading
        ? const SizedBox(
            height: 200,
            child: SpinKitWave(
              color: themeColor,
              size: 30,
            ),
          )
        : Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField(
                      decoration:
                          const InputDecoration(labelText: 'Job Status'),
                      value: _selectedJobStatus.description.isNotEmpty
                          ? _selectedJobStatus.description
                          : null,
                      items: jobStatuses.map<DropdownMenuItem<String>>(
                          (StatusEntity jobStatus) {
                        return DropdownMenuItem<String>(
                          value: jobStatus.description,
                          child: Text(jobStatus.description),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedJobStatus = jobStatuses.firstWhere(
                              (jobStatus) => jobStatus.description == value);
                        });
                      }),
                  DropdownButtonFormField(
                      decoration:
                          const InputDecoration(labelText: 'Assigned To'),
                      value: _selectedAssignedTo.description.isNotEmpty
                          ? _selectedAssignedTo.description
                          : null,
                      items: assignedToOptions
                          .map<DropdownMenuItem<String>>((EmpMaster emp) {
                        return DropdownMenuItem<String>(
                          value: emp.name,
                          child: Text(emp.name),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedAssignedTo.id = assignedToOptions
                              .firstWhere((emp) => emp.name == value)
                              .id;
                          _selectedAssignedTo.description = value ?? '';
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
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColor,
                        ),
                        onPressed: _applyForm,
                        child: const Text('Apply'),
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
