import 'package:flutter/material.dart';

import 'package:ted_plus/styles/styles.module.dart' as Styles;
import 'package:ted_plus/widgets/widgets.module.dart';
import 'package:ted_plus/core/core.module.dart';

part 'app-bar.widget.g.dart';

@widget
Widget tAppBar(BuildContext context, {@required String title}) {
  double statusBarHeight = MediaQuery.of(context).padding.top;

  return Container(
    padding: EdgeInsets.only(top: statusBarHeight),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.12),
          offset: Offset(0, 0),
          blurRadius: 3,
        ),
      ],
    ),
    child: Row(
      children: <Widget>[
        Expanded(child: Back()),
        Expanded(flex: 2, child: TitleElement(title: title)),
        Expanded(child: Menu())
      ],
    ),
  );
}

@widget
Widget titleElement({@required String title}) {
  return Align(
    alignment: Alignment.center,
    child: Text(
      title,
      style: TextStyle(
        color: Styles.Colors.red,
        fontFamily: 'GoogleMedium',
        fontSize: 22.0,
      ),
    ),
  );
}

@widget
Widget back(BuildContext context) {
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

@widget
Widget menu() {
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
