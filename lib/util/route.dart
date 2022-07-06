import 'package:flutter/material.dart';

extension MyRoute on BuildContext {

  void next(T, {Function? callBack}) async {
    var val = await Navigator.push(
      this,
      MaterialPageRoute(
        builder: (_) => T,
      ),
    );
    if (callBack != null) {
      callBack(val);
    }
  }

  void pushAndRemoveUntil(T) {
    Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(
          builder: (_) => T,
        ),
            (route) => false);
  }

  void back({String? val}) {
    Navigator.pop(this, val ?? "");
  }
}
