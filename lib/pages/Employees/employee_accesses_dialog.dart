import 'package:admin/api.dart';
import 'package:admin/globalState.dart';
import 'package:admin/utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/style.dart';
import '../../models/userDetails.dart';
import '../../models/userScreens.dart';
import '../../widget/custom_alert_dialog.dart';

class EmployeeAccessesDialog extends StatefulWidget {
  UserScreens userScreens;
  UserDetails? userDetails;
  String employeeName;
  String employeeCode;
  EmployeeAccessesDialog(
      {required this.userScreens,
      required this.employeeName,
      required this.employeeCode,
      required this.userDetails});

  @override
  State<EmployeeAccessesDialog> createState() => _EmployeeAccessesDialogState();
}

class _EmployeeAccessesDialogState extends State<EmployeeAccessesDialog> {
  late UserScreens _userScreens;
  late UserDetails _userDetails;
  late List<Screen> _selectedScreens;
  late String _selectedPrivilege;
  late bool _isProfileSet;

  var _username = TextEditingController();
  var _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _selectedScreens = [];
    _userScreens = widget.userScreens;
    _isProfileSet = widget.userDetails != null;
    if (_isProfileSet) {
      _userDetails = widget.userDetails!;
      _username.text = _userDetails.name;
      _password.text = _userDetails.password;
    } else {
      _userDetails = UserDetails(creatBy: GlobalState.userEmpCode, empCode: widget.employeeCode);
    }
    if (_userScreens.dashboard) _selectedScreens.add(Screen.dashboard);
    if (_userScreens.employees) _selectedScreens.add(Screen.employees);
    if (_userScreens.attendance) _selectedScreens.add(Screen.attendance);
    if (_userScreens.salaryMaster) _selectedScreens.add(Screen.salaryMaster);
    if (_userScreens.salaryPayout) _selectedScreens.add(Screen.salaryPayout);
    if (_userScreens.leaveSalary) _selectedScreens.add(Screen.leaveSalary);
    if (_userScreens.clients) _selectedScreens.add(Screen.clients);
    if (_userScreens.gratuity) _selectedScreens.add(Screen.gratuity);
    _selectedPrivilege = '';
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: "Set Privileges for ${widget.employeeName}",
      titleStyle: const TextStyle(fontWeight: FontWeight.w500),
      child: Container(
        // height: 200,
        child: SingleChildScrollView(
          child: DefaultTabController(
            length: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TabBar(
                  tabs: [
                    Tab(
                      child: Text("Profile",
                          style: TextStyle(color: themeColor, fontSize: 16)),
                    ),
                    Tab(
                      child: Text("Screens",
                          style: TextStyle(color: themeColor, fontSize: 16)),
                    ),
                    Tab(
                      child: Text("Privileges",
                          style: TextStyle(color: themeColor, fontSize: 16)),
                    ),
                  ],
                ),
                Container(
                  height: 300,
                  width: 400,
                  child: TabBarView(
                    children: [
                      _buildProfileTab(),
                      _buildScreensTab(),
                      _buildPrivilegesTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileTab() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!_isProfileSet)
            const Text(
              "User profile not set in the system",
              style: TextStyle(color: Colors.redAccent, fontSize: 13),
              textAlign: TextAlign.start,
            )
          else
            const SizedBox(width: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                  controller: _username,
                  onSaved: (value) {},
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  controller: _password,
                  onSaved: (value) {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...getActionButtonsWithoutPrivilege(
                  context: context, onSubmit: _onUserDetailsSubmit),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScreensTab() {
    if (!_isProfileSet) {
      return _getProfileNotSetMessage();
    }
    List<Widget> checkboxes = Screen.values.map((selectedScreen) {
      String screenName = selectedScreen.value;
      return CheckboxListTile(
        title: Text(
          screenName,
          style: const TextStyle(fontSize: 13),
        ),
        activeColor: Colors.blueAccent,
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 5.0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: checkboxes,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...getActionButtonsWithoutPrivilege(
                context: context, onSubmit: _onScreensSubmit),
          ],
        ),
      ],
    );
  }

  void _toggleValueForScreen(Screen screen) {
    switch (screen) {
      case Screen.dashboard:
        _userScreens.dashboard = !_userScreens.dashboard;
        break;
      case Screen.employees:
        _userScreens.employees = !_userScreens.employees;
        break;
      case Screen.attendance:
        _userScreens.attendance = !_userScreens.attendance;
        break;
      case Screen.salaryMaster:
        _userScreens.salaryMaster = !_userScreens.salaryMaster;
        break;
      case Screen.salaryPayout:
        _userScreens.salaryPayout = !_userScreens.salaryPayout;
        break;
      case Screen.leaveSalary:
        _userScreens.leaveSalary = !_userScreens.leaveSalary;
        break;
      case Screen.clients:
        _userScreens.clients = !_userScreens.clients;
        break;
      case Screen.gratuity:
        _userScreens.gratuity = !_userScreens.gratuity;
        break;
    }
  }

  Widget _buildPrivilegesTab() {
    if (!_isProfileSet) {
      return _getProfileNotSetMessage();
    }
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

  Future<void> _onUserDetailsSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      print('Submitted form data:');
      print('Username: $_username');
      print('Password: $_password');
    }
    _userDetails.name = _username.text;
    _userDetails.password = _password.text;
    _userDetails.editBy = GlobalState.userEmpCode;
    _userDetails.editDt = DateTime.now();

    bool status = await saveUserDetails(_userDetails);
    if (status) {
      showSaveSuccessfulMessage(context);
      _userDetails = (await getUserDetails(_userDetails.empCode)).first;
      setState(() {
        _userDetails;
        _isProfileSet = true;
      });
    } else {
      showSaveFailedMessage(context);
    }
  }

  Future<void> _onScreensSubmit() async {
    _userScreens.editBy = GlobalState.userEmpCode;
    _userScreens.editDt = DateTime.now();
    _userScreens.userId = _userDetails.userCd;

    bool status = await saveScreensForEmployee(_userScreens);
    if (status) {
      showSaveSuccessfulMessage(context);
      _userScreens = (await getScreensForEmployee(_userDetails.empCode)).first;
      setState(() {
        _userScreens;
      });
    } else {
      showSaveFailedMessage(context);
    }
  }

  Widget _getProfileNotSetMessage() {
    return const Center(
      child: Text(
        "User profile not set in the system. \nSet it first to enable this option",
        style: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}
