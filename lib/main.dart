import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart';
import 'screens/home/home.module.dart';

import 'screens/discover/discover.module.dart';
import 'screens/account/account.modulle.dart';
import './shared/styles/styles.module.dart' as Styles;
import 'shared/widgets/widgets.module.dart';

main(List<String> args) => runApp(App());

class App extends StatefulWidget {
  PageController pageController;
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<NavIcon> navIcons = [
    NavIcon(
      color: Colors.white,
      icon: Icon(Styles.TEDIcons.talks, color: Styles.Colors.grey),
      activeIcon: Icon(Styles.TEDIcons.talks, color: Styles.Colors.red),
      title: 'Talks',
    ),
    NavIcon(
      color: Colors.white,
      icon: Icon(Styles.TEDIcons.discover, color: Styles.Colors.grey),
      activeIcon: Icon(Styles.TEDIcons.discover, color: Styles.Colors.red),
      title: 'Discover',
    ),
    NavIcon(
      color: Colors.white,
      icon: Icon(Styles.TEDIcons.podcasts, color: Styles.Colors.grey),
      activeIcon: Icon(Styles.TEDIcons.podcasts, color: Styles.Colors.red),
      title: 'Podcasts',
    ),
    NavIcon(
      color: Colors.white,
      icon: Icon(Styles.TEDIcons.account, color: Styles.Colors.grey),
      activeIcon: Icon(Styles.TEDIcons.account, color: Styles.Colors.red),
      title: 'Account',
    ),
  ];

  BehaviorSubject currentPage;

  void initState() {
    super.initState();
    currentPage = BehaviorSubject.seeded(0);
    widget.pageController = new PageController();
  }

  void dispose() {
    super.dispose();
    //widget.pageController.dispose();
    //currentPage.close();
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
      ),
    );

    return MaterialApp(
      title: 'TED LAB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(accentColor: Styles.Colors.greyLight),
      home: Scaffold(
        bottomNavigationBar: TNavBar(
          navIcons: navIcons,
          currentPage: currentPage,
        ),
        body: PageView.builder(
          itemBuilder: (_, index) {
            if (index == 0) return HomeScreen();
            if (index == 1) return DiscoverScreen();
            if (index == 2) return HomeScreen();
            if (index == 3) return AccountScreen();
          },
          physics: AlwaysScrollableScrollPhysics(),
          onPageChanged: (page) => currentPage.add(page),
          controller: widget.pageController,
          itemCount: 4,
        ),
      ),
    );
  }
}
