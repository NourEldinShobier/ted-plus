import 'package:flutter/material.dart';
import 'nav-icon-view.dart';
import 'nav-icon.dart';

export 'nav-icon.dart';

part 'navbar.state.dart';
part 'navbar.view.dart';

class TNavBar extends StatefulWidget {
  final List<NavIcon> navIcons;
  final PageController pageController;

  TNavBar({
    Key key,
    @required this.navIcons,
    @required this.pageController,
  }) : super(key: key);

  TNavBarView createState() => TNavBarView();
}
