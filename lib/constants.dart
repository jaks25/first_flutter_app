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
  {'name': 'Kot', 'iconPath': 'assets/images/cat.png'},
  {'name': 'Pies', 'iconPath': 'assets/images/dog.png'},
  {'name': 'Królik', 'iconPath': 'assets/images/rabbit.png'},
  {'name': 'Świnia', 'iconPath': 'assets/images/pig.png'},
  {'name': 'Koń', 'iconPath': 'assets/images/horse.png'},
  {'name': 'Krowa', 'iconPath': 'assets/images/cow.png'},
];