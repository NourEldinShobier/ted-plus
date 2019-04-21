import 'package:flutter/material.dart';
import 'package:ted_plus/shared/widgets/widgets.module.dart';
import 'package:ted_plus/shared/styles/styles.module.dart' as Styles;

part 'app-bar.state.dart';
part 'app-bar.view.dart';

class TAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final ScrollController scrollController;

  TAppBar({
    Key key,
    @required this.title,
    @required this.scrollController,
  }) : super(key: key);

  @override
  TAppBarView createState() => TAppBarView();
  Size get preferredSize => Size.fromHeight(64);
}
