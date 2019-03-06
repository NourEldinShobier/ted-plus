// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'large-post.widget.dart';

// **************************************************************************
// Generator: FunctionalWidget
// **************************************************************************

class LargePost extends StatelessWidget {
  const LargePost({Key key, @required this.talk, @required this.onMenuTap})
      : super(key: key);

  final Talk talk;

  final void Function() onMenuTap;

  @override
  Widget build(BuildContext _context) =>
      largePost(talk: talk, onMenuTap: onMenuTap);
  @override
  int get hashCode => hashValues(talk, onMenuTap);
  @override
  bool operator ==(Object o) =>
      identical(o, this) ||
      (o is LargePost && talk == o.talk && onMenuTap == o.onMenuTap);
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Talk>('talk', talk));
    properties.add(ObjectFlagProperty<dynamic>.has('onMenuTap', onMenuTap));
  }
}

class TalkImage extends StatelessWidget {
  const TalkImage({Key key, @required this.image}) : super(key: key);

  final Image image;

  @override
  Widget build(BuildContext _context) => talkImage(image: image);
  @override
  int get hashCode => image.hashCode;
  @override
  bool operator ==(Object o) =>
      identical(o, this) || (o is TalkImage && image == o.image);
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Image>('image', image));
  }
}

class TalkDuration extends StatelessWidget {
  const TalkDuration({Key key, @required this.duration}) : super(key: key);

  final String duration;

  @override
  Widget build(BuildContext _context) => talkDuration(duration: duration);
  @override
  int get hashCode => duration.hashCode;
  @override
  bool operator ==(Object o) =>
      identical(o, this) || (o is TalkDuration && duration == o.duration);
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('duration', duration));
  }
}

class TalkThumbnail extends StatelessWidget {
  const TalkThumbnail({Key key, @required this.image, @required this.duration})
      : super(key: key);

  final Image image;

  final String duration;

  @override
  Widget build(BuildContext _context) =>
      talkThumbnail(image: image, duration: duration);
  @override
  int get hashCode => hashValues(image, duration);
  @override
  bool operator ==(Object o) =>
      identical(o, this) ||
      (o is TalkThumbnail && image == o.image && duration == o.duration);
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Image>('image', image));
    properties.add(StringProperty('duration', duration));
  }
}

class TalkTitle extends StatelessWidget {
  const TalkTitle({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext _context) => talkTitle(title: title);
  @override
  int get hashCode => title.hashCode;
  @override
  bool operator ==(Object o) =>
      identical(o, this) || (o is TalkTitle && title == o.title);
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}

class TalkSubTitle extends StatelessWidget {
  const TalkSubTitle({Key key, @required this.speakerName, @required this.date})
      : super(key: key);

  final String speakerName;

  final String date;

  @override
  Widget build(BuildContext _context) =>
      talkSubTitle(speakerName: speakerName, date: date);
  @override
  int get hashCode => hashValues(speakerName, date);
  @override
  bool operator ==(Object o) =>
      identical(o, this) ||
      (o is TalkSubTitle && speakerName == o.speakerName && date == o.date);
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('speakerName', speakerName));
    properties.add(StringProperty('date', date));
  }
}

class Menu extends StatelessWidget {
  const Menu({Key key, @required this.onMenuTap}) : super(key: key);

  final void Function() onMenuTap;

  @override
  Widget build(BuildContext _context) => menu(onMenuTap: onMenuTap);
  @override
  int get hashCode => onMenuTap.hashCode;
  @override
  bool operator ==(Object o) =>
      identical(o, this) || (o is Menu && onMenuTap == o.onMenuTap);
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<dynamic>.has('onMenuTap', onMenuTap));
  }
}
