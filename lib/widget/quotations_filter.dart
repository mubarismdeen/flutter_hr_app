import 'package:admin/constants/style.dart';
import 'package:admin/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../api.dart';
import '../models/clientDetails.dart';

class QuotationsFilter extends StatefulWidget {
  dynamic applyFilter;
  String selectedClientName;
  String selectedName;
  StatusEntity selectedPoStatus;
  StatusEntity selectedInvoiceStatus;
  StatusEntity selectedType;

  QuotationsFilter({
    Key? key,
    required this.applyFilter,
    required this.selectedClientName,
    required this.selectedName,
    required this.selectedPoStatus,
    required this.selectedInvoiceStatus,
    required this.selectedType,
  }) : super(key: key);

  @override
  State<QuotationsFilter> createState() => _QuotationsFilterState();
}

class _QuotationsFilterState extends State<QuotationsFilter> {
  final _formKey = GlobalKey<FormState>();

  var _name = TextEditingController();

  String _selectedClientName = '';
  String _selectedName = '';
  StatusEntity _selectedPoStatus = StatusEntity();
  StatusEntity _selectedInvoiceStatus = StatusEntity();
  StatusEntity _selectedType = StatusEntity();

  bool _showLoading = true;

  late List<StatusEntity> invoiceStatuses;
  late List<StatusEntity> poStatuses;
  late List<StatusEntity> types;
  List<ClientDetails> clients = <ClientDetails>[];

  @override
  void initState() {
    super.initState();
    _selectedClientName = widget.selectedClientName;
    _selectedName = widget.selectedName;
    _name.text = _selectedName;
    _selectedPoStatus = widget.selectedPoStatus;
    _selectedInvoiceStatus = widget.selectedInvoiceStatus;
    _selectedType = widget.selectedType;

    // Delay the initialization to ensure the widget has been fully initialized
    Future.delayed(Duration.zero, _initializeDropdownInputs);
  }

  Future<void> _initializeDropdownInputs() async {
    invoiceStatuses = addBlankOption(await getInvoiceStatus());
    poStatuses = addBlankOption(await getPoStatus());
    types = addBlankOption(await getQuotationType());
    clients = [
      ClientDetails(
          id: 0,
          name: '',
          address: '',
          mobile1: '',
          mobile2: '',
          editBy: '',
          editDt: DateTime.now(),
          creatBy: '',
          creatDt: DateTime.now()),
      ...await getClientDetails()
    ];

    setState(() {
      _showLoading = false;
    }); // Trigger rebuild after fetching data
    return null;
  }

  Future<void> _applyForm() async {
    _selectedName = _name.text;
    widget.applyFilter(_selectedClientName, _selectedName, _selectedPoStatus,
        _selectedInvoiceStatus, _selectedType);
    Navigator.of(context).pop();
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
                      decoration: const InputDecoration(labelText: 'Client'),
                      value: _selectedClientName.isNotEmpty
                          ? _selectedClientName
                          : null,
                      items: clients.map<DropdownMenuItem<String>>(
                          (ClientDetails client) {
                        return DropdownMenuItem<String>(
                          value: client.name,
                          child: Text(client.name),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedClientName = value ?? '';
                        });
                      }),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Vessel'),
                    controller: _name,
                    onSaved: (value) {},
                  ),
                  DropdownButtonFormField(
                      decoration: const InputDecoration(labelText: 'Type'),
                      value: _selectedType.description.isNotEmpty
                          ? _selectedType.description
                          : null,
                      items:
                          types.map<DropdownMenuItem<String>>((StatusEntity value) {
                        return DropdownMenuItem<String>(
                          value: value.description.toString(),
                          child: Text(value.description),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedType = types
                              .firstWhere((type) => type.description == value);
                        });
                      }),
                  DropdownButtonFormField(
                      decoration: const InputDecoration(labelText: 'PO Status'),
                      value: _selectedPoStatus.description.isNotEmpty
                          ? _selectedPoStatus.description
                          : null,
                      items: poStatuses.map<DropdownMenuItem<String>>(
                          (StatusEntity poStatus) {
                        return DropdownMenuItem<String>(
                          value: poStatus.description,
                          child: Text(poStatus.description),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedPoStatus = poStatuses.firstWhere(
                              (poStatus) => poStatus.description == value);
                        });
                      }),
                  DropdownButtonFormField(
                      decoration:
                          const InputDecoration(labelText: 'Invoice Status'),
                      value: _selectedInvoiceStatus.description.isNotEmpty
                          ? _selectedInvoiceStatus.description
                          : null,
                      items: invoiceStatuses.map<DropdownMenuItem<String>>(
                          (StatusEntity invStatus) {
                        return DropdownMenuItem<String>(
                          value: invStatus.description.toString(),
                          child: Text(invStatus.description),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedInvoiceStatus = invoiceStatuses.firstWhere(
                              (invStatus) => invStatus.description == value);
                        });
                      }),
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
