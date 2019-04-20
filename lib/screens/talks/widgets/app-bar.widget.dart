import 'package:flutter/material.dart';
import 'package:ted_plus/shared/widgets/widgets.module.dart';
import 'package:ted_plus/shared/styles/styles.module.dart' as Styles;
import '../talks.module.dart';

class TAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  TAppBar({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  _TAppBarState createState() => _TAppBarState();
  Size get preferredSize => Size.fromHeight(64);
}

class _TAppBarState extends State<TAppBar> {
  TalksScreen talksScreen;
  bool dropShadow = false;

  initState() {
    talksScreen = context.ancestorWidgetOfExactType(TalksScreen);
    talksScreen.scrollController.addListener(() {
      double offset = talksScreen.scrollController.offset;

      if (offset == 0 && dropShadow) setState(() => dropShadow = false);
      if (offset > 0 && !dropShadow) setState(() => dropShadow = true);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      height: 64 + statusBarHeight,
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
          SizedBox(width: 20),
          Expanded(flex: 2, child: _Title(title: this.widget.title)),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[_Search(), _More()],
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;

  _Title({
    Key key,
    @required this.title,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: TextStyle(
          color: Styles.Colors.red,
          fontFamily: 'GoogleMedium',
          fontSize: 19,
        ),
        children: <TextSpan>[
          TextSpan(
            text: ' Talks',
            style: TextStyle(
              color: Styles.Colors.greyLight,
              fontFamily: 'GoogleMedium',
              fontSize: 19,
            ),
          )
        ],
      ),
    );
  }
}

class _More extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: RippleLayout(
        borderRadius: BorderRadius.circular(100),
        child: Icon(
          Icons.more_vert,
          color: Styles.Colors.greyLight,
          size: 24,
        ),
        onPressed: () {},
      ),
    );
  }
}

class _Search extends StatelessWidget {
  Widget build(BuildContext context) {
    return RippleLayout(
      borderRadius: BorderRadius.circular(100),
      child: Icon(
        Icons.search,
        color: Styles.Colors.greyLight,
        size: 24,
      ),
      onPressed: () {},
    );
  }
}
