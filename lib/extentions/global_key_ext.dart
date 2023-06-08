import 'package:flutter/cupertino.dart';

extension GlobalKeyExt<T extends State<StatefulWidget>> on GlobalKey<T> {
  double get dy {
    final RenderBox? rb = currentContext?.findRenderObject() as RenderBox?;
    if (rb == null) return 0.0;
    return rb.localToGlobal(Offset.zero).dy;
  }
}
