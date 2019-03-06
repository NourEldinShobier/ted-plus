// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ripple-layout.widget.dart';

// **************************************************************************
// Generator: FunctionalWidget
// **************************************************************************

class RippleLayout extends StatelessWidget {
  const RippleLayout(
      {Key key,
      @required this.child,
      @required this.onPress,
      @required this.borderRadius})
      : super(key: key);

  final Icon child;

  final void Function() onPress;

  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext _context) =>
      rippleLayout(child: child, onPress: onPress, borderRadius: borderRadius);
  @override
  int get hashCode => hashValues(child, onPress, borderRadius);
  @override
  bool operator ==(Object o) =>
      identical(o, this) ||
      (o is RippleLayout &&
          child == o.child &&
          onPress == o.onPress &&
          borderRadius == o.borderRadius);
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Icon>('child', child));
    properties.add(ObjectFlagProperty<dynamic>.has('onPress', onPress));
    properties
        .add(DiagnosticsProperty<BorderRadius>('borderRadius', borderRadius));
  }
}
