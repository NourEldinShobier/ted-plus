import 'package:flutter/material.dart';

import '../../fake-data.dart';
import '../../widgets/widgets.module.dart';
import 'widgets/widgets.module.dart';

import '../../styles/styles.module.dart' as Styles;

class HomeScreen extends StatelessWidget {
  final List<NavIcon> navIcons = [
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

  final List<String> thumbnailsTitles = [
    'Newest',
    'Most Viewed',
    'Trending',
  ];

  final List<String> thumbnailsSubTitles = [
    'Watch recent talks',
    'Top 3 talks right now',
    'Discover trending talks',
  ];

  ScrollController scrollController = ScrollController();

  Widget build(BuildContext context) {
    Widget divider = Container(
      color: Color(0xFFF1F3F4),
      height: 1,
    );

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: TAppBar(key: ValueKey('home.app-bar')),
        bottomNavigationBar: TNavBar(navIcons: navIcons),
        body: SizedBox.expand(
          key: ValueKey('home.body'),
          child: ListView.separated(
            key: ValueKey('home.categories-List'),
            itemBuilder: (_, index) {
              return ThumbnailsContainer(
                key: ValueKey('thumnails.$index'),
                title: thumbnailsTitles[index],
                subTitle: thumbnailsSubTitles[index],
                talks: FakeData.talks,
              );
            },
            separatorBuilder: (_, __) => divider,
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: thumbnailsTitles.length,
            controller: scrollController,
          ),
        ),
      ),
    );
  }
}
