import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_flutter_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/Screens/PatientsList/components/body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:first_flutter_app/components/rounded_button.dart';
import 'package:first_flutter_app/components/rounded_input_field.dart';

class PatientDetail extends StatefulWidget {

  final DocumentSnapshot patient;

  PatientDetail({this.patient});



  @override
  _PatientDetailState createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  String _nameAnimal;
  String _nameOwner;
  double _ageAnimal;
  double _weightAnimal;
  String _genderAnimal;
  String _strainAnimal;
  String _doctorMail;
  String _speciesAnimal;

  void PatientDelete(patient) async {
    // DocumentReference documentReference = await Firestore.instance.collection('patients').document();
    // CollectionReference collectionReference = Firestore.instance.collection('patients');
    // collectionReference.document(patient.id);
    // documentReference.delete().whenComplete(() {
    //   print("Delete completed");
    //   Navigator.pop(context);
    // });
    await Firestore.instance.collection('patients').document(patient.id).delete().whenComplete(() {
      print("Delete completed");
      Navigator.pop(context);
    });
  }

  updatePatient(patient) {
    Map<String,dynamic> animalData = {
      "_nameAnimal" : _nameAnimal,
      "_nameOwner" : _nameOwner,
      "_ageAnimal" : _ageAnimal,
      "_weightAnimal" : _weightAnimal,
      "_genderAnimal" : _genderAnimal,
      "_strainAnimal" : _strainAnimal,
      "_doctorMail": _doctorMail,
      "_speciesAnimal" : _speciesAnimal,
    };

    Firestore.instance.collection('patients').document(patient.id).updateData(animalData).whenComplete(() {
      print("Update completed");
      Navigator.pop(context);
    });
  }

  void GetData(patient) async {
    _nameAnimal     = patient.data()['_nameAnimal'].toString();
    _nameOwner      = patient.data()['_nameOwner'].toString();
    _ageAnimal      = patient.data()['_ageAnimal'];
    _weightAnimal   = patient.data()['_weightAnimal'];
    _genderAnimal   = patient.data()['_genderAnimal'].toString();
    _strainAnimal   = patient.data()['_strainAnimal'].toString();
    _doctorMail     = patient.data()['_doctorMail'].toString();
    _speciesAnimal  = patient.data()['_speciesAnimal'].toString();
  }

  createAlertDialog(BuildContext context, String field, currentValue, String fieldName, patient) {
    TextEditingController customController = TextEditingController();
    customController.text = currentValue.toString();

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(field),
        content: TextField(
          controller: customController,
          onChanged: (value) {
                  currentValue = value;
                  print(currentValue);
            },
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('Zapisz'),
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(29),
            ),
            color: kHomeBox,
            onPressed: () {
              //updatePatient(patient);
              if (fieldName == '_nameAnimal') {
                _nameAnimal = currentValue.toString();
              }
              updatePatient(patient);
              print(_nameAnimal);
              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PatientDetail(patient: patient)));
              //Navigator.of(context).pop();
              Navigator.pop(context);
            },
          )
        ],
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DocumentSnapshot document = widget.patient;
    GetData(widget.patient);
    return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              SizedBox(height: size.height * 0.05),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(width: size.width * 0.7),
                  IconButton(
                    onPressed: () {
                      PatientDelete(widget.patient);
                    },
                    icon: Icon(Icons.delete, color: Colors.black),
                    alignment: Alignment.topRight,
                  ),
                ]
              ),
              Card(
                color: kHomeBox,
                child: Column(
                  children: [
                    Card(
                          child: ListTile(
                            title: Text(widget.patient.id.toString()),
                            subtitle: Text("Key"),
                          )
                    ),
                    InkWell(
                        onTap: () {
                          print("_nameAnimal Pressed");
                          createAlertDialog(context, 'Imię zwierzęcia', _nameAnimal, '_nameAnimal', widget.patient);
                          GetData(widget.patient);
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(_nameAnimal),
                            subtitle: Text("Imię zwierzęcia"),
                          )
                        )
                    ),
                    Card(
                      child: ListTile(
                        title: Text(_nameOwner),
                        subtitle: Text("Właściciel"),
                      )
                    ),
                    Card(
                      child: ListTile(
                        title: Text(_genderAnimal),
                        subtitle: Text("Gatunek"),
                      )
                    ),
                    Card(
                      child: ListTile(
                        title: Text(_weightAnimal.toString() + "kg"),
                        subtitle: Text("Waga"),
                      )
                    ),
                  ]
                ),
              ),
              RoundedButton(
                text: "Zapisz",
                color: kHomeBox,
                press: () {},
                textColor: Colors.white,
              )
            ]
          )
    );
  }
}