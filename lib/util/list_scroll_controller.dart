import 'package:flutter/cupertino.dart';

class ListScrollController extends ScrollController {
  late bool _pause;

  bool get isPaused => _pause == true;

  @override
  bool get hasListeners {
    return super.hasListeners;
  }

  pause() => _pause = true;

  unPause() => _pause = false;

  ListScrollController() : super(initialScrollOffset: 0.0);
}