import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ted_plus/shared/styles/styles.module.dart' as Styles;
import 'package:ted_plus/shared/widgets/widgets.module.dart';

import '../../home.controller.dart';
import 'app-bar.controller.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  final appBar = TAppBarController();

  TAppBar({Key key}) : super(key: key);

  get preferredSize => Size.fromHeight(64);

  Widget build(BuildContext context) {
    var homePage = Provider.of<HomePageController>(context);

    appBar.shadowController = homePage.scrollController;
    appBar.init();

    return ChangeNotifierProvider<TAppBarController>.value(
      child: TAppBarBody(),
      notifier: appBar,
    );
  }
}

class TAppBarBody extends StatelessWidget {
  Widget build(BuildContext context) {
    var appBar = Provider.of<TAppBarController>(context);
    var statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, appBar.dropShadow ? 0.12 : 0.0),
            offset: Offset(0, 0),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(child: _Search()),
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
              fontSize: 20,
            ),
          ),
          SizedBox(width: 5),
          Text(
            'Talks',
            style: TextStyle(
              color: Styles.Colors.greyLight,
              fontFamily: 'GoogleMedium',
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}

class _Search extends StatelessWidget {
  Widget build(BuildContext context) {
    var appBar = Provider.of<TAppBarController>(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 12),
        child: RippleLayout(
          width: 40,
          height: 40,
          borderRadius: BorderRadius.circular(100),
          child: Icon(
            Icons.search,
            color: Styles.Colors.greyLight,
            size: 24,
          ),
          onPressed: appBar.searchButton_onPressed,
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24),
      child: SizedBox(
        width: 28,
        height: 28,
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
