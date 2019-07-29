import 'package:flutter/material.dart';

class RippleLayout extends StatelessWidget {
  final Icon child;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;
  final double width;
  final double height;

  RippleLayout({
    Key key,
    @required this.child,
    @required this.onPressed,
    @required this.borderRadius,
    this.width = 48,
    this.height = 48,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      height: this.height,
      child: Material(
        clipBehavior: Clip.antiAlias,
        type: MaterialType.transparency,
        borderRadius: borderRadius,
        child: IconButton(
          onPressed: onPressed,
          icon: child,
        ),
      ),
    );
  }
}
