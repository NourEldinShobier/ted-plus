// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app-bar.widget.dart';

// **************************************************************************
// Generator: FunctionalWidget
// **************************************************************************

class TAppBar extends StatelessWidget {
  const TAppBar({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext _context) => tAppBar(_context, title: title);
  @override
  int get hashCode => title.hashCode;
  @override
  bool operator ==(Object o) =>
      identical(o, this) || (o is TAppBar && title == o.title);
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}

class TitleElement extends StatelessWidget {
  const TitleElement({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext _context) => titleElement(title: title);
  @override
  int get hashCode => title.hashCode;
  @override
  bool operator ==(Object o) =>
      identical(o, this) || (o is TitleElement && title == o.title);
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}

class Back extends StatelessWidget {
  const Back({Key key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => back(_context);
}

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => menu();
}
