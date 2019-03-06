import 'package:flutter/material.dart';
import 'screens/talks/talks.module.dart';

abstract class Router {
  static navigateToTalks(context, title) {
    /* Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (_, __, ___) => TalksScreen(title: title),
    )); */
  }
}
