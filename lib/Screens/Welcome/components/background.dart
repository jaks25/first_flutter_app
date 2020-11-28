import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) :super(key: key);

  @override
  Widget build(BuildContext context){
    Size size =MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Image.asset("assets/images/vet_pic2.jpg",
                height: size.height,
                width: double.infinity,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.4),
                colorBlendMode: BlendMode.dstATop,

                ),
            ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/left_top_login_2.png",
              width: size.width * 0.5,
            ),
          ),
          //Positioned(
          //  bottom: 0,
          //  right: 0,
          //  child: Image.asset(
          //    "assets/images/right_bottom_login_2.png",
          //    width: size.width * 0.5,
          //  ),
          //),
          child,
        ],
    ),
    );
  }
}