import 'package:flutter/material.dart';
import 'nav-icon-view.dart';
import 'nav-icon.dart';

export 'nav-icon.dart';

class TNavBar extends StatefulWidget {
  List<NavIcon> navIcons;
  List<NavIconView> navIconsViews;

  TNavBar({Key key, this.navIcons}) : super(key: key);

  TNavBarState createState() => TNavBarState();
}

class TNavBarState extends State<TNavBar> with TickerProviderStateMixin {
  int currentIndex = 0;
  BottomNavigationBarType navType;

  void initState() {
    super.initState();

    navType = BottomNavigationBarType.shifting;
    widget.navIconsViews = List<NavIconView>();

    widget.navIcons.forEach((navIcon) {
      widget.navIconsViews.add(NavIconView(
        title: navIcon.title,
        color: navIcon.color,
        activeIcon: navIcon.activeIcon,
        icon: navIcon.icon,
        vsync: this,
      ));
    });

    widget.navIconsViews[currentIndex].controller.value = 1.0;
  }

  void dispose() {
    widget.navIconsViews.forEach((view) => view.controller.dispose());
    super.dispose();
  }

  onTap(index) {
    setState(() {
      widget.navIconsViews[currentIndex].controller.reverse();
      currentIndex = index;
      widget.navIconsViews[currentIndex].controller.forward();
    });
  }

  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: widget.navIconsViews
          .map<BottomNavigationBarItem>((view) => view.item)
          .toList(),
      onTap: (index) => onTap(index),
      currentIndex: currentIndex,
      type: navType,
    );
  }
}
