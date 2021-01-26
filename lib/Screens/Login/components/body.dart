import 'package:first_flutter_app/Screens/Welcome/welcome_screen.dart';
import 'package:first_flutter_app/Screens/Signup/signup_screen.dart';
import 'package:first_flutter_app/authentication_service.dart';
import 'package:first_flutter_app/components/rounded_button.dart';
import 'package:first_flutter_app/components/rounded_passwordfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/Screens/Login/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_flutter_app/components/rounded_input_field.dart';
import 'package:first_flutter_app/components/already_have_an_account_check.dart';
import 'package:provider/provider.dart';



class Body extends StatelessWidget {
  const Body({
    Key key,
    @required
    this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String _email;
    String _password;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Zaloguj się",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: SvgPicture.network("https://www.svgrepo.com/show/295861/veterinarian.svg",
                height: size.height * 1.5,),
              iconSize: size.height * 0.15,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              }
            ),
            SizedBox(height: size.height * 0.02),
            RoundedInputField(
              hintText: "Adres e-mail",
              onChanged: (value) {
                _email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _password = value;
              },
            ),
            RoundedButton(
                text: "Zaloguj się",
                textColor: Colors.black,
                press: () {
                  context.read<AuthenticationService>().signIn(
                    email: _email,
                    password: _password,

                  );
                },
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








