import 'package:flutter/material.dart';
import 'package:ted_plus/shared/widgets/widgets.module.dart';
import 'package:ted_plus/shared/styles/styles.module.dart' as Styles;

class AccountScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    var appBar = SizedBox(
      width: double.infinity,
      height: 72 + statusBarHeight,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 8, top: 8),
          child: RippleLayout(
            borderRadius: BorderRadius.circular(100),
            child: Icon(
              Icons.more_vert,
              color: Styles.Colors.greyLight,
              size: 24,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );

    return SizedBox.expand(
      child: Column(
        children: <Widget>[
          appBar,
          SizedBox(height: 10),
          Text(
            'Account',
            style: TextStyle(
              color: Color(0xFF202124),
              fontSize: 32,
            ),
          ),
          SizedBox(height: 40),
          Row(
            children: <Widget>[
              _Image(),
              SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nour El-Din Shobier',
                    style: TextStyle(
                      color: Color(0xFF202124),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'GoogleMedium',
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'nour.eldin.shobier@gmail.com',
                    style: TextStyle(
                      color: Styles.Colors.greyLight,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            height: 2,
            margin: EdgeInsets.only(top: 16),
            color: Styles.Colors.greyLight.withOpacity(0.25),
          )
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: SizedBox(
        width: 36,
        height: 36,
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
