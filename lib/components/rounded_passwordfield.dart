import 'package:first_flutter_app/components/text_filed_container.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController fieldController;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.fieldController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: fieldController,
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Hasło",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}