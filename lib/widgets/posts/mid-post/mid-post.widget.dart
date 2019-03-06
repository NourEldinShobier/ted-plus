import 'package:flutter/material.dart';

import '../../../styles/styles.module.dart' as Styles;
import '../../../utils/talk.util.dart';

class MidPost extends StatelessWidget {
  final Talk talk;

  const MidPost({
    Key key,
    @required this.talk,
  }) : super(key: key);

  onMenuTap() {
    print("object");
  }

  Widget build(BuildContext context) {
    Widget imageElement = ClipRRect(
      borderRadius: BorderRadius.circular(11),
      child: talk.image,
    );
    Widget durationElement = Container(
      margin: EdgeInsets.only(bottom: 10, right: 10),
      padding: EdgeInsets.symmetric(horizontal: 7.6, vertical: 3.8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        talk.duration,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 11,
        ),
      ),
    );
    Widget thumbnailElement = Stack(
      children: <Widget>[
        imageElement,
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomRight,
            child: durationElement,
          ),
        ),
      ],
    );
    Widget titleElement = Text(
      talk.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Color(0xFF202124),
        fontFamily: 'GoogleMedium',
        fontSize: 20,
      ),
    );
    Widget subTitleElement = Text(
      '${talk.speakerName} • ${talk.publishDate}',
      style: TextStyle(
        color: Styles.Colors.grey,
        fontSize: 14,
      ),
    );
    Widget menuElement = GestureDetector(
      onTap: onMenuTap,
      child: SizedBox(
        width: 16,
        child: Icon(
          Icons.more_vert,
          color: Styles.Colors.grey,
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.only(left: 11.5, right: 11.5),
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            thumbnailElement,
            SizedBox(height: 12.5),
            SizedBox(height: 50.7, child: titleElement),
            SizedBox(height: 18),
            Row(
              children: <Widget>[
                subTitleElement,
                Expanded(
                  child: Align(
                    child: menuElement,
                    alignment: Alignment.centerRight,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
