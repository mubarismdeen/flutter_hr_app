import 'package:intl/intl.dart';

String getDateStringFromDateTime(DateTime dateTime){
  return DateFormat('yyyy-MM-dd').format(dateTime);
}