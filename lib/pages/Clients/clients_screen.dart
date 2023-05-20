import 'package:admin/api.dart';
import 'package:admin/constants/style.dart';
import 'package:admin/models/clientDetails.dart';
import 'package:admin/widget/client_details_form.dart';
import 'package:admin/widget/custom_alert_dialog.dart';
import 'package:admin/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';
import '../../widget/client_details.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({Key? key}) : super(key: key);

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  List<ClientDetails> _clientDetails = List<ClientDetails>.empty();

  getTableData() async {
    _clientDetails = await getClientDetails();
  }

  closeDialog() {
    setState(() {
      getTableData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: getTableData(),
        builder: (context, AsyncSnapshot<dynamic> _data) {
          return SingleChildScrollView(
            child: Column(children: [
              Obx(() => Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context)
                            ? 56
                            : 6,
                        left: 10),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 24,
                      weight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 35.0, top: 35.0),
                    child: _uploadButton(),
                  ),
                ],
              ),
              ClientDetailsWidget(_clientDetails),
            ]),
          );
        });
  }

  void _openDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog('Add New Client', ClientDetailsForm(closeDialog));
      },
    );
  }

  Widget _uploadButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        backgroundColor: themeColor,
      ),
      onPressed: _openDialog,
      child: const Text('Add Client',
          style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
