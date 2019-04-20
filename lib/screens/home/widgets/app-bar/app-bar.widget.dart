import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../home.module.dart';

import 'package:ted_plus/shared/styles/styles.module.dart' as Styles;
import 'package:ted_plus/shared/widgets/widgets.module.dart';

part 'app-bar.vm.dart';

class TAppBar extends StatefulWidget implements PreferredSizeWidget {
  TAppBar({Key key}) : super(key: key);

  TAppBarView createState() => TAppBarView();
  Size get preferredSize => Size.fromHeight(64);
}

class TAppBarView extends TAppBarViewModel {
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
          Expanded(child: _Menu(onPressed: onMenuPressed)),
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
  final VoidCallback onPressed;

  _Menu({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

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
          onPressed: onPressed,
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
