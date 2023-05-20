import 'package:admin/constants/style.dart';
import 'package:admin/models/docDetails.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../api.dart';

class DocDetailsUpload extends StatefulWidget {
  dynamic closeDialog;
  DocDetailsUpload(this.closeDialog, {Key? key}) : super(key: key);

  @override
  State<DocDetailsUpload> createState() => _DocDetailsUploadState();
}

class _DocDetailsUploadState extends State<DocDetailsUpload> {
  final _formKey = GlobalKey<FormState>();

  var _narration = TextEditingController();
  var _document = TextEditingController();
  var _dueDate = TextEditingController();
  var _renewedDate = TextEditingController();
  late Map<String, dynamic> _selectedDocType;

  List<Map<String, dynamic>> docTypes = <Map<String, dynamic>>[];

  _DocDetailsUploadState();

  getDocTypes() async {
    docTypes = await getDocType();
  }

  DocDetails _docDetails = DocDetails(
      id: 0,
      narration: "",
      empCode: 1,
      docid: 0,
      dueDate: DateTime.now(),
      renewedDate: DateTime.now(),
      creatBy: 1,
      creatDt: DateTime.now(),
      editBy: 1,
      editDt: DateTime.now()
  );

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      // Submit the form data to a backend API or do something else with it
      print('Submitted form data:');
      print('Name: $_narration');
      print('Document: $_document');
      print('Due Date: $_dueDate');
      print('Renewed Date: $_renewedDate');
    }
    _docDetails.narration = _narration.text;
    // _docDetails.docid = _document.text;
    _docDetails.dueDate = DateTime.parse(_dueDate.text);
    _docDetails.renewedDate = DateTime.parse(_renewedDate.text);
    _docDetails.docid = _selectedDocType['id'];

    bool status = await saveDocDetails(_docDetails);
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
      _narration.clear();

      _document.clear();

      _dueDate.clear();

      _renewedDate.clear();

      Navigator.pop(context);
      widget.closeDialog();

      setState(() {});
      // _salaryMaster = SalaryMaster as SalaryMaster;
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
        future: getDocTypes(),
        builder: (context, AsyncSnapshot<dynamic> _data) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                    controller: _narration,
                    onSaved: (value) {},
                  ),
                  DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select document type';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Doc Type'),
                      items: docTypes
                          .map<DropdownMenuItem<String>>((dynamic value) {
                        return DropdownMenuItem<String>(
                          value: value['description'].toString(),
                          child: Text(value['description']),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          // _selectedDocType = value!;
                          _selectedDocType = docTypes.firstWhere((docType) => docType['description'] == value);
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
                      if(value!.isEmpty) {
                        return 'Please select Due Date';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _renewedDate,
                    decoration:
                        const InputDecoration(labelText: 'Renewed Date'),
                    onTap: () async {
                      DateTime? date = DateTime(1900);
                      FocusScope.of(context).requestFocus(FocusNode());
                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        _renewedDate.text =
                            DateFormat('yyyy-MM-dd').format(date);
                      }
                    },
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'Please select Renewed Date';
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
