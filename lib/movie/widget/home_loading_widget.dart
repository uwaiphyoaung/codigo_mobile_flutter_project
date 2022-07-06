import 'package:flutter/material.dart';
import '../../general/widget/shimmer_widget.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                  shimmerWidget(width: double.infinity, height: 50))),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              shimmerWidget(width: 50, height: 50),
              shimmerWidget(width: 50, height: 50),
              shimmerWidget(width: 50, height: 50),
              shimmerWidget(width: 50, height: 50),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}