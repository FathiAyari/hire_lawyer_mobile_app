import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildHomePage(Size size, bool connected, Function press) {
  List<Content> contentList = [
    Content(image: 'assets/images/family-room.png', footer: 'Droit de la famille'),
    Content(image: 'assets/images/home.png', footer: 'Loi de properiété'),
    Content(image: 'assets/images/prison.png', footer: 'Loi criminele'),
    Content(image: 'assets/images/traffic.png', footer: 'Infractiosn de la circulation'),
    Content(image: 'assets/images/injury.png', footer: 'Blessurre personelle'),
    Content(image: 'assets/images/employement.png', footer: 'Droit de travaille'),
  ];

  return Scaffold(

    body: Container(
      decoration: BoxDecoration(
        color:  Color(0xffEAEDEF),

      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    backgroundColor: connected == true ? Colors.green : Colors.red,
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
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: contentList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (2), crossAxisSpacing: 15, mainAxisSpacing: 15),
                itemBuilder: (context, int index) {
                  return contentList[index];
                },
              ),
            ),
          )
        ],
      ),
    ),
  );
}

class Content extends StatelessWidget {
  final String image;
  final String footer;
  const Content({
    Key key,
    this.image,
    this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/lawyers', arguments: {"footer": footer});
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
                child: Image.asset(
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
