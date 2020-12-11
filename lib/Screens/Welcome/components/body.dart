import 'package:first_flutter_app/Screens/Login/login__screen.dart';
import 'package:first_flutter_app/Screens/Welcome/components/background.dart';
import 'package:first_flutter_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/components/rounded_button.dart';
import 'package:first_flutter_app/Screens/Signup/signup_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:first_flutter_app/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final firebaseUser = context.watch<User>();
    return Background(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget> [
                Align(
                  alignment: Alignment.center,
                ),
                SizedBox(height: size.height * 0.09),
                // SvgPicture.asset("assets/icons/Veterinarian.svg",
                //   height: size.height * 0.35,
                // ),
                SvgPicture.network("https://www.svgrepo.com/show/295861/veterinarian.svg",
                  height: size.height * 0.35,),
                SizedBox(height: size.height * 0.13),
                RoundedButton(
                  text: "Zaloguj się",
                  textColor: Colors.black,//kPrimaryLightColor,
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
                SizedBox(height: size.height * 0.01),
                RoundedButton(
                  text: "Utwórz konto",
                  color: kPrimaryLightColor,
                  textColor: Colors.black,//kPrimaryColor,
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
                SizedBox(height: size.height * 0.05),
                RoundedButton(
                  text: "Wyloguj się",
                  color: kPrimaryLightColor,
                  textColor: Colors.black,//kPrimaryColor,
                  press: () {
                    context.read<AuthenticationService>().signOut();
                  },
                  show: firebaseUser != null ? 'y' : 'n'
                ),
              ],
            )
        )
    );
  }
}



