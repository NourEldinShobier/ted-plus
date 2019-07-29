import 'package:flutter/material.dart';
import 'pages/talks/talks.module.dart';

abstract class Router {
  static navigateToTalks(context, title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TalksScreen(title: title)),
    );
  }
}
