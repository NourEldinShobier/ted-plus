import 'package:flutter/material.dart';

class RippleLayout extends StatelessWidget {
  final Icon child;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;

  RippleLayout({
    Key key,
    @required this.child,
    @required this.onPressed,
    @required this.borderRadius,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      type: MaterialType.transparency,
      borderRadius: borderRadius,
      child: IconButton(
        onPressed: onPressed,
        icon: child,
      ),
    );
  }
}
