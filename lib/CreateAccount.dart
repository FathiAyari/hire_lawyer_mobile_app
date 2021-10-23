import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Login/DividerBox.dart';

class CreateAccount extends StatefulWidget {


  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white24,

              Colors.blueGrey,

            ],
          ),
        ),
        child: Column(
          children: [
            DividerBox(size:size,height:0.12),
            CircleAvatar(
              radius: 75,
              backgroundColor: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
