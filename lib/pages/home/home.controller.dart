import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ted_plus/utils/talk.util.dart';

class HomePageController extends ChangeNotifier {
  final List<String> thumbnailsTitles = [
    'Newest',
    'Most Viewed',
    'Trending',
  ];
  final List<String> thumbnailsSubTitles = [
    'Watch recent talks',
    'Top 3 talks right now',
    'Discover trending talks',
  ];

  final scrollController = ScrollController();

  // (0) topNewest, (1) topMostViewed, (2) topMostTreding
  var mainTalks = List<List<Talk>>(3);
  var user; // assign it too, talks book mark event need it

  void init() {}
}
