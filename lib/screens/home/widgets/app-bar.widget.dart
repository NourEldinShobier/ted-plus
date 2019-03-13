import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../home.module.dart';

import 'package:ted_plus/styles/styles.module.dart' as Styles;
import 'package:ted_plus/widgets/widgets.module.dart';

class TAppBar extends StatefulWidget implements PreferredSizeWidget {
  TAppBar({Key key}) : super(key: key);

  TAppBarState createState() => TAppBarState();

  Size get preferredSize => Size.fromHeight(64);
}

class TAppBarState extends State<TAppBar> {
  HomeScreen homeScreen;
  bool dropShadow = false;

  initState() {
    homeScreen = context.ancestorWidgetOfExactType(HomeScreen);
    homeScreen.scrollController.addListener(() {
      double offset = homeScreen.scrollController.offset;

      if (offset == 0 && dropShadow) setState(() => dropShadow = false);
      if (offset > 0 && !dropShadow) setState(() => dropShadow = true);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, dropShadow ? 0.12 : 0.0),
            offset: Offset(0, 0),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(child: _Menu()),
          Expanded(child: _Title()),
          Expanded(child: _Image()),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'TED',
            style: TextStyle(
              color: Styles.Colors.red,
              fontFamily: 'GoogleBold',
              fontSize: 22.0,
            ),
          ),
          SizedBox(width: 5),
          Text(
            'Talks',
            style: TextStyle(
              color: Styles.Colors.greyLight,
              fontFamily: 'GoogleMedium',
              fontSize: 22.0,
            ),
          )
        ],
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  onMenuTap() {}

  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 8),
        child: RippleLayout(
          borderRadius: BorderRadius.circular(100),
          child: Icon(
            Icons.menu,
            color: Styles.Colors.greyLight,
            size: 24,
          ),
          onPress: onMenuTap,
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: SizedBox(
        width: 32,
        height: 32,
        child: Align(
          alignment: Alignment.centerRight,
          child: ClipOval(
            child: Image(
              image: AssetImage('assets/img/profileImg.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
