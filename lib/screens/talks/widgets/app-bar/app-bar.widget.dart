import 'package:flutter/material.dart';

import 'package:ted_plus/styles/styles.module.dart' as Styles;
import 'package:ted_plus/widgets/widgets.module.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  TAppBar({
    Key key,
    @required this.title,
  }) : super(key: key);

  Size get preferredSize => Size.fromHeight(64);

  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.0),
            offset: Offset(0, 0),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(child: _Back()),
          Expanded(flex: 2, child: _TitleElement(title: title)),
          Expanded(child: _Menu())
        ],
      ),
    );
  }
}

class _TitleElement extends StatelessWidget {
  final String title;

  _TitleElement({@required this.title});

  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xFF202124),
          fontFamily: 'GoogleMedium',
          fontSize: 22.0,
        ),
      ),
    );
  }
}

class _Back extends StatelessWidget {
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 8),
        child: RippleLayout(
          onPress: Navigator.of(context).pop,
          borderRadius: BorderRadius.circular(100),
          child: Icon(
            Icons.arrow_back,
            color: Styles.Colors.grey,
            size: 24,
          ),
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 8),
        child: RippleLayout(
          onPress: () {},
          borderRadius: BorderRadius.circular(100),
          child: Icon(
            Icons.more_vert,
            color: Styles.Colors.grey,
            size: 24,
          ),
        ),
      ),
    );
  }
}
