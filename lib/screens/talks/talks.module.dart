import 'package:flutter/material.dart';
import 'package:ted_plus/fake-data.dart';
import 'widgets/widgets.module.dart';

import 'package:ted_plus/widgets/widgets.module.dart';

class TalksScreen extends StatefulWidget {
  final String title;

  TalksScreen({@required this.title});

  @override
  _TalksScreenState createState() => _TalksScreenState();
}

class _TalksScreenState extends State<TalksScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        key: ValueKey('talks.app-bar'),
        title: widget.title,
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
            separatorBuilder: (_, __) {
              return Divider(
                color: Colors.transparent,
                height: 37,
              );
            },
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: FakeData.talks.length,
          ),
        ),
      ),
    );
  }
}
