import 'package:admin/api.dart';
import 'package:admin/globalState.dart';
import 'package:admin/utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/style.dart';
import '../../models/userScreens.dart';
import '../../widget/custom_alert_dialog.dart';

class EmployeeAccessesDialog extends StatefulWidget {
  UserScreens employeeScreens;
  String employeeName;
  EmployeeAccessesDialog(this.employeeScreens, this.employeeName, {Key? key}) : super(key: key);

  @override
  State<EmployeeAccessesDialog> createState() => _EmployeeAccessesDialogState();
}

class _EmployeeAccessesDialogState extends State<EmployeeAccessesDialog> {
  late UserScreens _screensForEmployee;
  late List<Screen> _selectedScreens;
  late String _selectedPrivilege;

  @override
  void initState() {
    super.initState();
    _selectedScreens = [];
    _screensForEmployee = widget.employeeScreens;
    if (_screensForEmployee.dashboard) _selectedScreens.add(Screen.Dashboard);
    if (_screensForEmployee.employees) _selectedScreens.add(Screen.Employees);
    if (_screensForEmployee.attendance) _selectedScreens.add(Screen.Attendance);
    if (_screensForEmployee.salaryMaster) _selectedScreens.add(Screen.SalaryMaster);
    if (_screensForEmployee.salaryPayout) _selectedScreens.add(Screen.SalaryPayout);
    if (_screensForEmployee.leaveSalary) _selectedScreens.add(Screen.LeaveSalary);
    if (_screensForEmployee.clients) _selectedScreens.add(Screen.Clients);
    if (_screensForEmployee.gratuity) _selectedScreens.add(Screen.Gratuity);
    _selectedPrivilege = '';
  }


  @override
  Widget build(BuildContext context) {
          return CustomAlertDialog(
            title: "Set Privileges for ${widget.employeeName}",
            titleStyle: const TextStyle(fontWeight: FontWeight.w500),
            child: Container(
              // height: 200,
              child: DefaultTabController(
                length: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(
                          child: Text("Screens",
                              style:
                                  TextStyle(color: themeColor, fontSize: 16)),
                        ),
                        Tab(
                          child: Text("Privileges",
                              style:
                                  TextStyle(color: themeColor, fontSize: 16)),
                        ),
                      ],
                    ),
                    Container(
                      height: 400,
                      width: 400,
                      child: TabBarView(
                        children: [
                          _buildScreensTab(),
                          _buildPrivilegesTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Widget _buildScreensTab() {

    List<Widget> checkboxes = Screen.values.map((selectedScreen) {
      String screenName = selectedScreen.value;
      return CheckboxListTile(
        title: Text(
          screenName,
          style: const TextStyle(fontSize: 13),
        ),
        value: _selectedScreens.contains(selectedScreen),
        onChanged: (value) {
          setState(() {
            if (value == true) {
              _selectedScreens.add(selectedScreen);
              _toggleValueForScreen(selectedScreen);
            } else {
              _selectedScreens.remove(selectedScreen);
              _toggleValueForScreen(selectedScreen);
            }
          });
        },
      );
    }).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SingleChildScrollView(
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            childAspectRatio: 5.0,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: checkboxes,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...getActionButtonsWithoutPrivilege(context: context, onSubmit: _onSubmit),
          ],
        ),
      ],
    );
  }

  void _toggleValueForScreen(Screen screen) {
    switch (screen) {
      case Screen.Dashboard:
        _screensForEmployee.dashboard = !_screensForEmployee.dashboard;
        break;
      case Screen.Employees:
        _screensForEmployee.employees = !_screensForEmployee.employees;
        break;
      case Screen.Attendance:
        _screensForEmployee.attendance = !_screensForEmployee.attendance;
        break;
      case Screen.SalaryMaster:
        _screensForEmployee.salaryMaster = !_screensForEmployee.salaryMaster;
        break;
      case Screen.SalaryPayout:
        _screensForEmployee.salaryPayout = !_screensForEmployee.salaryPayout;
        break;
      case Screen.LeaveSalary:
        _screensForEmployee.leaveSalary = !_screensForEmployee.leaveSalary;
        break;
      case Screen.Clients:
        _screensForEmployee.clients = !_screensForEmployee.clients;
        break;
      case Screen.Gratuity:
        _screensForEmployee.gratuity = !_screensForEmployee.gratuity;
        break;
    }
  }

  Widget _buildPrivilegesTab() {
    List<String> privilegeOptions = [
      "",
      "Document Details",
      "Job Details",
      "Quotation Details",
      "Client Details",
    ];

    return Column(
      children: [
        DropdownButton<String>(
          items: privilegeOptions.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),

          onChanged: (value) =>
              setState(() => _selectedPrivilege = value.toString()),
          // onChanged: (String selectedOption) {
          //   setState(() {
          //     _selectedPrivilege = selectedOption;
          //   });
          // },
          value: _selectedPrivilege,
        ),
        DataTable(
          columns: [
            const DataColumn(label: Text("Privilege")),
            const DataColumn(label: Text("View")),
            const DataColumn(label: Text("Add")),
            const DataColumn(label: Text("Edit")),
            const DataColumn(label: Text("Delete")),
          ],
          rows: _buildPrivilegeRows(),
        ),
      ],
    );
  }

  List<DataRow> _buildPrivilegeRows() {
    // Create privilege rows based on selected option
    if (_selectedPrivilege == null) {
      return [];
    }

    List<String> privileges = ["View", "Add", "Edit", "Delete"];

    return privileges.map((privilege) {
      return DataRow(
        cells: [
          DataCell(Text(_selectedPrivilege)),
          DataCell(Text(privilege == "View" ? "true" : "false")),
          const DataCell(Text("false")),
          const DataCell(Text("false")),
          const DataCell(Text("false")),
        ],
      );
    }).toList();
  }

  Future<void> _onSubmit() async {
    _screensForEmployee.editBy = GlobalState.userEmpCode;
    _screensForEmployee.editDt = DateTime.now();

    bool status = await saveScreensForEmployee(_screensForEmployee);
    if (status) {
      showSaveSuccessfulMessage(context);
      Navigator.pop(context);
      setState(() {});
    } else {
      showSaveFailedMessage(context);
    }
    // if (_formKey.currentState!.validate()) {
    //   _formKey.currentState?.save();
    //   // Submit the form data to a backend API or do something else with it
    //   print('Submitted form data:');
    //   print('Employee Code: $_empCode');
    //   print('Employee Name: $_name');
    //   print('Mobile 1: $_mobile1');
    //   print('Mobile 2: $_mobile2');
    //   print('Department ID: $_selectedDepartment');
    //   print('Status ID: $_selectedStatus');
    //   print('Nationality ID: $_selectedNationality');
    //   print('Date of Birth: $_dob');
    //   print('Date of Joining: $_joiningDate');
    // }
    // _employeeDetails.empCode = _empCode.text;
    // _employeeDetails.name = _name.text;
    // _employeeDetails.mobile1 = _mobile1.text;
    // _employeeDetails.mobile2 = _mobile2.text;
    // _employeeDetails.depId = _selectedDepartment['id'];
    // _employeeDetails.statusId = _selectedStatus['id'];
    // _employeeDetails.natianalityId = _selectedNationality['id'];
    // _employeeDetails.joinDt = DateTime.parse(_joiningDate.text);
    // _employeeDetails.birthDt = DateTime.parse(_dob.text);
    //
    // bool status = await saveEmployeeDetails(_employeeDetails);
    // if (status) {
    //   showSaveSuccessfulMessage(context);
    //   _dob.clear();
    //   Navigator.pop(context);
    //   widget.closeDialog();
    //   setState(() {});
    // } else {
    //   showSaveFailedMessage(context);
    // }
  }

}
