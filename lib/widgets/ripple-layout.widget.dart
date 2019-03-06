import 'package:flutter/material.dart';

class RippleLayout extends StatelessWidget {
  final Icon child;
  final GestureTapCallback onPress;
  final BorderRadius borderRadius;

  RippleLayout({
    Key key,
    @required this.child,
    @required this.onPress,
    @required this.borderRadius,
  }) : super(key: key);

  Widget build(BuildContext context) {
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
}
