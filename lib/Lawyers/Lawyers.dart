import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/HomePage/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hire_lawyer/HomePage/Pages.dart';
import 'package:hire_lawyer/Login/DividerBox.dart';
import 'package:firebase_database/firebase_database.dart';
import '../Values/Strings.dart';
import 'LawyersLabels.dart';
import 'lawyerObject.dart';

class Lawyers extends StatefulWidget {
/*  const Lawyers({Key? key}) : super(key: key);*/

  @override
  _LawyersState createState() => _LawyersState();
}

class _LawyersState extends State<Lawyers> {

  List lawyersList = [""];
  Map test={};
  getTest() {
    var mediaReference =
        FirebaseDatabase.instance.reference().child("family_law");
    mediaReference.onValue.listen((event) {
      lawyersList.clear();
      test.clear();
      Map map = Map<String, dynamic>();
      for (int i = 0; i < event.snapshot.value.length; i++) {
        map["$i"] = event.snapshot.value[i];
      }
      lawyersList.add(map);
      test=map;
      print(test);
      setState(() {

      });
    });

  }

  /*Future<void> getUserData() async {
    final FirebaseAuth auth = await FirebaseAuth.instance;
    final User user = await auth.currentUser;
    final uid = user.uid;

    var snapshotNametest = await FirebaseFirestore
        .instance
        .collection('lawyers')
        .doc("family_law")
        .collection("1")
        .doc("2")
        .snapshots()
        .listen((event) {
      lawyersList.clear();
      Map<dynamic, dynamic> firestoreInfo = event.data();
      firestoreInfo.forEach((key, value) async {
        var lawyer = LawyersObject.fromJson(value);
        lawyersList.add(lawyer);
      });
      print(lawyersList[0].LawyerAge);
      });
    var snapshot = await FirebaseFirestore.instance
        .collection('lawyers')
        .doc("family_law")
        .collection("1")
        .get();
    Map map = Map<String, dynamic>();
    for (int i = 0; i < snapshot.docs.length; i++) {
      map["$i"] = snapshot.docs[i].data();
    }

    return map;
  }*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getTest();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map arguments = ModalRoute.of(context).settings.arguments;
    String footer = arguments['footer'];
    int verifIndex;
    switch (footer) {
      case 'Droit de la famille':
        verifIndex = 0;
        break;
      case 'Loi de properiété':
        verifIndex = 1;
        break;
      case 'Loi criminele':
        verifIndex = 2;
        break;
      case 'Infractiosn de la circulation':
        verifIndex = 3;
        break;
      case 'Blessurre personelle':
        verifIndex = 4;
        break;
      case 'Droit de travaille':
        verifIndex = 5;
        break;
    }
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  SizedBox(
                    width: size.width * 0.15,
                  ),
                  Text(
                    " $footer",
                    style: TextStyle(
                        fontSize: size.height * 0.028,
                        fontFamily: "NewsCycle-Bold"),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
          DividerBox(size: size, height: 0.1),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffEAEDEF),
                    ),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: (2),
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5),
                      itemCount:test.length,
                      itemBuilder: (context, index) {
                        return LawyersLabels(
                          footer: "${test["$index"]["name"]}",

                          image:
                              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            /* child: FutureBuilder(
                future: getTest(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return  Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color:  Color(0xffEAEDEF),

                            ),
                            child: GridView.builder(

                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: (2),
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                              itemCount: snapshot.data.length,
                              itemBuilder: (context,index){
                                return LawyersLabels(
                                  footer:"${snapshot.data['$index']['name']}",
                                  image: 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    );
                  } else
                    return Center(child: CircularProgressIndicator());
                }),*/
          ),
        ],
      )),
    );
  }
}
