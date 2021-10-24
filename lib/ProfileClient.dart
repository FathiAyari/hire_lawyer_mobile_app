import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/Login/DividerBox.dart';

import 'HomePage/HomePage.dart';
import 'Values/Strings.dart';

Widget buildProfile(BuildContext context){
  Size size = MediaQuery.of(context).size;
  return Column(
    children: [
      Align(
          alignment: Alignment.topCenter,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              SizedBox(
                width: size.width * 0.15,
              ),
              Text(
                ConstStrings.Profile,
                style: TextStyle(
                    fontSize: size.height * 0.028,
                    fontFamily: "NewsCycle-Bold"),
                textAlign: TextAlign.center,
              )
            ],
          )),
      DividerBox(size: size,height: 0.02,),
      CircleAvatar(
        radius: 70,
        backgroundImage: NetworkImage("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80"),
      ),
      Text("Fathi Ayari")
    ],
  );
}