import 'package:flutter/material.dart';

import '../styles/styles.module.dart' as Styles;

class Tag extends StatelessWidget {
  final String text;

  Tag({
    Key key,
    @required this.text,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.6,
        vertical: 3.8,
      ),
      decoration: BoxDecoration(
        color: Styles.Colors.grey.withOpacity(0.10),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Styles.Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }
}
