import 'package:flutter/material.dart';

import '../../../styles/styles.module.dart' as Styles;
import '../../../core/core.module.dart';
import '../../../utils/talk.util.dart';

part 'large-post.widget.g.dart';

@widget
Widget largePost({
  @required Talk talk,
  @required GestureTapCallback onMenuTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      TalkThumbnail(
        image: talk.image,
        duration: talk.duration,
      ),
      SizedBox(height: 10),
      TalkTitle(title: talk.title),
      SizedBox(height: 16),
      Row(
        children: <Widget>[
          TalkSubTitle(
            speakerName: talk.speakerName,
            date: talk.publishDate,
          ),
          Expanded(
            child: Align(
              child: Menu(onMenuTap: onMenuTap),
              alignment: Alignment.centerRight,
            ),
          )
        ],
      )
    ],
  );
}

@widget
Widget talkImage({@required Image image}) {
  return Container(
    height: 180,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(11),
      child: image,
    ),
  );
}

@widget
Widget talkDuration({@required String duration}) {
  return Container(
    margin: EdgeInsets.only(bottom: 11.5, right: 11.5),
    padding: EdgeInsets.symmetric(horizontal: 7.6, vertical: 3.8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(100),
    ),
    child: Text(
      duration,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    ),
  );
}

@widget
Widget talkThumbnail({
  @required Image image,
  @required String duration,
}) {
  return Stack(
    children: <Widget>[
      TalkImage(image: image),
      Positioned.fill(
        child: Align(
          alignment: Alignment.bottomRight,
          child: TalkDuration(duration: duration),
        ),
      ),
    ],
  );
}

@widget
Widget talkTitle({@required String title}) {
  return Text(
    title,
    style: TextStyle(
      color: Color(0xFF202124),
      fontFamily: 'GoogleMedium',
      fontSize: 21.0,
    ),
  );
}

@widget
Widget talkSubTitle({
  @required String speakerName,
  @required String date,
}) {
  return Text(
    '$speakerName • $date',
    style: TextStyle(
      color: Styles.Colors.greyDark,
      fontSize: 13.0,
    ),
  );
}

@widget
Widget menu({@required GestureTapCallback onMenuTap}) {
  return GestureDetector(
    onTap: onMenuTap,
    child: SizedBox(
      width: 12,
      child: Icon(
        Icons.more_vert,
        color: Styles.Colors.greyLight,
        size: 22,
      ),
    ),
  );
}
