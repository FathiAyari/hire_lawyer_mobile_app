import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../Messages.dart';
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
  List <Widget>items=[
     Icon(Icons.home_outlined),
     Icon(Icons.email_outlined),
     Icon(Icons.account_circle_outlined)

  ];

  @override

  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    List pages=[
      buildHomePage(connected:connected,press:(){
      setState(() {
        this.connected=!connected;
      });
    }),
      buildMessages(context),
      buildProfile(context),


    ];
    return Scaffold(

      body: SafeArea(

        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight:  Radius.circular(40),bottomLeft:  Radius.circular(40),)
            ),
          child: pages[currentIndex],
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
