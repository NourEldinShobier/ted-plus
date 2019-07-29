import 'package:flutter/material.dart';

import '../../shared/styles/styles.module.dart' as Styles;

class DiscoverScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[Header()],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            blurRadius: 2.0,
            color: Color(0xFFD1D1D1),
          )
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(width: 7),
          Icon(
            Icons.search,
            color: Styles.Colors.greyLight,
          ),
          SizedBox(width: 4),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Search for talks",
                style: TextStyle(
                  color: Styles.Colors.greyLight,
                  fontSize: 16,
                  fontFamily: 'GoogleRegular',
                ),
              ),
            ),
          ),
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(right: 8),
            child: ClipOval(
              child: Image(
                image: AssetImage('assets/img/profileImg.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            width: 24,
            height: 24,
            color: Colors.transparent,
            child: Icon(
              Icons.more_vert,
              color: Styles.Colors.greyLight,
            ),
          ),
          SizedBox(width: 6),
        ],
      ),
    );
  }
}
