import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_flutter_app/constants.dart';
import 'package:flutter/material.dart';


class DiagnosisStepsScreen extends StatefulWidget {

  final DocumentSnapshot diagnose;

  DiagnosisStepsScreen({this.diagnose});

  @override
  _DiagnosisStepsScreenState createState() => _DiagnosisStepsScreenState();
}

class _DiagnosisStepsScreenState extends State<DiagnosisStepsScreen> {

  DocumentSnapshot patientSnap;
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AppBar(
                title: Text("Kroki diagnozy"),
                backgroundColor: kHomeBox,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('diagnosesSteps').where("diagnoseId", isEqualTo: widget.diagnose.id).orderBy("timeStamp").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

                  if (snapshot.hasError){
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: snapshot.data.documents.map((DocumentSnapshot document) {
                        return InkWell(
                          child: Card(
                            color: kHomeBox,
                            child: ListTile(
                              title: Text("Pytanie: " + document.data()['taskOrQuestion']),
                              subtitle: Text("Opdowiedź: " + document.data()['choice'].toString()),

                            ),
                          ),
                        );
                      }).toList());
                },
              )
            ],
          ),
      )
    );
  }
}