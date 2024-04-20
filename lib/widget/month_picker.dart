import 'package:admin/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class MonthPicker extends StatefulWidget {
  DateTime pickedDate;
  void Function(DateTime newDate) onDateChange;

  MonthPicker(this.pickedDate, this.onDateChange);

  @override
  _MonthPickerState createState() => _MonthPickerState();
}

class _MonthPickerState extends State<MonthPicker> {
  DateTime picked = DateTime.now();

  void onCancel() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showMonthPicker(
          context: context,
          initialDate: widget.pickedDate,
          selectedMonthBackgroundColor: Colors.blue,
          backgroundColor: Colors.white,
          headerColor: themeColor,
          roundedCornersRadius: 10,
          cancelWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: themeColor, borderRadius: BorderRadius.circular(5)),
            child: const Text('CANCEL',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          confirmWidget:Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(5)),
            child: const Text('OK',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ).then((date) {
          if (date != null) {
            setState(() {
              picked = date;
              widget.onDateChange(picked);
            });
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('MMM-yyyy').format(picked),
              style:
                  const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
