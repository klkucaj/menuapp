import 'package:flutter/gestures.dart';

abstract class SwipeUpViewController {
  void dragUpdate(DragUpdateDetails details);

  void dragEnd(DragEndDetails details);
}
