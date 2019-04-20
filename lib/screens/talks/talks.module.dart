import 'package:flutter/material.dart';
import 'package:ted_plus/fake-data.dart';
import 'widgets/widgets.module.dart';

import '../../shared/widgets/widgets.module.dart';

class TalksScreen extends StatelessWidget {
  final String title;

  ScrollController scrollController = ScrollController();

  TalksScreen({@required this.title});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: this.title, key: ValueKey('talks.app-bar')),
      body: Container(
        color: Colors.white,
        child: ListView.separated(
          controller: scrollController,
          itemCount: FakeData.talks.length + 2,
          itemBuilder: (_, index) {
            if (index == 0) return SizedBox(height: 16);
            if (index == 1)
              return FieldsList(key: ValueKey('talks.fields-list'));
            if (index == 2)
              return LargePost(
                key: ValueKey('post.${index - 2}'),
                talk: FakeData.talks[index - 2],
              );
            return SmallPost(
                key: ValueKey('post.${index - 2}'),
                talk: FakeData.talks[index - 2]);
          },
          separatorBuilder: (_, index) {
            if (index == 0) return SizedBox(height: 0);
            if (index == 1) return SizedBox(height: 0);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(color: Color(0xFFF1F3F4), height: 1),
            );
          },
        ),
      ),
    );
  }
}
