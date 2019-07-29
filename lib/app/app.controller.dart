import 'package:flutter/material.dart';

import '../shared/styles/styles.module.dart' as Styles;
import '../shared/widgets/widgets.module.dart';

class AppController {
  final pageController = PageController(initialPage: 0);
  final navIcons = [
    NavIcon(
      color: Colors.white,
      icon: Icon(Styles.OMIcons.slideshow, color: Styles.Colors.grey),
      activeIcon: Icon(Styles.OMIcons.slideshow, color: Styles.Colors.red),
      title: 'Talks',
    ),
    NavIcon(
      color: Colors.white,
      icon: Icon(Styles.OMIcons.explore, color: Styles.Colors.grey),
      activeIcon: Icon(Styles.OMIcons.explore, color: Styles.Colors.red),
      title: 'Discover',
    ),
    NavIcon(
      color: Colors.white,
      icon: Icon(Styles.OMIcons.headset, color: Styles.Colors.grey),
      activeIcon: Icon(Styles.OMIcons.headset, color: Styles.Colors.red),
      title: 'Podcasts',
    ),
    NavIcon(
      color: Colors.white,
      icon: Icon(Styles.OMIcons.accountCircle, color: Styles.Colors.grey),
      activeIcon: Icon(Styles.OMIcons.accountCircle, color: Styles.Colors.red),
      title: 'Account',
    ),
  ];
}
