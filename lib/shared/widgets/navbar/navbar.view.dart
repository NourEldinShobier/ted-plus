part of 'navbar.widget.dart';

class TNavBarView extends TNavBarState {
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: navIconsViews
          .map<BottomNavigationBarItem>((view) => view.item)
          .toList(),
      onTap: (page) => onTap(page),
      currentIndex: currnetPage,
      type: navType,
    );
  }
}
