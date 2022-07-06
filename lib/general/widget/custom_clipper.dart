import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width, size.height/2)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class SlopeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(20.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(SlopeClipper oldClipper) => false;
}

class SingleSlopeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(20.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(SingleSlopeClipper oldClipper) => false;
}