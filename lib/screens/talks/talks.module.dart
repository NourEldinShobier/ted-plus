import 'package:flutter/material.dart';
import 'package:ted_plus/fake-data.dart';
import 'package:ted_plus/utils/talk.util.dart';

import 'widgets/widgets.module.dart';
import 'package:ted_plus/styles/styles.module.dart' as Styles;
import 'package:ted_plus/widgets/widgets.module.dart';

class TalksScreen extends StatelessWidget {
  final String title;

  TalksScreen({@required this.title});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: this.title),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 12),
            _Chips(),
            LargePost(talk: FakeData.talks[0]),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(color: Color(0xFFF1F3F4), height: 1),
            ),
            SmallPost(talk: FakeData.talks[0]),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(color: Color(0xFFF1F3F4), height: 1),
            ),
            SmallPost(talk: FakeData.talks[1]),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(color: Color(0xFFF1F3F4), height: 1),
            ),
            SmallPost(talk: FakeData.talks[2]),
          ],
        ),
      ),
    );
  }
}

class _Chips extends StatelessWidget {
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              //color: Styles.Colors.grey.withOpacity(0.10),
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Text(
              'All',
              style: TextStyle(
                color: Styles.Colors.red,
                fontFamily: 'GoogleMedium',
              ),
            ),
          ),
          Container(
            width: 4,
            margin: EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              color: Styles.Colors.greyLight.withOpacity(0.40),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Text(
              'Design',
              style: TextStyle(
                color: Styles.Colors.greyLight,
                fontFamily: 'GoogleMedium',
              ),
            ),
          ),
          Container(
            width: 4,
            margin: EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              color: Styles.Colors.greyLight.withOpacity(0.40),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Text(
              'Art',
              style: TextStyle(
                color: Styles.Colors.greyLight,
                fontFamily: 'GoogleMedium',
              ),
            ),
          ),
          Container(
            width: 4,
            margin: EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              color: Styles.Colors.greyLight.withOpacity(0.40),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Text(
              'Business',
              style: TextStyle(
                color: Styles.Colors.greyLight,
                fontFamily: 'GoogleMedium',
              ),
            ),
          ),
          Container(
            width: 4,
            margin: EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              color: Styles.Colors.greyLight.withOpacity(0.40),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Text(
              'Psychology',
              style: TextStyle(
                color: Styles.Colors.greyLight,
                fontFamily: 'GoogleMedium',
              ),
            ),
          ),
          Container(
            width: 4,
            margin: EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              color: Styles.Colors.greyLight.withOpacity(0.40),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Text(
              'Science',
              style: TextStyle(
                color: Styles.Colors.greyLight,
                fontFamily: 'GoogleMedium',
              ),
            ),
          ),
          Container(
            width: 4,
            margin: EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              color: Styles.Colors.greyLight.withOpacity(0.40),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Text(
              'Personal',
              style: TextStyle(
                color: Styles.Colors.greyLight,
                fontFamily: 'GoogleMedium',
              ),
            ),
          )
        ],
        padding: EdgeInsets.symmetric(horizontal: 8),
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

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
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 136, bottom: 51),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 7.6,
                      vertical: 3.8,
                    ),
                    decoration: BoxDecoration(
                      color: Styles.Colors.grey.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      'Design',
                      style: TextStyle(
                        color: Styles.Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 7.6,
                      vertical: 3.8,
                    ),
                    decoration: BoxDecoration(
                      color: Styles.Colors.grey.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      'Alternative Energy',
                      style: TextStyle(
                        color: Styles.Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
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
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              Expanded(flex: 2, child: _TalkTitle(title: talk.title)),
              Expanded(child: _TalkImage(image: talk.image)),
            ],
          ),
        ),
        SizedBox(height: 17),
        _TalkSubTitle(
          speakerName: talk.speakerName,
          date: talk.publishDate,
        ),
        SizedBox(height: 20)
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
            fontSize: 16,
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
