import 'package:admin/widget/custom_text.dart';
import 'package:admin/widget/doc_expiry.dart';
import 'package:admin/widget/quotations_pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';
import '../../widget/job_details.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Obx(() => Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6,
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
        SizedBox(height: 450,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: DocExpiry()),
              Expanded(child: QuotationsPending()),
            ],
          ),
        ),
        SizedBox(height: 450,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: JobDetailsWidget()),
              const Expanded(child: SizedBox(height: 1,),),
            ],
          ),
        )
      ]),
    );
  }
}
