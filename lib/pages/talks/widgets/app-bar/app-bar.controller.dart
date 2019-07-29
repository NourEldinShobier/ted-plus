part of 'app-bar.widget.dart';

abstract class TAppBarController extends State<TAppBar> {
  bool dropShadow = false;

  initState() {
    widget.scrollController.addListener(() {
      double offset = widget.scrollController.offset;

      if (offset == 0 && dropShadow) setState(() => dropShadow = false);
      if (offset > 0 && !dropShadow) setState(() => dropShadow = true);
    });

    super.initState();
  }
}
