import 'package:admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/style.dart';

class CustomMenuController extends GetxController{
  static CustomMenuController instance = Get.find();
  var activeItem = DashboardRoute.obs;
  var hoverItem = "".obs;

  changeActiveitemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName){
    if(!isActive(itemName)) hoverItem.value = itemName;
}

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName){
    switch(itemName){
      case OverViewPageRoute:
        return _customIcon(Icons.trending_up, itemName);
      case AttendanceRoute:
        return _customIcon(Icons.people_rounded, itemName);
      case DashboardRoute:
        return _customIcon(Icons.dashboard, itemName);
      case SalaryMasterRoute:
        return _customIcon(Icons.monetization_on_outlined, itemName);
      case SalaryPayoutRoute:
        return _customIcon(Icons.payments_outlined, itemName);
      case LeaveSalaryRoute:
        return _customIcon(Icons.account_balance_wallet_outlined, itemName);
      case AuthenticationPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName){
    if(isActive(itemName)) return Icon(icon, size: 22, color: darke,);

    return Icon(icon, color: isHovering(itemName) ? darke : lightGrey,);

  }
}