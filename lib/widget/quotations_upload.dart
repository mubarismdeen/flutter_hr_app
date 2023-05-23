import 'package:admin/constants/style.dart';
import 'package:admin/models/quotationDetails.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../api.dart';
import '../models/clientDetails.dart';

class QuotationsUpload extends StatefulWidget {
  dynamic closeDialog;
  QuotationsUpload(this.closeDialog, {Key? key}) : super(key: key);

  @override
  State<QuotationsUpload> createState() => _QuotationsUploadState();
}

class _QuotationsUploadState extends State<QuotationsUpload> {
  final _formKey = GlobalKey<FormState>();

  var _name = TextEditingController();
  var _narration = TextEditingController();
  var _invocieNo = TextEditingController();
  var _poNo = TextEditingController();
  var _poRefNo = TextEditingController();
  var _reportNo = TextEditingController();
  var _invoiceAmt = TextEditingController();
  var _dueDate = TextEditingController();
  late Map<String, dynamic> _selectedInvStatus;
  late Map<String, dynamic> _selectedPoStatus;
  late Map<String, dynamic> _selectedType;
  late ClientDetails _selectedClient;

  List<Map<String, dynamic>> invoiceStatuses = <Map<String, dynamic>>[];
  List<Map<String, dynamic>> poStatuses = <Map<String, dynamic>>[];
  List<Map<String, dynamic>> types = <Map<String, dynamic>>[];
  List<ClientDetails> clients = <ClientDetails>[];

  getDropdownInputs() async {
    invoiceStatuses = await getInvoiceStatus();
    poStatuses = await getPoStatus();
    types = await getQuotationType();
    clients = await getClientDetails();
  }


  QuotationDetails _quotationDetails = QuotationDetails(
      id: 0,
      clientId: 0,
      narration: "",
      name: "",
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      invoiceNo: 0,
      invoiceAmt : 0,
      poNo : 0,
      poRefNo : 0,
      reportNo : 0,
      poStatus: 0,
      invStatus: 0,
      type: 0,
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
      print('Client Name: ${_selectedClient.id}');
      print('Name: $_name');
      print('Narration: $_narration');
      print('Invoice No: $_invocieNo');
      print('PO Status: ${_selectedPoStatus['id']}');
      print('Invoice Status: ${_selectedInvStatus['id']}');
      print('Type: ${_selectedType['id']}');
      print('Due Date: $_dueDate');
    }
    _quotationDetails.clientId = _selectedClient.id;
    _quotationDetails.name = _name.text;
    _quotationDetails.narration = _narration.text;
    _quotationDetails.invoiceNo = int.parse(_invocieNo.text);
    _quotationDetails.poNo = int.parse(_poNo.text);
    _quotationDetails.poRefNo = int.parse(_poRefNo.text);
    _quotationDetails.reportNo = int.parse(_reportNo.text);
    _quotationDetails.invoiceAmt = double.parse(_invoiceAmt.text);
    _quotationDetails.poStatus = _selectedPoStatus['id'];
    _quotationDetails.invStatus = _selectedInvStatus['id'];
      _quotationDetails.type = _selectedType['id'];
    _quotationDetails.dueDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(_dueDate.text));

    bool status = await saveQuotationDetails(_quotationDetails);
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
      _name.clear();

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
                  DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select client';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Client'),
                      items: clients
                          .map<DropdownMenuItem<String>>((ClientDetails client) {
                        return DropdownMenuItem<String>(
                          value: client.name,
                          child: Text(client.name),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedClient = clients.firstWhere((client) => client.name == value);
                        });
                      }),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'vessel'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter vessel';
                      }
                      return null;
                    },
                    controller: _name,
                    onSaved: (value) {},
                  ),
                  DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select quotation type';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Quotation Type'),
                      items: types
                          .map<DropdownMenuItem<String>>((dynamic value) {
                        return DropdownMenuItem<String>(
                          value: value['description'].toString(),
                          child: Text(value['description']),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedType = types.firstWhere((type) => type['description'] == value);
                        });
                      }),
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
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Report Number'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Report number';
                      }
                      return null;
                    },
                    controller: _reportNo,
                    onSaved: (value) {},
                  ),
                  DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select PO status';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'PO Status'),
                      items: poStatuses
                          .map<DropdownMenuItem<String>>((dynamic value) {
                        return DropdownMenuItem<String>(
                          value: value['description'].toString(),
                          child: Text(value['description']),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedPoStatus = poStatuses.firstWhere((poStatus) => poStatus['description'] == value);
                        });
                      }),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'PO Number'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter invoice number';
                      }
                      return null;
                    },
                    controller: _poNo,
                    onSaved: (value) {},
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'PO Ref Number'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter invoice number';
                      }
                      return null;
                    },
                    controller: _poRefNo,
                    onSaved: (value) {},
                  ),
                  DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select invoice status';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Invoice Status'),
                      items: invoiceStatuses
                          .map<DropdownMenuItem<String>>((dynamic value) {
                        return DropdownMenuItem<String>(
                          value: value['description'].toString(),
                          child: Text(value['description']),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedInvStatus = invoiceStatuses.firstWhere((invStatus) => invStatus['description'] == value);
                        });
                      }),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Invoice Number'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter invoice number';
                      }
                      return null;
                    },
                    controller: _invocieNo,
                    onSaved: (value) {},
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Invoice Amount'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter invoice Amount';
                      }
                      return null;
                    },
                    controller: _invoiceAmt,
                    onSaved: (value) {},
                  ),
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
