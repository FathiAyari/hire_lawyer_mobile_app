import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/HomePage/HomePage.dart';

import 'Values/Strings.dart';

class Lawyers extends StatefulWidget {
/*  const Lawyers({Key? key}) : super(key: key);*/

  @override
  _LawyersState createState() => _LawyersState();
}

class _LawyersState extends State<Lawyers> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    Map arguments = ModalRoute.of(context).settings.arguments;
    String footer = arguments['footer'];
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child:Row(

                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                  }, icon: Icon(Icons.arrow_back_ios)),
                  SizedBox(width: size.width * 0.15,),
                  Text(" $footer",
                    style: TextStyle(
                        fontSize: size.height * 0.028,
                        fontFamily: "NewsCycle-Bold"
                    ),
                    textAlign: TextAlign.center,)
                ],
              )
          ),
        ],
      )),
    );
  }
}
