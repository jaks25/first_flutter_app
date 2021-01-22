import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_flutter_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/globals.dart';


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
      body: Column(
        children: <Widget>[
          AppBar(
            title: Text("Postawiona diagnoza"),
            backgroundColor: kHomeBox,
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('diagnosesSteps').where("diagnoseId", isEqualTo: widget.diagnose.id).snapshots(),
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
              print(snapshot);

              return ListView(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: snapshot.data.documents.map((DocumentSnapshot document){
                  print(document.data()['diagnoseId'].toString());
                  Map<String, dynamic> data = document.data();
                  print(data);
                  return InkWell(
                    child: Card(
                      color: kHomeBox,
                      child: ListTile(
                        title: Text("Test" + document.data()['diagnoseId'].toString()),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          )
        ],
      ),
    );
  }
}