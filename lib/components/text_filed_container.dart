import 'package:flutter/material.dart';
import 'package:first_flutter_app/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double verticalMargin;
  const TextFieldContainer({
    Key key,
    @required
    this.child,
    this.color = kPrimaryLightColor,
    this.verticalMargin = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(29),
        //BlendMode: BlendMode.dstATop,
      ),
      child: child,
    );
  }
}