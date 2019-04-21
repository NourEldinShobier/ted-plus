import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:ted_plus/shared/styles/styles.module.dart' as Styles;
import 'package:ted_plus/shared/widgets/widgets.module.dart';

part 'app-bar.state.dart';
part 'app-bar.view.dart';

class TAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ScrollController scrollController;
  TAppBar({
    Key key,
    @required this.scrollController,
  }) : super(key: key);

  TAppBarView createState() => TAppBarView();
  Size get preferredSize => Size.fromHeight(64);
}
