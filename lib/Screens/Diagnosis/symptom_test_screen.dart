import 'package:first_flutter_app/constants.dart';
import 'package:first_flutter_app/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/symptoms/symptoms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SymptomTestScreen extends StatefulWidget {

  final String symptomCode;
  DocumentSnapshot patient;

  SymptomTestScreen(this.symptomCode, this.patient);
  @override
  _SymptomTestScreenState createState() => _SymptomTestScreenState(symptomCode);
}

class Option {
  String taskOrQuestion;
  String optionText;
  String optionNode;
  Option({this.optionText, this.optionNode, this.taskOrQuestion});
}

class _SymptomTestScreenState extends  State<SymptomTestScreen> {
  List<Map> mydata = [];
  final String symptomCode;
  int iterator = 1;
  bool buttonVisible = true;

  Map<String,String> patientDiagnose = {};
  Map<String,String> patientDiagnoseSteps = {};
  Map<String,String> patientDiagnoseStep = {};

  _SymptomTestScreenState(this.symptomCode);

  void getData(){
    for (int i = 0; i < symptomTests.length; i++){
      if (symptomTests[i]['symptom'] == symptomCode){
        print(symptomTests[i]);
        mydata.add(symptomTests[i]);
      }
    }
  }

  addDiagnose(){
    CollectionReference collectionReference = Firestore.instance.collection('diagnoses');
    collectionReference.add(patientDiagnose).then((value){
      CollectionReference collectionReference2 = Firestore.instance.collection('diagnosesSteps');
      int iterator = 0;
      for (var i in patientDiagnoseSteps.keys){
        collectionReference2.add({
          'timeStamp': FieldValue.serverTimestamp(),
          'diagnoseId': value.id.toString(),
          'taskOrQuestion': i.toString(),
          'choice' : patientDiagnoseSteps[i].toString(),
        });
        iterator++;
      }
    });
  }

  void createDiagnose(Option chosenOption){
    Map<String,String> step = {};
    patientDiagnoseSteps.putIfAbsent(chosenOption.taskOrQuestion, () => chosenOption.optionText);
  }

  createAlertDialog(BuildContext context, String textField) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(
            textField,
        textAlign: TextAlign.center,),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('Ok'),
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(29),
            ),
            color: kHomeBox,
            onPressed: () {
              print(patientDiagnoseSteps);
              addDiagnose();
              Navigator.pop(context);
            },
          )
        ],
      );

    });
  }

  String takeTaskOrQuestion(int id){
    print("przyszło" + id.toString());
    for (int i = 0; i < mydata.length; i++) {
      if (mydata[i]['id'] == id){
        print('tutaj' + mydata[i]['id'].toString());
        if ( mydata[i]['question'] == '' ) {
          return mydata[i]['task'];
        }else {
          return mydata[i]['question'];
        }
      }
    }
    return "Spróbuj jeszcze raz";
  }


  Option takeOption(int id, String option) {
    Option outputOption = Option();
    for (int i = 0; i < mydata.length; i++) {
      if (mydata[i]['id'] == id){
        if (option == 'optionA'){
          outputOption.optionText = mydata[i]['optionA'];
          outputOption.optionNode = mydata[i]['optionANode'];
          if ( mydata[i]['question'] == '' ) {
            outputOption.taskOrQuestion = mydata[i]['task'];
          }else {
            outputOption.taskOrQuestion = mydata[i]['question'];
          }
          return outputOption;
        }else if (option == 'optionB') {
          outputOption.optionText = mydata[i]['optionB'];
          outputOption.optionNode = mydata[i]['optionBNode'];
          if ( mydata[i]['question'] == '' ) {
            outputOption.taskOrQuestion = mydata[i]['task'];
          }else {
            outputOption.taskOrQuestion = mydata[i]['question'];
          }
          return outputOption;
        }
      }
    }
    outputOption.optionText = 'X';
    outputOption.optionNode = 'X';
    return outputOption;
  }

  void nextStep(int id){
    print("NextStep: " + id.toString());
    for (int i = 0; i < mydata.length; i++) {
      print(mydata[i]['id']);
      if (mydata[i]['id'] == id) {
        setState(() {
          print("seting:" + id.toString());
          iterator = id;
        });
        break;
      }
    }
  }

  void checkIfLast(int id){
    for (int i = 0; i < mydata.length; i++) {
      if (mydata[i]['id'] == id
          && mydata[i]['optionANode'] == ''
          && mydata[i]['optionBNode'] == '') {
        createAlertDialog(context, mydata[i]['task']);
        setState(() {
          buttonVisible = false;
        });
        break;
      }
    }
    nextStep(id);
  }

  Widget choiceButton(int id, String option){
    Option buttonOption = Option();
    buttonOption = takeOption(id, option);

    return Visibility(
        visible: buttonVisible,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: MaterialButton(
            onPressed: ()  {
              print("Pressed");
              checkIfLast(int.parse(buttonOption.optionNode));
              createDiagnose(buttonOption);
              print(iterator);
            },
            child: Text(
              buttonOption.optionText,
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
        )
    );
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getData();
    print(mydata);
    patientDiagnose.putIfAbsent('_doctorMail', () => currentUserEmail);
    patientDiagnose.putIfAbsent('_nameOwner', () => widget.patient.data()['_nameOwner'].toString());
    patientDiagnose.putIfAbsent('_nameAnimal', () => widget.patient.data()['_nameAnimal'].toString());
    patientDiagnose.putIfAbsent('_patientId', () => widget.patient.id.toString());
    patientDiagnose.putIfAbsent('_disease', () => mydata[0]['description'].toString());
    patientDiagnose.putIfAbsent('_symptom', () => mydata[0]['symptom'].toString());
    return  Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text( takeTaskOrQuestion(iterator),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choiceButton(iterator, 'optionA'),
                    choiceButton(iterator, 'optionB'),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}