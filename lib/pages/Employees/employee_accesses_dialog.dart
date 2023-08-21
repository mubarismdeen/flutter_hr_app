import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  late List<String> _selectedScreens;
  late String _selectedPrivilege;

  @override
  void initState() {
    super.initState();
    _selectedScreens = [];
    if (widget.employeeScreens.dashboard) _selectedScreens.add("Dashboard");
    if (widget.employeeScreens.employees) _selectedScreens.add("Employees");
    if (widget.employeeScreens.attendance) _selectedScreens.add("Attendance");
    if (widget.employeeScreens.salaryMaster) _selectedScreens.add("Salary Master");
    if (widget.employeeScreens.salaryPayout) _selectedScreens.add("Salary Payout");
    if (widget.employeeScreens.leaveSalary) _selectedScreens.add("Leave Salary");
    if (widget.employeeScreens.clients) _selectedScreens.add("Clients");
    if (widget.employeeScreens.gratuity) _selectedScreens.add("Gratuity");
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
    List<String> screens = [
      "Dashboard",
      "Employees",
      "Attendance",
      "Salary Master",
      "Salary Payout",
      "Leave Salary",
      "Clients",
      "Gratuity",
    ];

    List<Widget> checkboxes = screens.map((screen) {
      return CheckboxListTile(
        title: Text(
          screen,
          style: const TextStyle(fontSize: 13),
        ),
        value: _selectedScreens.contains(screen),
        onChanged: (value) {
          setState(() {
            if (value == true) {
              _selectedScreens.add(screen);
            } else {
              _selectedScreens.remove(screen);
            }
          });
        },
      );
    }).toList();

    return SingleChildScrollView(
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 5.0,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: checkboxes,
      ),
    );
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
}
