import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LawyersLabels extends StatelessWidget {
  final String image;
  final String footer;
  const LawyersLabels({
    Key key,
    this.image,
    this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                flex: 2,
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                )),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(footer,
                  textAlign: TextAlign.center,),
              ),
            )
          ],
        ),
      ),
    );
  }
}