import 'package:admin/constants/style.dart';
import 'package:admin/models/clientDetails.dart';
import 'package:admin/models/empMaster.dart';
import 'package:admin/models/gratuityDetails.dart';
import 'package:admin/utils/common_utils.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

import '../api.dart';

class GratuityCalculateWidget extends StatefulWidget {
  List<EmpMaster> empDetails;
  List<Map<String, dynamic>> gratuityType;
  GratuityCalculateWidget(this.empDetails,this.gratuityType, {Key? key}) : super(key: key);

  @override
  _GratuityCalculateWidgetState createState() => _GratuityCalculateWidgetState();
}

class _GratuityCalculateWidgetState extends State<GratuityCalculateWidget> {
  final empCtrl = TextEditingController();
  late Map<String, dynamic> _selectedType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 70),
        child: Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          shadowColor: shadowColor,
          margin: const EdgeInsets.only(top: 20),
          child:Padding(
            padding: const EdgeInsets.all(8.0),
        child:SizedBox(
        width: 800,
        height: 50,
    child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
                const SizedBox(
                width: 160,
                height: 40,
                // child: dropDownField('Department'),
                child:Center(child:Text('Employee'))),
              SizedBox(
                width: 200,
                height: 40,
                // child: dropDownField('Department'),
                child: CustomDropdown.search(
                  hintText: 'Search',
                  items: widget.empDetails
                        .map<String>((EmpMaster employee) {
                    return employee.name;
                    }).toList(),
                  controller: empCtrl,
                  onChanged:(val) async {
                    // if (data != null) {
                    //   ticketFor = await api.getTicketFor(data.id);
                    // }
                      setState(() {});
                    }
                  // },
                )),
              // DropdownButtonFormField(
              //     validator: (value) {
              //       if (value == null) {
              //         return 'Please select client';
              //       }
              //       return null;
              //     },
              //     decoration: const InputDecoration(labelText: 'Client'),
              //     items: widget.gratuityType
              //         .map<DropdownMenuItem<String>>(
              //             (Map<String, dynamic> type) {
              //           return DropdownMenuItem<String>(
              //             value: type['description'],
              //             child: Text(type['description']),
              //           );
              //         }).toList(),
              //     onChanged: (String? value) {
              //       setState(() {
              //         _selectedType = widget.gratuityType.firstWhere((type) => type['description'] == value);
              //       });
              //     }),
            SizedBox(
                width: 160,
                height: 40,
                // child: dropDownField('Department'),
                child:
                ElevatedButton(
                  onPressed: () async {
                    var data = widget.empDetails.firstWhere((e) => e.name == empCtrl.text);
                    await saveGratuity(data.empCode.toString(),_selectedType['id'],'1');
                  },
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.calculate),
                      SizedBox(width: 8.0),
                      Text('Calculate'),
                    ],
                  ),
            )
            )]
          ),
        ),
      ),
    )));
  }
}
