import 'package:first_flutter_app/Screens/Diagnosis/symptoms_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_flutter_app/globals.dart';
import 'package:first_flutter_app/constants.dart';

class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  String getSpeciesIcon(String species){
    for (var i = 0; i < categories.length; i++){
      if (categories[i]['name'] == species) {
        return categories[i]['iconPath'];
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
          children: <Widget>[

            AppBar(
                title: Text("Wybierz Pacjenta"),
                backgroundColor: kHomeBox,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('patients').where("_doctorMail", isEqualTo: currentUserEmail).snapshots(),
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
                    children: snapshot.data.documents.map((DocumentSnapshot document){
                      return InkWell(
                          child: Card(
                              color: kHomeBox,
                              child: Row(
                                  children: [
                                    Expanded(
                                    child: ListTile(
                                      title: Text("Właściciel: " + document.data()['_nameOwner'].toString()),
                                      subtitle: Text("Imię zwierzęcia: " + document.data()['_nameAnimal'].toString()),
                                    )
                                  ),
                                  Expanded(
                                  child: Image.asset(
                                  getSpeciesIcon(document.data()['_speciesAnimal']),
                                  height: size.height * 0.055,
                                  width:  size.width * 0.055,)
                                  ),
                                ],
                              ),
                          ),
                          onTap: ()  {
                            print("pressed");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SymptomsListScreen(document);;
                                },
                              ),
                            );
                          }
                      );
                    }).toList());
              },
            ),
          ]
      ),
    );
  }
}



