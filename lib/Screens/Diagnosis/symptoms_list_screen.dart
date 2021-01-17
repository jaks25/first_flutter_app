import 'package:first_flutter_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/symptoms/symptoms.dart';
import 'package:first_flutter_app/Screens/Diagnosis/symptom_test_screen.dart';

class SymptomsListScreen extends StatefulWidget {
  DocumentSnapshot patient;

  SymptomsListScreen(this.patient);

  @override
  _SymptomsListScreenState createState() => _SymptomsListScreenState();
}

class _SymptomsListScreenState extends  State<SymptomsListScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DocumentSnapshot document = widget.patient;
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                AppBar(
                  title: Text("Lista Objawów"),
                  backgroundColor: kHomeBox,
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: symptomsName.length,
                  itemBuilder: (context, index) {
                    return Column(
                        children: [
                          InkWell(
                              child: Card(
                                  color: kHomeBox,
                                  child: ListTile(
                                    title: Text(symptomsName[index]['name']),
                                  onTap: () {
                                      if (document != null) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return SymptomTestScreen(
                                                  symptomsName[index]['code']
                                                      .toString(), document);
                                            },
                                          ),
                                        );
                                      }
                                  },
                                  )
                              )
                          )
                        ]
                    );
                  },
                ),
              ]
          )
          ),
        )
    );
  }
}