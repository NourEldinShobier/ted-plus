import 'package:flutter/material.dart';
import 'package:ted_plus/fake-data.dart';
import 'widgets/widgets.module.dart';

import '../../shared/widgets/widgets.module.dart';

class TalksScreen extends StatelessWidget {
  final scrollController = ScrollController();
  final String title;

  TalksScreen({@required this.title});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: this.title,
        key: ValueKey('talks.app-bar'),
        scrollController: scrollController,
      ),
      body: ListView.separated(
        controller: scrollController,
        itemCount: FakeData.talks.length,
        itemBuilder: (_, index) {
          if (index == 0)
            return LargePost(
              key: ValueKey('post.$index'),
              talk: FakeData.talks[index],
            );
          return SmallPost(
            key: ValueKey('post.$index'),
            talk: FakeData.talks[index],
          );
        },
        separatorBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(color: Color(0xFFF1F3F4), height: 1),
          );
        },
      ),
    );
  }
}
