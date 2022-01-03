import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/Login/DividerBox.dart';
import 'package:intl/intl.dart';
import '../ClientsModules/HomePage/HomePage.dart';
import '../Values/Strings.dart';
import 'Messenger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class buildMessages extends StatefulWidget {


  @override
  _buildMessagesState createState() => _buildMessagesState();
}

class _buildMessagesState extends State<buildMessages> {
  String uid;
  List result;
  List resultText;

  ScrollController controller = new ScrollController();
  Future<void> getUserData() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;

    setState(() {
      uid = user.email;
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          color:  Color(0xffEAEDEF),
          child: Column(
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
                        ConstStrings.Messgaes,
                        style: TextStyle(
                            fontSize: size.height * 0.028,
                            fontFamily: "NewsCycle-Bold"),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
              DividerBox(
                size: size,
                height: 0.05,
              ),
              Expanded(
                  child:   StreamBuilder<QuerySnapshot>(
                    stream:
                    snapshotMessages.collection('messages').orderBy('time').snapshots(),
                    builder: (context, snapshot) {
                      List msg = [];
                      List text = [];


                      if (!snapshot.hasData) {

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                     if(snapshot.data.size!=0){
                       final messages = snapshot.data.docs.reversed;

                       for (var message in messages) {

                         final getText = message.get('text');
                         final getSender = message.get('sender');
                         final getDestination = message.get('destination');
                         final getTime = message.get('time');
                         final Map <String ,String>messageWidget ={
                            'getText':getText,
                           'getTime':DateFormat('kk:mm').format( DateTime.parse(getTime.toDate().toString())),
                           'getSender':getSender,
                           'getDestination':getDestination,
                         };
                         if ((((messageWidget["getSender"] == uid ) || (messageWidget["getDestination"] == uid)))  ) {
                           msg.add(messageWidget);
                         }


                       }


                for(int i=0;i<msg.length;i++){

                             for(int j=i+1;j<msg.length;j++){
                               if((msg[i]["getSender"]==msg[j]["getSender"]) && (msg[i]["getDestination"]==msg[j]["getDestination"])){
                                 msg[j]={
                                   'getText':'',
                                   'getSender':'',
                                   'getDestination':'',
                                 };

                               }
                             }

                           }






                for(int i=0;i<msg.length;i++){
                    if(msg[i]["getSender"]==""){
                      msg.remove(msg[i]);
                      i--;
                    }
                }
                       print(msg);

                     }else return Text("no messages");

                      return Column(
                        children: [
                          Expanded(
                              child: ListView.builder(
                                itemCount:msg.length,
                                itemBuilder: (context,index){

                                  return     InkWell(
                                    onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => Messenger(
                                              email: "${msg[index]["getDestination"]}",
                                              label:"test",
                                              profil: "https://www.bakerlaw.com/images/bio/dawson_todd_04121_imagethumb_296795.jpg",

                                            )));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                      child: Row(

                                        children: [
                                          Container(
                                              alignment: Alignment.centerLeft,
                                              child: Stack(
                                                alignment: AlignmentDirectional.bottomEnd,
                                                children: [

                                                  CircleAvatar(
                                                      radius: 33,
                                                      backgroundImage: NetworkImage(
                                                          "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80")),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
                                                    child: CircleAvatar(
                                                      backgroundColor: Colors.green.shade700,
                                                      radius: 7,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          SizedBox(width: size.width * 0.03,),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children:[
                                                Text("${msg[index]["getText"]}"),
                                              ],
                                            ),

                                          ),
                                          Container(
                                            child: Text("${msg[index]["getTime"]}"),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },

                                padding: EdgeInsets.all(20),
                                controller: controller,

                              )),
                        ],
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

/*
Widget buildMessages(BuildContext context) {
  Future<void> messageStreams() async {
    var snapshotMessages =
    await FirebaseFirestore.instance.collection('messages').snapshots();
    await for (var snapshot
    in FirebaseFirestore.instance.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }
  Size size = MediaQuery.of(context).size;
  return Container(
   color:  Color(0xffEAEDEF),
    child: Column(
      children: [
        Align(
            alignment: Alignment.topCenter,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      messageStreams();

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                SizedBox(
                  width: size.width * 0.15,
                ),
                Text(
                  ConstStrings.Messgaes,
                  style: TextStyle(
                      fontSize: size.height * 0.028,
                      fontFamily: "NewsCycle-Bold"),
                  textAlign: TextAlign.center,
                )
              ],
            )),
        DividerBox(
          size: size,
          height: 0.05,
        ),
        Expanded(
            child:   StreamBuilder<QuerySnapshot>(
        stream:
        snapshotMessages.collection('messages').orderBy('time').snapshots(),
    builder: (context, snapshot) {
      List<MessageLine> msg = [];
      if (!snapshot.hasData) {

        return Center(
          child: CircularProgressIndicator(),
        );
      }
      final messages = snapshot.data.docs.reversed;
      for (var message in messages) {

        final getText = message.get('text');
        final getSender = message.get('sender');
        final getDestination = message.get('destination');
        final getTime = message.get('time');
        for (var i = 0; i < msg.length - 1; i++) {}
        if ((getSender == uid && getDestination == widget.email) ||
            (getSender == widget.email && getDestination == uid)) {
          final messageWidget = MessageLine(
            getText: getText,
            getSender: getSender,
            getDestination: getDestination,
            check: uid == getSender ? true : false,
          );
          msg.add(messageWidget);
        }
      }

      return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.all(20),
            controller: controller,
            children: msg,
          ));
    },
  ))
      ],
    ),
  );
}
*/


/*ListView(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(

                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        radius: 37,
                        backgroundColor: Colors.green,
                        child: CircleAvatar(
                            radius: 33,
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80")),
                      )),
                  SizedBox(width: size.width * 0.03,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fathi AYARI"),
                        Text("Bonjour Mr j'espere que vous etiuglhghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,),
                      ],
                    ),

                  ),
                  Container(
                    child: Text("20:54"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(

                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        radius: 37,
                        backgroundColor: Colors.green,
                        child: CircleAvatar(
                            radius: 33,
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80")),
                      )),
                  SizedBox(width: size.width * 0.03,),

                  Container(
                    child: Text("20:54"),
                  )
                ],
              ),
            ),


          ],
        )*/



/*   text.add(getText);
                      final jsonList= msg.map((item) => jsonEncode(item)).toList();
                          final uniqueJsonList = jsonList.toSet().toList();
                          result = uniqueJsonList.map((item) => jsonDecode(item)).toList();*/
/* if(msg.isEmpty){
                            msg.add(messageWidget);
                            if((msg.last["getSender"]!=messageWidget["getSender"]) && (msg.last["getDestination"]!=messageWidget["getDestination"])){
                              msg.add(messageWidget);
                            }





                          }
                          */
/*else if((msg.last["getSender"]!=messageWidget["getSender"]) && (msg.last["getDestination"]!=messageWidget["getDestination"])){
                            msg.add(messageWidget);

                          }*/
/*   for(int i=0;i<msg.length;i++){

                             for(int j=i+1;j<msg.length;j++){
                               if((msg[i]["getSender"]==msg[j]["getSender"]) && (msg[i]["getDestination"]==msg[j]["getDestination"])){
                                 msg[j]={
                                   'getText':'12',
                                   'getSender':'',
                                   'getDestination':'',
                                 };

                               }
                             }
                             if(msg[i]["getSender"]==""){
                               print("dd");
                               i--;
                             }
                           }*/