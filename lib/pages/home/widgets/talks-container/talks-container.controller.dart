import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../../../../utils/talk.util.dart';
/* import '../../../../routes.dart'; */

class TalksContainerController extends ChangeNotifier {
  String title;
  String subTitle;

  List<Talk> talks;

  PageController pageController = PageController(viewportFraction: 0.9);
  double pageOffset = 0;

  void init() {
    pageController.addListener(() {
      pageOffset = pageController.page;
      notifyListeners();
    });
  }

  /* void title_onPressed(BuildContext context) {
    Router.navigateToTalks(context, title);
  } */
}
