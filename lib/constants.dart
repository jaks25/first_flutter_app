import 'package:flutter/material.dart';

//const kPrimaryColor = Color(0xFF6F35A5);
// const kPrimaryColor = Color(0xFFAB47BC);
// const kPrimaryLightColor = Color(0xFFF1E6FF);
//const kPrimaryColor = Color(0xFF1DE9B6);
const kPrimaryColor = Color(0xFF64DD17);
const kPrimaryLightColor = Color(0xFFFFA726);
const kDrawerColor = Color(0xFF689F38);
const kHomeBox = Color(0xFF81C784);

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0,10))
];

List<Map> categories = [
  {'name': 'Cat', 'iconPath': 'assets/images/cat.png'},
  {'name': 'Dog', 'iconPath': 'assets/images/dog.png'},
  {'name': 'Bunnie', 'iconPath': 'assets/images/rabbit.png'},
  {'name': 'Pig', 'iconPath': 'assets/images/pig.png'},
  {'name': 'Horse', 'iconPath': 'assets/images/horse.png'},
  {'name': 'Cow', 'iconPath': 'assets/images/cow.png'},
];