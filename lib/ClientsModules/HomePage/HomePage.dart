import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Messages/Messages.dart';
import '../ProfileClient.dart';
import 'Pages.dart';

class HomePage extends StatefulWidget {
  @override

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  bool connected=true;
  String user;
  Widget Positive() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueAccent
      ),
      child: TextButton(
          onPressed: () {
            exit(0);
          },
          child: Text(" Oui",
            style: TextStyle(
              color:Color(0xffEAEDEF),
            ),)),
    );
  }
  Widget Negative(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(" Non"));
  }
  List <Widget>items=[
     Icon(Icons.home_outlined),
     Icon(Icons.email_outlined),
     Icon(Icons.account_circle_outlined)
  ];

  @override

  Widget build(BuildContext context) {

    List pages=[
      buildHomePage(),
      buildMessages(),
      buildProfile(),


    ];
    return Scaffold(

      body: WillPopScope(
        onWillPop: () {
          return showDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  content: Text(" êtes-vous sûr de sortir ?"),
                  actions: [Negative(context), Positive()],
                );
              });
        },
        child: SafeArea(

          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight:  Radius.circular(40),bottomLeft:  Radius.circular(40),)
              ),
            child: pages[currentIndex],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor:Color(0xff848DFF),
        backgroundColor: Color(0xffEAEDEF),
        animationDuration: Duration(milliseconds: 700),
        height: 60,
        index: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex=index;
          });
        },
        items: items,
      ),
    );
  }


}
