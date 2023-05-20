import 'package:admin/constants/style.dart';
import 'package:admin/models/clientDetails.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../api.dart';

class ClientDetailsForm extends StatefulWidget {
  dynamic closeDialog;
  ClientDetailsForm(this.closeDialog, {Key? key}) : super(key: key);

  @override
  State<ClientDetailsForm> createState() => _ClientDetailsFormState();
}

class _ClientDetailsFormState extends State<ClientDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  var _address = TextEditingController();
  var _name = TextEditingController();
  var _mobile1 = TextEditingController();
  var _mobile2 = TextEditingController();

  ClientDetails _clientDetails = ClientDetails(
      id: 0,
      name: '',
      address: '',
      mobile1: '',
      mobile2: '',
      editBy: 1,
      editDt: DateTime.now(),
      creatBy: 1,
      creatDt: DateTime.now());

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      // Submit the form data to a backend API or do something else with it
      print('Submitted form data:');
      print('Client Name: $_name');
      print('Address: $_address');
      print('Mobile 1: $_mobile1');
      print('Mobile 2: $_mobile2');
    }
    _clientDetails.name = _name.text;
    _clientDetails.address = _address.text;
    _clientDetails.mobile1 = _mobile1.text;
    _clientDetails.mobile2 = _mobile2.text;

    bool status = await saveClientDetails(_clientDetails);
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
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Client Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter client name';
                }
                return null;
              },
              controller: _name,
              onSaved: (value) {},
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Address'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter address';
                }
                return null;
              },
              controller: _address,
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
  }
}
