import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildHomePage(Size size,bool connected,Function press) {

  return Column(
    children: [
      Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundColor: connected ==true? Colors.green:Colors.red,
              radius: 40,
              child: InkWell(
                onTap: press,
                child: CircleAvatar(
                  child: Image.asset('assets/images/logo.png'),
                  backgroundColor: Colors.white,
                  radius: 35,
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Bienvenue Fathi.",
            style: TextStyle(
                fontSize: size.height * 0.035, fontFamily: "EBGaramond"),
          ),
        ),
      ],),

      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (2),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5
            ),
            itemBuilder: ( context, int index) {
              return Content();
            },
          ),
        ),
      )
    ],
  );
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),

        child: Column(
          children: [
            Expanded(child: Image.asset('assets/images/Criminal.png',
            fit: BoxFit.fill,))
          ],
        ),


      ),
    );
  }
}
