import 'package:flutter/material.dart';

import '../widgets.module.dart';
import '../../styles/styles.module.dart' as Styles;
import '../../utils/talk.util.dart';

class SmallPost extends StatelessWidget {
  final Talk talk;

  SmallPost({
    Key key,
    @required this.talk,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _Post(talk: this.talk),
        _ActionButtons(),
        _Tags(tags: talk.tags)
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
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              Expanded(child: _TalkTitle(title: talk.title), flex: 2),
              Expanded(child: _TalkImage(image: talk.image)),
            ],
          ),
        ),
        SizedBox(height: 19),
        _TalkSubTitle(
          speakerName: talk.speakerName,
          date: talk.publishDate,
        ),
        SizedBox(height: 18)
      ],
    );
  }
}

class _TalkImage extends StatelessWidget {
  final Image image;

  _TalkImage({@required this.image});

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: SizedBox(
        height: 96,
        width: 96,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: image,
        ),
      ),
    );
  }
}

class _TalkTitle extends StatelessWidget {
  final String title;

  _TalkTitle({@required this.title});

  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color(0xFF202124),
            fontFamily: 'GoogleMedium',
            fontSize: 17,
          ),
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

class _Tags extends StatelessWidget {
  final List<String> tags;

  _Tags({
    Key key,
    @required this.tags,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 136,
            bottom: 51,
          ),
          child: Row(
            children: <Widget>[
              Tag(text: tags[0]),
              SizedBox(width: 8),
              Tag(text: tags[1]),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.only(right: 3, bottom: 5.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[_BookMark(), _More()],
          ),
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
