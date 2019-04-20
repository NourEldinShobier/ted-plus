import 'package:ted_plus/shared/styles/styles.module.dart' as Styles;
import 'package:flutter/material.dart';
import 'package:ted_plus/fake-data.dart';

class FieldsList extends StatefulWidget {
  FieldsList({Key key}) : super(key: key);
  createState() => _FieldsListState();
}

class _FieldsListState extends State<FieldsList> {
  List<FieldRadioModel> fieldsModels;

  @override
  void initState() {
    super.initState();

    fieldsModels = List();

    FakeData.fields.forEach((field) {
      fieldsModels.add(FieldRadioModel(false, field));
    });

    fieldsModels[0].isSelected = true;
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        itemCount: fieldsModels.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 18),
        physics: AlwaysScrollableScrollPhysics(),
        separatorBuilder: (_, __) => SizedBox(width: 8),
        itemBuilder: (_, index) {
          return Material(
            clipBehavior: Clip.antiAlias,
            type: MaterialType.transparency,
            borderRadius: BorderRadius.circular(100),
            child: InkResponse(
              highlightColor: Colors.transparent,
              radius: 150.0,
              onTap: () {
                setState(() {
                  fieldsModels.forEach(
                    (field) => field.isSelected = false,
                  );
                  fieldsModels[index].isSelected = true;
                });
              },
              child: FieldRadio(
                key: ValueKey('field.$index'),
                model: fieldsModels[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FieldRadio extends StatelessWidget {
  final FieldRadioModel model;

  final Color bgColor = Colors.transparent;
  final Color activBGColor = Styles.Colors.grey.withOpacity(0.10);

  final Color textColor = Styles.Colors.greyLight;
  final Color activTextColor = Styles.Colors.grey;

  FieldRadio({
    Key key,
    this.model,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color: model.isSelected ? activBGColor : bgColor,
      ),
      child: Text(
        '#${model.text}',
        style: TextStyle(
          color: model.isSelected ? activTextColor : textColor,
          fontFamily: 'GoogleMedium',
        ),
      ),
    );
  }
}

class FieldRadioModel {
  bool isSelected;
  final String text;

  FieldRadioModel(this.isSelected, this.text);
}
