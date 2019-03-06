import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'screens/talks/talks.module.dart';

import 'screens/home/home.module.dart';

main(List<String> args) => runApp(App());

class App extends StatelessWidget {
  final GlobalKey globalKey = GlobalKey();

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
      ),
    );

    return MaterialApp(
      key: globalKey,
      title: 'TED LAB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(accentColor: Colors.black12),
      home: HomeScreen() /* TalksScreen(
        title: 'Most Viewed',
      ) */
          ,
    );
  }
}
