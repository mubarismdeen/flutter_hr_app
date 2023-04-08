import 'package:admin/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlertDialog extends StatelessWidget {

  final String titleText;
  final Widget child;

  CustomAlertDialog(this.titleText, this.child);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titleText),
          const SizedBox(
            width: 35,
          ),
          TextButton(
            style: const ButtonStyle(alignment: Alignment.topRight),
            onPressed: () {
              navigator?.pop(context);
            },
            child: const Icon(
              Icons.clear,
              color: themeColor,
            ),
          ),
        ],
      ),
      content: child,
      insetPadding: const EdgeInsets.symmetric(horizontal: 100),
    );
  }
}
