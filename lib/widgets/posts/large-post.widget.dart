import 'package:flutter/material.dart';

import '../../widgets/widgets.module.dart';
import '../../styles/styles.module.dart' as Styles;
import '../../utils/talk.util.dart';

class LargePost extends StatelessWidget {
  final Talk talk;

  LargePost({
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
              padding: EdgeInsets.only(right: 3, bottom: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[_BookMark(), _More()],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 12),
        _TalkThumbnail(
          image: talk.image,
          duration: talk.duration,
        ),
        SizedBox(height: 12),
        _TalkTitle(title: talk.title),
        _Tags(talk: talk),
        SizedBox(height: 19),
        _TalkSubTitle(
          speakerName: talk.speakerName,
          date: talk.publishDate,
        ),
        SizedBox(height: 16)
      ],
    );
  }
}

class _Tags extends StatelessWidget {
  _Tags({
    Key key,
    @required this.talk,
  }) : super(key: key);

  final Talk talk;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, top: 13),
      child: Row(
        children: <Widget>[
          Tag(text: talk.tags[0]),
          SizedBox(width: 8),
          Tag(text: talk.tags[1]),
        ],
      ),
    );
  }
}

class _TalkImage extends StatelessWidget {
  final Image image;

  _TalkImage({@required this.image});

  Widget build(BuildContext context) {
    return Container(
      height: 176,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: image,
      ),
    );
  }
}

class _TalkDuration extends StatelessWidget {
  final String duration;

  _TalkDuration({@required this.duration});

  Widget build(BuildContext context) {
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
}

class _TalkThumbnail extends StatelessWidget {
  final Image image;
  final String duration;

  _TalkThumbnail({
    @required this.image,
    @required this.duration,
  });

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: <Widget>[
          _TalkImage(image: image),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: _TalkDuration(duration: duration),
            ),
          ),
        ],
      ),
    );
  }
}

class _TalkTitle extends StatelessWidget {
  final String title;

  _TalkTitle({@required this.title});

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xFF202124),
          fontFamily: 'GoogleMedium',
          fontSize: 20,
        ),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21),
      child: Text(
        '$speakerName • $date',
        style: TextStyle(
          color: Styles.Colors.greyLight,
          fontSize: 12.0,
        ),
      ),
    );
  }
}

class _BookMark extends StatelessWidget {
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: RippleLayout(
        onPress: () {},
        borderRadius: BorderRadius.circular(100),
        child: Icon(
          Icons.bookmark_border,
          color: Styles.Colors.greyLight,
          size: 21,
        ),
      ),
    );
  }
}

class _More extends StatelessWidget {
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: RippleLayout(
        onPress: () {},
        borderRadius: BorderRadius.circular(100),
        child: Icon(
          Icons.more_vert,
          color: Styles.Colors.greyLight,
          size: 21,
        ),
      ),
    );
  }
}
