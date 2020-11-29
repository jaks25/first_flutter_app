import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/constants.dart';
import 'package:first_flutter_app/Screens/Home/components/body.dart';
import 'package:first_flutter_app/components/rounded_input_field.dart';
import 'package:first_flutter_app/Screens/Home/components/app_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_flutter_app/globals.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen  = false;
  bool isSelected    = true;
  int  indexSelected = 0;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: isDrawerOpen ? BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(40)
      ): BoxDecoration(
        color: Colors.grey[200],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.03,),
            Container(
                margin: EdgeInsets.symmetric(horizontal: size.width*0.03, vertical: size.height *0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isDrawerOpen ? IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          scaleFactor = 1;
                          isDrawerOpen = false;
                        });
                      },
                    ) :IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        setState((){
                          xOffset = size.width * 0.6;
                          yOffset = size.height * 0.2;
                          scaleFactor = 0.6;
                          isDrawerOpen = true;
                        });
                      print("Pushed");
                    },
                    ),
                    Text(
                        currentUserEmail
                    ),
                    SvgPicture.network("https://www.svgrepo.com/show/295861/veterinarian.svg",
                      height: size.height * 0.07,
                      alignment: Alignment.center,
                    ),
                    //SizedBox(height: size.height * 0.03,width: size.width * 0.1,),
                  ],
                )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.075, vertical: size.height*0.015),
              margin: EdgeInsets.symmetric(horizontal: size.width*0.035, vertical: size.height*0.02),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search),
                  Text('Wybierz gatunek'),
                  Icon(Icons.settings)
                ],
              ),
            ),

            Container(
              height: size.height*0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: size.height*0.15,
                                width: size.width*0.19,
                                padding: EdgeInsets.all(size.aspectRatio*1),
                                margin: EdgeInsets.only(left: 20),
                                decoration: isSelected && index == indexSelected ? BoxDecoration(
                                  color: kHomeBox,
                                  boxShadow: shadowList,
                                  borderRadius: BorderRadius.circular(10),
                                ):
                                BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: shadowList,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(categories[index]['iconPath']),
                              ),
                              Text(
                                  '    ' + categories[index]['name'],
                                  textAlign: TextAlign.center,
                              ),
                            ],
                          )
                      ),
                      onTap: () {
                        setState(() {
                          indexSelected = index;
                        });
                        print('    ' + categories[index]['name'] + ' was clicked');
                      },
                  );
                },
              ),
            ),
            //Description of patient
            Container(
              height: size.height * 0.5,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                    children: <Widget> [
                      Expanded(
                      child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: kHomeBox,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: shadowList,
                          ),
                          margin: EdgeInsets.only(top: size.height*0.0001, bottom: size.height*0.0001),
                        ),
                        Align(
                          child: Image.asset(categories[indexSelected]['picturePath'],
                            height: size.height * 0.29,
                            width:  size.width * 0.29,
                          ),
                          alignment: Alignment(-0.4, -size.height * 0.0013),
                          //left: size.width * 0.03,
                        ),
                      ],
                    ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: kHomeBox,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: shadowList,
                              ),
                              margin: EdgeInsets.only(top: size.height*0.05, bottom: size.height*0.05),
                            ),
                          ],
                        ),
                          onTap: () {
                            print('button clicked');
                          },
                        ),
                      ),
                    ]
                    )
                  ),
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(top:size.height*0.01, bottom: size.height*0.000001, left: size.width * 0.00001),
                      color: Colors.grey[200],
                      child: Column(
                        children: <Widget> [
                          RoundedInputField(
                            hintText: categories[indexSelected]['hintText'] ?? "Imię",
                            icon: categories[indexSelected]['iconInputField'] ?? Icons.accessibility_new_rounded,
                            color: Colors.white,
                            iconColor: Colors.black,
                            verticalMargin: 3,
                          ),
                          RoundedInputField(
                            hintText: "Nazwisko właściciela",
                            icon: Icons.person,
                            color: Colors.white,
                            iconColor: Colors.black,
                            verticalMargin: 3,
                          ),
                          RoundedInputField(
                            hintText: "Wiek",
                            icon: Icons.calendar_today,
                            color: Colors.white,
                            iconColor: Colors.black,
                            verticalMargin: 3,
                          ),
                          RoundedInputField(
                            hintText: "Waga",
                            icon: Icons.network_check,
                            color: Colors.white,
                            iconColor: Colors.black,
                            verticalMargin: 3,
                          ),
                          RoundedInputField(
                            hintText: "Płeć",
                            icon: Icons.looks_two_outlined,
                            color: Colors.white,
                            iconColor: Colors.black,
                            verticalMargin: 3,
                          ),
                          RoundedInputField(
                            hintText: "Rasa",
                            icon: Icons.loyalty_outlined,
                            color: Colors.white,
                            iconColor: Colors.black,
                            verticalMargin: 3,
                          ),
                        ]
                      )
                    ),
                    )
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }
}