import 'package:flutter/material.dart';
import 'package:ted_plus/shared/widgets/widgets.module.dart';
import 'package:ted_plus/shared/styles/styles.module.dart' as Styles;

part 'app-bar.controller.dart';

class TAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ScrollController scrollController;
  final String title;

  TAppBar({
    Key key,
    @required this.scrollController,
    @required this.title,
  }) : super(key: key);

  Size get preferredSize => Size.fromHeight(64);
  TAppBarView createState() => TAppBarView();
}

class TAppBarView extends TAppBarController {
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      height: 64 + statusBarHeight,
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
          SizedBox(width: 8),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: _Back(),
            ),
          ),
          Expanded(flex: 2, child: _Title(title: this.widget.title)),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: _More(),
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
    return Center(
      child: RichText(
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
                fontSize: 18,
              ),
            )
          ],
        ),
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

class _Back extends StatelessWidget {
  Widget build(BuildContext context) {
    return RippleLayout(
      borderRadius: BorderRadius.circular(100),
      child: Icon(
        Icons.arrow_back,
        color: Styles.Colors.greyLight,
        size: 24,
      ),
      onPressed: () {},
    );
  }
}
