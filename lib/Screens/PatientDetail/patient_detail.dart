import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/Screens/PatientsList/components/body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class PatientDetail extends StatefulWidget {

  final DocumentSnapshot patient;

  PatientDetail({this.patient});

  @override
  _PatientDetailState createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //DocumentSnapshot document = widget.patient.data()['_nameOwner'];
    return Scaffold(
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
          ]
        ),
        Card(
        child: Column(
          children: [
            ListTile(
              title: Text(widget.patient.data()['_nameAnimal'].toString()),
              subtitle: Text("Imię zwierzęcia"),
            ),
            ListTile(
              title: Text(widget.patient.data()['_nameOwner'].toString()),
              subtitle: Text("Właściciel"),
            ),
            ListTile(
              title: Text(widget.patient.data()['_genderAnimal'].toString()),
              subtitle: Text("Gatunek"),
            ),
            ListTile(
              title: Text(widget.patient.data()['_weightAnimal'].toString() + "kg"),
              subtitle: Text("Waga"),
            ),
          ]
        ),
      ),

      ]
        )
    );
  }
}