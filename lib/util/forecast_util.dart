import 'package:intl/intl.dart';

class Util {
  static String appId = "9b8b2bff395044874183051e8b77842c";

  static String getFormattedDate (DateTime dateTime){
    return DateFormat("EEEE, MMMM d, y").format(dateTime);
  }
}