import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/widgets.module.dart';
import '../../fake-data.dart';

import 'home.controller.dart';

class HomePage extends StatelessWidget {
  final homePage = HomePageController();

  Widget build(BuildContext context) {
/*     homePage.topTalks[0] = Provider.of<TalksStore>(context).topNewest;
    homePage.topTalks[1] = Provider.of<TalksStore>(context).topMostViewed;
    homePage.topTalks[2] = Provider.of<TalksStore>(context).topMostTreding; */

    homePage.init();

    return ChangeNotifierProvider<HomePageController>.value(
      child: HomePageBody(),
      notifier: homePage,
    );
  }
}

class HomePageBody extends StatelessWidget {
  Widget build(BuildContext context) {
    var homePage = Provider.of<HomePageController>(context);

    return Scaffold(
      appBar: TAppBar(key: ValueKey('home.appbar')),
      body: SizedBox.expand(
        key: ValueKey('home.body'),
        child: ListView.separated(
          key: ValueKey('home.categories-List'),
          itemBuilder: (_, index) {
            return TalksContainer(
              key: ValueKey('thumnails.$index'),
              title: homePage.thumbnailsTitles[index],
              subTitle: homePage.thumbnailsSubTitles[index],
              talks: FakeData.talks,
            );
          },
          separatorBuilder: (_, __) {
            return Container(
              color: Color(0xFFF1F3F4),
              height: 1,
            );
          },
          physics: AlwaysScrollableScrollPhysics(),
          controller: homePage.scrollController,
          itemCount: 3,
        ),
      ),
    );
  }
}
