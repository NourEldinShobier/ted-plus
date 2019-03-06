import 'package:flutter/material.dart';

import '../../styles/styles.module.dart' as Styles;
import '../../widgets/widgets.module.dart';
import '../../utils/talk.util.dart';

class LargePost extends StatelessWidget {
  final Talk talk;

  LargePost({
    Key key,
    @required this.talk,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _TalkThumbnail(
          image: talk.image,
          duration: talk.duration,
        ),
        SizedBox(height: 12),
        _TalkTitle(title: talk.title),
        SizedBox(height: 16),
        Row(
          children: <Widget>[
            _TalkSubTitle(
              speakerName: talk.speakerName,
              date: talk.publishDate,
            ),
            Expanded(
              child: Align(
                child: _Menu(),
                alignment: Alignment.centerRight,
              ),
            )
          ],
        )
      ],
    );
  }
}

class _TalkImage extends StatelessWidget {
  final Image image;

  _TalkImage({@required this.image});

  Widget build(BuildContext context) {
    return Container(
      height: 180,
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
      padding: EdgeInsets.only(right: 20),
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
      padding: EdgeInsets.only(right: 20),
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xFF202124),
          fontFamily: 'GoogleMedium',
          fontSize: 21.0,
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
    return Text(
      '$speakerName • $date',
      style: TextStyle(
        color: Styles.Colors.greyDark,
        fontSize: 12.0,
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: RippleLayout(
        onPress: () {},
        borderRadius: BorderRadius.circular(100),
        child: Icon(
          Icons.more_vert,
          color: Styles.Colors.grey,
          size: 22,
        ),
      ),
    );
  }
}
