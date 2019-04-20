import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../../../main.dart';
import 'nav-icon-view.dart';
import 'nav-icon.dart';

export 'nav-icon.dart';

class TNavBar extends StatefulWidget {
  List<NavIcon> navIcons;
  List<NavIconView> navIconsViews;
  BehaviorSubject currentPage;

  TNavBar({
    Key key,
    @required this.navIcons,
    @required this.currentPage,
  }) : super(key: key);

  TNavBarState createState() => TNavBarState();
}

class TNavBarState extends State<TNavBar> with TickerProviderStateMixin {
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

    widget.navIconsViews[widget.currentPage.value].controller.value = 1.0;
  }

  void dispose() {
    widget.navIconsViews.forEach((view) => view.controller.dispose());
    super.dispose();
  }

  onTap(page) {
    setState(() {
      widget.navIconsViews[widget.currentPage.value].controller.reverse();
      widget.currentPage.add(page);
      widget.navIconsViews[widget.currentPage.value].controller.forward();
    });

    /* App app = context.ancestorWidgetOfExactType(App);
    app.pageController.animateToPage(
      widget.currentPage.value,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    ); */
  }

  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.currentPage.stream,
      builder: (_, AsyncSnapshot snap) {
        return BottomNavigationBar(
          items: widget.navIconsViews
              .map<BottomNavigationBarItem>((view) => view.item)
              .toList(),
          onTap: (page) => onTap(page),
          currentIndex: snap.data,
          type: navType,
        );
      },
    );
  }
}
