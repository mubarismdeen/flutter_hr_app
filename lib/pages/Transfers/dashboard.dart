import 'package:admin/api.dart';
import 'package:admin/constants/privilege_constants.dart';
import 'package:admin/globalState.dart';
import 'package:admin/models/userPrivileges.dart';
import 'package:admin/utils/common_utils.dart';
import 'package:admin/widget/custom_text.dart';
import 'package:admin/widget/doc_expiry.dart';
import 'package:admin/widget/quotations_pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';
import '../../widget/job_details.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  List<Widget> screenList = [];

  initPageData() async {
    List<UserPrivileges> docScreenPrivileges = await getAPrivilegeForUser(
        GlobalState.username, documentDetailsScreenPrivilege);
    List<UserPrivileges> quotationScreenPrivileges = await getAPrivilegeForUser(
        GlobalState.username, quotationDetailsScreenPrivilege);
    List<UserPrivileges> jobScreenPrivileges = await getAPrivilegeForUser(
        GlobalState.username, jobDetailsScreenPrivilege);

    if (docScreenPrivileges.isNotEmpty &&
        getViewPrivilege(docScreenPrivileges.first)) {
      screenList.add(DocExpiry(docScreenPrivileges.first));
    }
    if (quotationScreenPrivileges.isNotEmpty &&
        getViewPrivilege(quotationScreenPrivileges.first)) {
      screenList.add(QuotationsPending(quotationScreenPrivileges.first));
    }
    if (jobScreenPrivileges.isNotEmpty &&
        getViewPrivilege(jobScreenPrivileges.first)) {
      screenList.add(JobDetailsWidget(jobScreenPrivileges.first));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: initPageData(),
      builder: (context, AsyncSnapshot<dynamic> _data) {
        return SingleChildScrollView(
          child: Column(
            children: [
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
              SizedBox(
                height: 450,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (screenList.isNotEmpty) Expanded(child: screenList[0]),
                    screenList.length > 1
                        ? Expanded(child: screenList[1])
                        : const Expanded(child: SizedBox(height: 1)),
                  ],
                ),
              ),
              if (screenList.length > 2)
                SizedBox(
                  height: 450,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: screenList[2]),
                      const Expanded(child: SizedBox(height: 1)),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
