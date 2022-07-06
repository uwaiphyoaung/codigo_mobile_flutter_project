import 'package:flutter/material.dart';

AppBar commonAppBar(BuildContext context, String title,
    {List<Widget>? actions,
      PreferredSizeWidget? bottom,
      bool hasLeading = true}) {
  return hasLeading
      ? AppBar(
    leading: backIcon(context),
    elevation: 0,
    title: Text(title),
    centerTitle: true,
    actions: actions,
    bottom: bottom,
  )
      : AppBar(
    elevation: 0,
    title: Text(title),
    actions: actions,
    centerTitle: true,
    bottom: bottom,
  );
}

Widget backIcon(context) {
  if (Navigator.canPop(context)) {
    return IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () => Navigator.pop(context));
  }
  return Container();
}
