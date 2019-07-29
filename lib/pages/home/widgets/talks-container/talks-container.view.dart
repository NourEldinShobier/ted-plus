import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/styles/styles.module.dart' as Styles;
import '../../../../shared/widgets/widgets.module.dart';

import '../../../../utils/talk.util.dart';

import 'talks-container.controller.dart';

class TalksContainer extends StatelessWidget {
  final talksContainer = TalksContainerController();

  TalksContainer({
    Key key,
    @required String title,
    @required String subTitle,
    @required List<Talk> talks,
  }) : super(key: key) {
    talksContainer.title = title;
    talksContainer.subTitle = subTitle;
    talksContainer.talks = talks;
  }

  Widget build(BuildContext context) {
    talksContainer.init();

    return ChangeNotifierProvider<TalksContainerController>.value(
      child: TalksContainerBody(),
      notifier: talksContainer,
    );
  }
}

class TalksContainerBody extends StatelessWidget {
  Widget build(BuildContext context) {
    var talksContainer = Provider.of<TalksContainerController>(context);

    Widget title = Padding(
      padding: EdgeInsets.only(left: 23),
      child: Text(
        talksContainer.title,
        style: TextStyle(
          color: Color(0xFF202124),
          fontFamily: 'GoogleMedium',
          fontSize: 19,
        ),
      ),
    );

    Widget subTitle = Padding(
      padding: EdgeInsets.only(left: 23),
      child: Text(
        talksContainer.subTitle,
        style: TextStyle(
          color: Styles.Colors.greyLight,
          fontSize: 14,
        ),
      ),
    );

    return Container(
      height: 376,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 22),
          title,
          SizedBox(height: 4),
          subTitle,
          SizedBox(height: 22),
          Expanded(child: _TalksList()),
        ],
      ),
    );
  }
}

class _TalksList extends StatelessWidget {
  Widget build(BuildContext context) {
    var talksContainer = Provider.of<TalksContainerController>(context);
    var title = talksContainer.title;

    return PageView.builder(
      key: ValueKey('$title-list'),
      controller: talksContainer.pageController,
      physics: BouncingScrollPhysics(),
      itemCount: 3,
      itemBuilder: (_, index) {
        return MidPost(
          key: ValueKey('$title.talk $index'),
          pageOffset: talksContainer.pageOffset - index,
          talk: talksContainer.talks[index],
        );
      },
    );
  }
}
