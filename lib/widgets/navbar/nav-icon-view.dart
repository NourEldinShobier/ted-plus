import 'package:flutter/material.dart';
import '../../styles/styles.module.dart' as Styles;

class NavIconView {
  Icon icon;
  Icon activeIcon;

  Color color;
  String title;

  BottomNavigationBarItem item;

  AnimationController controller;
  Animation<double> animation;

  NavIconView({
    this.title,
    this.color,
    this.icon,
    this.activeIcon,
    TickerProvider vsync,
  }) {
    item = BottomNavigationBarItem(
      icon: icon,
      activeIcon: activeIcon,
      title: Text(
        title,
        style: TextStyle(
          color: Styles.Colors.red,
          fontFamily: 'GoogleBold',
          fontSize: 12,
        ),
      ),
      backgroundColor: color,
    );

    controller = AnimationController(
      duration: kThemeAnimationDuration,
      vsync: vsync,
    );

    animation = controller.drive(CurveTween(
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    ));
  }
}
