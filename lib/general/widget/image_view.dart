import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final double? width, height;
  final Alignment alignment;
  final bool isProfile;

  const ImageView(
      {required this.url,
        required this.fit,
        this.height,
        this.width,
        required this.alignment,
        this.isProfile = false});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: const Center(
            child: CupertinoActivityIndicator(
              animating: true,
              radius: 11,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: fit,
      width: width,
      height: height,
      alignment: alignment,
    );
  }
}