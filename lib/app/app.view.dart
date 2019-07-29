import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pages/home/home.view.dart';
import '../pages/discover/discover.module.dart';
import '../pages/account/account.modulle.dart';

import '../shared/styles/styles.module.dart' as Styles;
import '../shared/widgets/widgets.module.dart';

import 'app.controller.dart';

class TEDApp extends StatelessWidget {
  final appController = AppController();

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
      ),
    );

    return MaterialApp(
      title: 'TED Talks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(accentColor: Styles.Colors.greyLight),
      home: Scaffold(
        bottomNavigationBar: TNavBar(
          pageController: appController.pageController,
          navIcons: appController.navIcons,
        ),
        body: PageView.builder(
          itemBuilder: (_, index) {
            if (index == 0) return HomePage();
            if (index == 1) return DiscoverScreen();
            if (index == 2) return DiscoverScreen();
            if (index == 3) return AccountScreen();
            return null;
          },
          physics: NeverScrollableScrollPhysics(),
          controller: appController.pageController,
          itemCount: 4,
        ),
      ),
    );
  }
}
