import 'package:flutter/cupertino.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hire_lawyer/ClientsModules/LawyersView/Lawyers.dart';


class buildHomePage extends StatefulWidget {
  final bool connected;
  final String userName;
  final Function press;

  const buildHomePage({

this.connected, this.press, this.userName});

  @override

  _buildHomePageState createState() => _buildHomePageState();
}

class _buildHomePageState extends State<buildHomePage> {
String userName="";

  List<Content> contentList = [
    Content(image: 'assets/images/family-room.png', footer: 'Droit de la famille'),
    Content(image: 'assets/images/home.png', footer: 'Loi de properiété'),
    Content(image: 'assets/images/prison.png', footer: 'Loi criminele'),
    Content(image: 'assets/images/traffic.png', footer: 'Infractiosn de la circulation'),
    Content(image: 'assets/images/injury.png', footer: 'Blessurre personelle'),
    Content(image: 'assets/images/employement.png', footer: 'Droit de travaille'),
  ];


  Future<void> getUserData()async{
    final FirebaseAuth auth = await FirebaseAuth.instance;
    final User user = await auth.currentUser;
    final uid = user.uid;
    var snapshotName = await FirebaseFirestore.instance.collection('users').doc(uid).get();
setState(() {
  userName =snapshotName["name"];

});

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }
  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                      backgroundColor: widget.connected == true ? Colors.green : Colors.red,
                      radius: 40,
                      child: InkWell(
                        onTap: widget.press,
                        child: CircleAvatar(
                          child: Image.asset('assets/images/logo.png'),
                          backgroundColor: Colors.white,
                          radius: 35,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                   /* child:FutureBuilder(
                      future: insertUserFireStore(),
                      builder: (context,snapshot){

                      },
                    ),*/

                     child:Row(
                       children: [

                         Text(
                          "Bienvenue $userName.",
                          style: TextStyle(
                              fontSize: size.height * 0.035, fontFamily: "EBGaramond"),
                    ),
                       ],
                     ),
                  ),
                ),
              ],
            ),
        /*    Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 200,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

              ),
              child: Carousel(
                boxFit: BoxFit.cover,
                autoplay: true,
                autoplayDuration: Duration(seconds: 3),
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(seconds: 1),
                dotSize: 5.0,
                dotIncreasedColor: Colors.blueAccent,
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 10.0,
                showIndicator: true,
                indicatorBgPadding: 7.0,
                images: [
                  Image.asset('assets/images/hire_lawyer.png'),
                  Image.asset('assets/images/texting.png'),
                  Image.asset('assets/images/answer.png'),


                ],
              ),
            ),
          */

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: contentList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (3), crossAxisSpacing: 15, mainAxisSpacing: 15),
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
      Navigator.of(context).push( MaterialPageRoute(builder: (context)=>Lawyers(footer: footer,)));

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