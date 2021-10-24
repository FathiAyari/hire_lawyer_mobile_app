import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/Login/ActionButton.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    List pages=[
      buildHomePage(size,connected,(){
      setState(() {
        this.connected=!connected;
      });
    }),
      buildMessages(context),
      buildProfile(context),


    ];
    return Scaffold(
backgroundColor: Colors.white,
      body: SafeArea(

        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "L'accueil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.email_outlined), label: "Messages"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Profile"),
        ],
      ),
    );
  }


}
