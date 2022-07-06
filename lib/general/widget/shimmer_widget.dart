import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerWidget(
        {required double width, required double height, double radius = 7.0}) =>
    Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade300,
      direction: ShimmerDirection.ltr,
      enabled: true,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          width: width,
          height: height,
        ),
      ),
    );
