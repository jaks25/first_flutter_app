import 'dart:convert';

import 'package:first_flutter_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/symptoms/symptoms.dart';
import 'package:first_flutter_app/Screens/Diagnosis/symptoms_list_screen.dart';

class SymptomTestScreen extends StatefulWidget {

  final String symptomCode;

  SymptomTestScreen(this.symptomCode);
  @override
  _SymptomTestScreenState createState() => _SymptomTestScreenState(symptomCode);
}

class _SymptomTestScreenState extends  State<SymptomTestScreen> {
  List<Map> mydata = [];
  final String symptomCode;
  int iterator = 2;
  bool buttonVisible = true;

  _SymptomTestScreenState(this.symptomCode);

  void getData(){
    for (int i = 0; i < symptomTests.length; i++){
      if (symptomTests[i]['symptom'] == symptomCode){
        print(symptomTests[i]);
        mydata.add(symptomTests[i]);
      }
    }
  }

  void nextStep(String id){
    for (int i = 0; i < mydata.length; i++)
      if (mydata[i]['id'] == id){
        setState(() {
          iterator++;
        });
        break;
      }
  }

  void checkIfLast(String id){
    for (int i = 0; i < mydata.length; i++)
      if (mydata[i]['id'] == id
          && mydata[i]['optionANode'] == ''
          && mydata[i]['optionBNode'] == ''){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SymptomsListScreen();
            },
          ),
        );
        break;
      }else{
        nextStep(id);
      }
  }

  Widget choiceButton(String k){
    return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: MaterialButton(
            onPressed: ()  {
              print("Pressed");
              nextStep(k);
            },
            child: Text(
              mydata[iterator]['question'] == '' ? mydata[iterator]['task'] : mydata[iterator]['question'],
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: kHomeBox,
            splashColor: Colors.lime,
            highlightColor: Colors.lime,
            minWidth: 200,
            height: 45.0,
            shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
          ),
        );
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getData();
    print(mydata);
    return  Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text( mydata[iterator]['question'] == '' ? mydata[iterator]['task'] : mydata[iterator]['question'],
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: AbsorbPointer(
              absorbing: buttonVisible,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choiceButton(mydata[iterator]['optionANode']),
                    choiceButton(mydata[iterator]['optionBNode']),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}