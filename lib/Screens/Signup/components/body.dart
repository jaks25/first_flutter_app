import 'package:first_flutter_app/Screens/Login/login__screen.dart';
import 'package:first_flutter_app/Screens/Signup/components/background.dart';
import 'package:first_flutter_app/authentication_service.dart';
import 'package:first_flutter_app/components/already_have_an_account_check.dart';
import 'package:first_flutter_app/components/rounded_button.dart';
import 'package:first_flutter_app/components/rounded_input_field.dart';
import 'package:first_flutter_app/components/rounded_passwordfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    String _email;
    String _password;
    return Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Zarejestruj się",
                  style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.02),
              SvgPicture.asset("assets/icons/Veterinarian.svg",
                height: size.height * 0.2,
              ),
              SizedBox(height: size.height * 0.02),
              RoundedInputField(
                fieldController: emailController,
                hintText: "Adres e-mail",
                onChanged: (value) {
                  _email = value;
                },
              ),
              RoundedPasswordField(
                fieldController: passwordController,
                onChanged: (value) {
                  _password = value;
                },
              ),
              RoundedButton(
                  text: "Zarejestruj się",
                  press: () {
                    context.read<AuthenticationService>().signUp(
                      email: _email,
                      password: _password,
                    );
                    Future.delayed(Duration(seconds: 1)).then((_){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    });
                  },
              ),
              SizedBox(height: size.height * 0.02),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}


