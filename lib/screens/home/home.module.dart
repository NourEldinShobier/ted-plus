import 'package:flutter/material.dart';

import '../../fake-data.dart';
import 'widgets/widgets.module.dart';

class HomeScreen extends StatelessWidget {
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

    return Scaffold(
      appBar: TAppBar(key: ValueKey('home.appbar')),
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
    );
  }
}
