import 'package:flutter/material.dart';

class UtilValidate {

  static dynamic validateBasic(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  static dynamic validateDate(String? value) {
    if (value == "DD/MM/YYYY") {
      return "This field is required";
    }
    return null;
  }

  static dynamic validateDropDown(dynamic value) {
    if (value == null) {
      return "Select One";
    }
    return null;
  }

  static dynamic validatePhoneOrEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    } else {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(value.replaceAll(" ", "")) && !validatePhoneNumber(value)) {
        return "Enter your phone number";
      } else {
        return null;
      }
    }
  }

  static dynamic validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    } else {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return "Enter valid email";
      } else {
        return null;
      }
    }
  }

  static bool validatePhoneNumber(String p) {
    if (p.length < 3) {
      return false;
    } else {
      String phone = p.substring(0, 2) == ("09")
          ? p.substring(2)
          : p.substring(0, 3) == "+95"
          ? p.substring(3)
          : p;
      if (phone.length > 9 && phone.substring(0, 1) == ("9")) {
        phone = p.substring(1);
      } else if (phone.trim().length < 7) {
        return false;
      } else if (phone.length == 7) {
        if (!(phone.substring(0, 1) == ("5") ||
            phone.substring(0, 1) == ("2") ||
            phone.substring(0, 1) == ("8"))) {
          return false;
        }
      } else if (phone.length == 8) {
        if (!(phone.substring(0, 1) == ("3") ||
            phone.substring(0, 1) == ("4") ||
            phone.substring(0, 1) == ("8"))) {
          return false;
        }
      } else if (phone.length == 9) {
        if (!(phone.substring(0, 1) == ("6") ||
            phone.substring(0, 1) == ("7") ||
            phone.substring(0, 1) == ("9") ||
            phone.substring(0, 1) == ("2") ||
            phone.substring(0, 1) == ("4") ||
            phone.substring(0, 1) == ("8"))) {
          return false;
        }
      } else if (phone.length > 10) {
        return false;
      }
    }
    return true;
  }

  static void hideKeyboard(BuildContext context){
    FocusScope.of(context).unfocus();
  }
}
