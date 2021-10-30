import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/HomePage/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Values/Strings.dart';
import 'lawyerObject.dart';

class Lawyers extends StatefulWidget {
/*  const Lawyers({Key? key}) : super(key: key);*/

  @override
  _LawyersState createState() => _LawyersState();
}

class _LawyersState extends State<Lawyers> {
  String test="";
  List lawyersList=[];
  Future<void> getUserData()async{
    final FirebaseAuth auth = await FirebaseAuth.instance;
    final User user = await auth.currentUser;
    final uid = user.uid;
    var snapshotName = await FirebaseFirestore
        .instance
        .collection('lawyers')
        .doc("family_law")
        .collection("1")
        .doc("2")
        .snapshots()
        .listen((event) {
        lawyersList.clear();
      Map<String, dynamic> firestoreInfo =event.data();
      firestoreInfo.forEach((key, value) async{
          var lawyer =   LawyersObject.fromJson(value);
      await lawyersList.add(lawyer);
      });
print(lawyersList[0].LawyerAge);
setState(() {

});
    });


  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
    if(lawyersList.isEmpty){
      print("list empty");
    }
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
          ElevatedButton(onPressed: (){

            },
              child:Text("test") ),
          Text("${lawyersList[0].LawyerName}")
        /*  Expanded(
            child: FutureBuilder(
                future: getUserData(),
                builder: (context,AsyncSnapshot snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount:1,
                    itemBuilder: (context,index){
                  return Column(
                    children: [
                      Text("${snapshot.data['name']}"),

                    ],
                  );

                });
              }else return CircularProgressIndicator();
            }),
          ),*/

         /* GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (2), crossAxisSpacing: 5, mainAxisSpacing: 5),
          ),*/
        ],
      )),
    );
  }
}
