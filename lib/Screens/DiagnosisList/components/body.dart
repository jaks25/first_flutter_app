import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_flutter_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/globals.dart';


class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DocumentSnapshot patientSnap;
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Postawione diagnozy"),
            backgroundColor: kHomeBox,
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('diagnoses').where("_doctorMail", isEqualTo: currentUserEmail).snapshots(),
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
                  DocumentSnapshot patient;
                  Future<DocumentSnapshot> patientStream;
                  print(document.data()['_patientId'].toString());
                  patientStream = FirebaseFirestore.instance.collection('patients').document(document.data()['_patientId']).get();
                  patientStream.then((DocumentSnapshot patientSnapshot){
                    patientSnap = patientSnapshot;
                  });
                  return InkWell(
                    child: Card(
                      color: kHomeBox,
                      child: ListTile(

                        title: Text("Choroba: " + document.data()['_disease']),
                        subtitle: Text("Pacjent: " + patientSnap.data()['_nameOwner'].toString()),

                      ),
                    ),
                  );
                }).toList());
            },
          )
        ],
      ),
    );
  }
}