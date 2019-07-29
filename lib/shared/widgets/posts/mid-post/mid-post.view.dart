import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:ted_plus/shared/styles/styles.module.dart' as Styles;
import 'package:ted_plus/utils/talk.util.dart';

import '../../widgets.module.dart';
import 'mid-post.controller.dart';

part 'mid-post.view.g.dart';

@FunctionalWidget(equality: FunctionalWidgetEquality.identical)
Widget midPost({@required Talk talk, @required double pageOffset}) {
  final midPost = MidPostController()
    ..pageOffset = pageOffset
    ..talk = talk
    ..init();

  return ChangeNotifierProvider<MidPostController>.value(
    child: MidPostBody(),
    notifier: midPost,
  );
}

@FunctionalWidget()
Widget midPostBody(BuildContext context) {
  var midPost = Provider.of<MidPostController>(context);
  var gauss = math.exp(-(math.pow((midPost.pageOffset.abs() - 0.5), 2) / 0.08));

  return Transform.translate(
    offset: Offset(-32 * gauss * midPost.pageOffset.sign, 0),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _TalkThumbnail(),
          SizedBox(height: 12.5),
          SizedBox(height: 50.7, child: _TalkTitle()),
          SizedBox(height: 7),
          Row(
            children: <Widget>[
              _TalkSubTitle(),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _Views(),
                ),
              ),
              SizedBox(width: 2),
            ],
          )
        ],
      ),
    ),
  );
}

@FunctionalWidget()
Widget _talkImage(BuildContext context) {
  var midPost = Provider.of<MidPostController>(context);

  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    child: FadeInImage(
      fit: BoxFit.cover,
      placeholder: AssetImage('assets/img/PostImg1.jpg'),
      image: midPost.talk.image.image,
    ),
  );
}

@FunctionalWidget()
Widget _talkDuration(BuildContext context) {
  var midPost = Provider.of<MidPostController>(context);

  return Container(
    margin: EdgeInsets.only(bottom: 10, right: 10),
    padding: EdgeInsets.symmetric(horizontal: 7.6, vertical: 3.8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(100),
    ),
    child: Text(
      midPost.talk.duration,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 11,
      ),
    ),
  );
}

@FunctionalWidget()
Widget _talkThumbnail(BuildContext context) {
  return Stack(
    children: <Widget>[
      _TalkImage(),
      Positioned.fill(
        child: Align(
          alignment: Alignment.bottomRight,
          child: _TalkDuration(),
        ),
      ),
    ],
  );
}

@FunctionalWidget()
Widget _talkTitle(BuildContext context) {
  var midPost = Provider.of<MidPostController>(context);

  return Text(
    midPost.talk.title,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: Color(0xFF202124),
      fontFamily: 'GoogleMedium',
      fontSize: 18,
    ),
  );
}

@FunctionalWidget()
Widget _talkSubTitle(BuildContext context) {
  var midPost = Provider.of<MidPostController>(context);
  var speakerName = midPost.talk.speakerName;
  var publishDate = midPost.talk.publishDate;

  return Text(
    '$speakerName • $publishDate',
    style: TextStyle(
      color: Styles.Colors.greyLight,
      fontSize: 12,
    ),
  );
}

@FunctionalWidget()
Widget _views(BuildContext context) {
  var midPost = Provider.of<MidPostController>(context);

  return Text(
    midPost.talk.views.toString() + ' Views',
    style: TextStyle(
      color: Styles.Colors.greyLight,
      fontSize: 12,
    ),
  );
}

@FunctionalWidget()
Widget _bookMark(BuildContext context) {
  var midPost = Provider.of<MidPostController>(context);

  return RippleLayout(
    width: 40,
    height: 40,
    onPressed: midPost.bookmark_onPressed,
    borderRadius: BorderRadius.circular(100),
    child: Icon(
      Styles.OMIcons.bookmarkBorder,
      color: Styles.Colors.greyLight,
      size: 21,
    ),
  );
}

@FunctionalWidget()
Widget _more(BuildContext context) {
  var midPost = Provider.of<MidPostController>(context);

  return SizedBox(
    width: 14,
    height: 40,
    child: Icon(
      Icons.more_vert,
      color: Styles.Colors.greyLight,
      size: 21,
    ),
  );
}
