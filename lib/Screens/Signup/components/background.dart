import 'package:flutter/material.dart';


class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.size,
    @required this.child,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            child: Image.asset("assets/images/vet_pic2.jpg",
              height: size.height,
              width: double.infinity,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.15),
              colorBlendMode: BlendMode.dstATop,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/images/right_top_signup_2.png",
              width: size.width * 0.65,
            ),
          ),
          //Positioned(
          //  bottom: 0,
          //  right: 0,
          //  child: Image.asset(
          //    "assets/images/signup_right_bottom.png",
          //    width: size.width * 0.30,
          //  ),
          //),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/left_bottom_signup_2.png",
              width: size.width * 0.35,
            ),
          ),
          child
        ],
      ),
    );
  }
}