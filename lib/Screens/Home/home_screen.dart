import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/constants.dart';
import 'package:first_flutter_app/Screens/Home/components/body.dart';
import 'package:first_flutter_app/components/rounded_input_field.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

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
                    },)
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
                  Text('Search pet to diagnose'),
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
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          height: size.height*0.15,
                          width: size.width*0.19,
                          padding: EdgeInsets.all(size.aspectRatio*1),
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadowList,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(categories[index]['iconPath']),
                        ),
                        Text(categories[index]['name'])
                      ],
                    )

                  );
                },
              ),
            ),
            //Description of patient
            Container(
              height: size.height * 0.5,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: kHomeBox,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: shadowList,
                          ),
                          margin: EdgeInsets.only(top: size.height*0.04, bottom: size.height*0.04),
                        ),
                        Align(
                          child: Image.asset('assets/images/cat_image.png',
                            height: size.height * 0.45,
                            width:  size.width * 0.45,
                          ),
                          alignment: Alignment(0, -size.height * 0.002),
                          //left: size.width * 0.03,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top:size.height*0.07, bottom: size.height*0.07),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: shadowList,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                        ),
                      ),
                      child: Column(
                        children: <Widget> [
                          RoundedInputField(
                            hintText: "Imię",
                            icon: Icons.android,
                            color: Colors.grey[200],
                            iconColor: Colors.black,
                          ),
                          RoundedInputField(
                            hintText: "Nazwisko właściciela",
                            icon: Icons.person,
                            color: Colors.grey[200],
                            iconColor: Colors.black,
                          ),
                        ]
                      )
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.1),
          ],
        ),
      ),
    );
  }
}