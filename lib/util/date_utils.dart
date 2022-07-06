import 'package:intl/intl.dart';

class MyDateUtils{
  static String chageDate(String date){
    DateFormat formater = new DateFormat("yyyy-MM-dd");
    var inputDate = formater.parse(date);
    var outputFormat = DateFormat('MMMM dd, yyyy');
    return outputFormat.format(inputDate);
  }
}