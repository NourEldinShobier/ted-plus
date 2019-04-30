part of 'navbar.widget.dart';

abstract class TNavBarState extends State<TNavBar>
    with TickerProviderStateMixin {
  BottomNavigationBarType navType;
  List<NavIconView> navIconsViews;
  int currnetPage = 0;

  void initState() {
    super.initState();

    navType = BottomNavigationBarType.shifting;
    navIconsViews = List<NavIconView>();

    widget.navIcons.forEach((navIcon) {
      navIconsViews.add(NavIconView(
        title: navIcon.title,
        color: navIcon.color,
        activeIcon: navIcon.activeIcon,
        icon: navIcon.icon,
        vsync: this,
      ));
    });

    navIconsViews[currnetPage].controller.value = 1.0;
  }

  void dispose() {
    navIconsViews.forEach((view) => view.controller.dispose());
    super.dispose();
  }

  void onTap(page) {
    setState(() {
      navIconsViews[currnetPage].controller.reverse();
      currnetPage = page;
      navIconsViews[currnetPage].controller.forward();
    });

    widget.pageController.animateToPage(
      currnetPage,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
