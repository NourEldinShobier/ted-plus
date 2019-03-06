import 'package:flutter/material.dart';
import '../core/core.module.dart';

part 'ripple-layout.widget.g.dart';

@widget
Widget rippleLayout({
  @required Icon child,
  @required GestureTapCallback onPress,
  @required BorderRadius borderRadius,
}) {
  return Material(
    clipBehavior: Clip.antiAlias,
    type: MaterialType.transparency,
    borderRadius: borderRadius,
    child: IconButton(
      onPressed: onPress,
      icon: child,
    ),
  );
}
