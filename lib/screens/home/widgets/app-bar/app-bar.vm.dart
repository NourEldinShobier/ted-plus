part of 'app-bar.widget.dart';

abstract class TAppBarViewModel extends State<TAppBar> {
  HomeScreen _homeScreen;

  @protected
  bool dropShadow = false;

  initState() {
    _homeScreen = context.ancestorWidgetOfExactType(HomeScreen);
    _homeScreen.scrollController.addListener(() {
      double offset = _homeScreen.scrollController.offset;

      if (offset == 0 && dropShadow) setState(() => dropShadow = false);
      if (offset > 0 && !dropShadow) setState(() => dropShadow = true);
    });
    super.initState();
  }

  onMenuPressed() {}
}
