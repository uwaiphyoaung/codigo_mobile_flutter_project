import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    alignment: Alignment.center,
    child: Center(
      child: SizedBox(
        width: 200,
        height: 25,
        child: SpinKitThreeBounce(
          color: Theme.of(context).primaryColor,
          size: 25,
        ),
      ),
    ),
  );
}