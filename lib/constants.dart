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
  {'name':            'Kot',
   'iconPath':        'assets/images/cat.png',
   'picturePath':     'assets/images/cat_image.png',
   'hintText':        'Imię kota',
   'iconInputField':  Icons.pest_control_rodent
  },
  {'name':            'Pies',
   'iconPath':        'assets/images/dog.png',
   'picturePath':     'assets/images/dog_image.png',
   'hintText':        'Imię psa',
   'iconInputField':  Icons.pets
  },
  {'name': 'Królik', 'iconPath': 'assets/images/rabbit.png', 'picturePath': 'assets/images/upgrade.png'},
  {'name': 'Świnia', 'iconPath': 'assets/images/pig.png', 'picturePath': 'assets/images/upgrade.png'},
  {'name': 'Koń', 'iconPath': 'assets/images/horse.png', 'picturePath': 'assets/images/upgrade.png'},
  {'name': 'Krowa', 'iconPath': 'assets/images/cow.png', 'picturePath': 'assets/images/upgrade.png'},
];

List<Map> symptoms = [
  {
    'name': 'Biegunka',
    'symbol': 'B'
  }
];