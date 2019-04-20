import 'package:flutter/material.dart';

import '../../../shared/styles/styles.module.dart' as Styles;
import '../../../shared/widgets/widgets.module.dart';

import '../../../utils/talk.util.dart';
import '../../../routes.dart';

class ThumbnailsContainer extends StatelessWidget {
  ThumbnailsContainer({
    Key key,
    @required this.talks,
    @required this.title,
    @required this.subTitle,
  }) : super(key: key);

  final List<Talk> talks;
  final String title;
  final String subTitle;

  onTitleTap(context, title) {
    Router.navigateToTalks(context, title);
  }

  Widget build(BuildContext context) {
    Widget titleElement = InkResponse(
      onTap: () => onTitleTap(context, title),
      child: Padding(
        padding: EdgeInsets.only(left: 23),
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xFF202124),
            fontFamily: 'GoogleMedium',
            fontSize: 21,
          ),
        ),
      ),
    );

    Widget subTitleElement = Padding(
      padding: EdgeInsets.only(left: 23),
      child: Text(
        subTitle,
        style: TextStyle(
          color: Styles.Colors.greyLight,
          fontSize: 16,
        ),
      ),
    );

    return Container(
      height: 414,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 27),
          titleElement,
          SizedBox(height: 4),
          subTitleElement,
          SizedBox(height: 12),
          Expanded(
            child: _TalksList(this.talks, title),
          )
        ],
      ),
    );
  }
}

class _TalksList extends StatelessWidget {
  final List<Talk> talks;
  final String title;

  _TalksList(this.talks, this.title);

  Widget build(BuildContext context) {
    return ListView.builder(
      key: ValueKey('$title-list'),
      itemCount: 3,
      itemBuilder: (_, index) {
        return MidPost(
          key: ValueKey('$title.talk $index'),
          talk: talks[index],
        );
      },
      padding: EdgeInsets.only(left: 11.5, right: 11.5, top: 15),
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
    );
  }
}
