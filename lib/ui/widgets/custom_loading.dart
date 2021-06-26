import 'package:flutter/material.dart';
import 'package:konsolto_app/res/colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
          width: 32,
          height: 32,
          margin: EdgeInsets.only(top: 16),
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(MColors.primary_color),
          )),
    );
  }
}
