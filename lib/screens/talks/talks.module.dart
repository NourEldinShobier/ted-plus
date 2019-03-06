import 'package:flutter/material.dart';
import 'package:ted_plus/fake-data.dart';
import 'widgets/widgets.module.dart';

import 'package:ted_plus/widgets/widgets.module.dart';

class TalksScreen extends StatelessWidget {
  final String title;

  TalksScreen({@required this.title});

  Widget build(BuildContext context) {
    Widget divider = Padding(
      padding: EdgeInsets.only(bottom: 23, right: 20),
      child: Container(color: Color(0xFFF1F3F4), height: 1),
    );

    return Scaffold(
      appBar: TAppBar(
        key: ValueKey('talks.app-bar'),
        title: title,
      ),
      body: Container(
        color: Colors.white,
        child: SizedBox.expand(
          key: ValueKey('talks.body'),
          child: ListView.separated(
            key: ValueKey('talks.list'),
            itemBuilder: (_, index) {
              return LargePost(
                key: ValueKey('talks $index'),
                talk: FakeData.talks[index],
              );
            },
            separatorBuilder: (_, __) => divider,
            padding: EdgeInsets.only(
              top: 23,
              bottom: 8,
              left: 20,
            ),
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: FakeData.talks.length,
          ),
        ),
      ),
    );
  }
}
