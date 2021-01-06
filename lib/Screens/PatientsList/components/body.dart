import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_flutter_app/Screens/PatientDetail/patient_detail.dart';
import 'package:first_flutter_app/globals.dart';

class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _searchController = TextEditingController();

  Future resultsLoaded;
  List _allResults = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getPatientsStreamSnapchots();
  }

  _onSearchChanged(){
    print(_searchController.text);
  }

  getPatientsStreamSnapchots() async {
    final uid = await Provider.of(context, listen: false).auth.getCurrentUID();
    var data = await FirebaseFirestore.instance.collection('patients').where("_doctorMail", isEqualTo: currentUserEmail).getDocuments();
    setState((){
      _allResults = data.documents;
    });
    return "complete";
  }

  navigateToDetail(DocumentSnapshot patient, context){

    Navigator.push(context, MaterialPageRoute(builder: (context) => PatientDetail(patient: patient)));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final firebaseUser = context.watch<User>();
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
        //    borderRadius: BorderRadius.circular(40)
        ),
      child: Column(
        children: <Widget>[
          SizedBox(height: size.height * 0.05),
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search)
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _allResults.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text("Właściciel: " + _allResults[index]['_nameOwner']),
                    //subtitle: Text("Imię zwierzęcia: " + _allResults[index]['_nameAnimal'].toString()),
                    //onTap: () => navigateToDetail(_allResults[index], context)
                );
              },
                  //PatientDetail(context, _allResults[index]));
            )
            // child: StreamBuilder(
            //     stream: getPatientsStreamSnapchots(context),//FirebaseFirestore.instance.collection('patients').where("_doctorMail", isEqualTo: currentUserEmail).snapshots(),
            //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            //       if (snapshot.hasError){
            //         return Text('Something went wrong');
            //       }
            //
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Text("Loading");
            //       }
            //       if(!snapshot.hasData){
            //         return Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //
            //       return ListView(
            //           scrollDirection: Axis.vertical,
            //           shrinkWrap: true,
            //           children: snapshot.data.documents.map((DocumentSnapshot document){
            //             return ListTile(
            //                 title: Text("Właściciel: " + document.data()['_nameOwner'].toString()),
            //                 subtitle: Text("Imię zwierzęcia: " + document.data()['_nameAnimal'].toString()),
            //             onTap: () => navigateToDetail(document, context)
            //             );
            //           }).toList());
            //     },
            //   ),
          )
        ]
      ),
    );
  }
}



