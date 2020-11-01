import 'package:first_flutter_app/Screens/Signup/signup_screen.dart';
import 'package:first_flutter_app/components/rounded_button.dart';
import 'package:first_flutter_app/components/rounded_passwordfield.dart';
import 'package:first_flutter_app/components/text_filed_container.dart';
import 'package:first_flutter_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/Screens/Login/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_flutter_app/components/rounded_input_field.dart';
import 'package:first_flutter_app/components/already_have_an_account_check.dart';
import 'package:first_flutter_app/Screens/Signup/signup_screen.dart';


class Body extends StatelessWidget {
  const Body({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Zaloguj się",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset("assets/icons/dog_with_owner_icon.svg",
              height: size.height * 0.15,
            ),
            SizedBox(height: size.height * 0.02),
            RoundedInputField(
              hintText: "Adres e-mail",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
                text: "Zaloguj się",
                press: () {},
            ),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                      },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}








