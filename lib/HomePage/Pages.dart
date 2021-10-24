import 'package:flutter/cupertino.dart';

Widget buildHomePage(Size size) {
  return Column(

    children: [

      ClipRRect(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40),),
        child: Image.asset('assets/images/hire_lawyer.png'),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 40,top: 40),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text("Bienvenue Fathi.",
            style: TextStyle(
                fontSize: size.height * 0.030,
                fontFamily:"EBGaramond"
            ),),
        ),
      ),
      GridView.builder(),
    ],
  );
}