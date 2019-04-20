import 'package:flutter/material.dart';

import '../../styles/styles.module.dart' as Styles;
import '../../../utils/talk.util.dart';

class MidPost extends StatelessWidget {
  final Talk talk;

  const MidPost({
    Key key,
    @required this.talk,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _Post(talk: this.talk),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 0, bottom: 33),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[_More()],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Post extends StatelessWidget {
  final Talk talk;

  _Post({
    Key key,
    this.talk,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 11.5, right: 11.5),
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _TalkThumbnail(
              image: talk.image,
              duration: talk.duration,
            ),
            SizedBox(height: 12.5),
            SizedBox(
              height: 50.7,
              child: _TalkTitle(
                title: talk.title,
              ),
            ),
            SizedBox(height: 25),
            _TalkSubTitle(
              speakerName: talk.speakerName,
              date: talk.publishDate,
            ),
          ],
        ),
      ),
    );
  }
}

class _TalkImage extends StatelessWidget {
  final Image image;

  _TalkImage({@required this.image});

  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(11),
      child: image,
    );
  }
}

class _TalkDuration extends StatelessWidget {
  final String duration;

  _TalkDuration({@required this.duration});

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, right: 10),
      padding: EdgeInsets.symmetric(horizontal: 7.6, vertical: 3.8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        duration,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 11,
        ),
      ),
    );
  }
}

class _TalkThumbnail extends StatelessWidget {
  final Image image;
  final String duration;

  _TalkThumbnail({
    @required this.image,
    @required this.duration,
  });

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _TalkImage(image: image),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomRight,
            child: _TalkDuration(duration: duration),
          ),
        ),
      ],
    );
  }
}

class _TalkTitle extends StatelessWidget {
  final String title;

  _TalkTitle({@required this.title});

  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Color(0xFF202124),
        fontFamily: 'GoogleMedium',
        fontSize: 20,
      ),
    );
  }
}

class _TalkSubTitle extends StatelessWidget {
  final String speakerName;
  final String date;

  _TalkSubTitle({
    @required this.speakerName,
    @required this.date,
  });

  Widget build(BuildContext context) {
    return Text(
      '$speakerName • $date',
      style: TextStyle(
        color: Styles.Colors.greyLight,
        fontSize: 14,
      ),
    );
  }
}

class _More extends StatelessWidget {
  Widget build(BuildContext context) {
    return SizedBox(
      width: 31,
      height: 31,
      child: Material(
        clipBehavior: Clip.antiAlias,
        type: MaterialType.transparency,
        child: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: Styles.Colors.greyLight,
            size: 21,
          ),
        ),
      ),
    );
  }
}
