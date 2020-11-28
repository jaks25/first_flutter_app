import 'package:flutter/material.dart';
import 'package:first_flutter_app/components/text_filed_container.dart';
import 'package:first_flutter_app/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController fieldController;
  final Color color, textColor, iconColor;
  final double verticalMargin;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.fieldController,
    this.color = kPrimaryColor,
    this.textColor = kPrimaryLightColor,
    this.iconColor = kPrimaryLightColor,
    this.verticalMargin,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFieldContainer(
      child: TextField(
        controller: fieldController,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: iconColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
          fillColor: color,
          focusColor: textColor,
        ),
      ),
      color: color,
      verticalMargin: verticalMargin,
    );
  }
}