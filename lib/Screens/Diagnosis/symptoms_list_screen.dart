import 'package:first_flutter_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/symptoms/symptoms.dart';

class SymptomsListScreen extends StatefulWidget {
  @override
  _SymptomsListScreenState createState() => _SymptomsListScreenState();
}

class _SymptomsListScreenState extends  State<SymptomsListScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                                    title: Text(symptomsName[index]['name']),)
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