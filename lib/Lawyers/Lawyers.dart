import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/HomePage/HomePage.dart';

import '../Values/Strings.dart';

class Lawyers extends StatefulWidget {
/*  const Lawyers({Key? key}) : super(key: key);*/

  @override
  _LawyersState createState() => _LawyersState();
}

class _LawyersState extends State<Lawyers> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map arguments = ModalRoute.of(context).settings.arguments;
    String footer = arguments['footer'];
    int verifIndex;
    switch (footer) {
      case 'Droit de la famille':
        verifIndex = 0;
        break;
      case 'Loi de properiété':
        verifIndex = 1;
        break;
      case 'Loi criminele':
        verifIndex = 2;
        break;
      case 'Infractiosn de la circulation':
        verifIndex = 3;
        break;
      case 'Blessurre personelle':
        verifIndex = 4;
        break;
      case 'Droit de travaille':
        verifIndex = 5;
        break;
    }
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  SizedBox(
                    width: size.width * 0.15,
                  ),
                  Text(
                    " $footer",
                    style: TextStyle(
                        fontSize: size.height * 0.028,
                        fontFamily: "NewsCycle-Bold"),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
         Text("$verifIndex"),
         /* GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (2), crossAxisSpacing: 5, mainAxisSpacing: 5),
          ),*/
        ],
      )),
    );
  }
}
