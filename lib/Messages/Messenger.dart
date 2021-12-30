import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hire_lawyer/ClientsModules/Register/infoMessage.dart';
import '../ClientsModules/HomePage/HomePage.dart';
import '../Login/emailFormField.dart';
import '../Values/Strings.dart';
import 'Messages.dart';
import 'ReceiverBubble.dart';
import 'SenderBubble.dart';
import 'package:firebase_auth/firebase_auth.dart';

final snapshotMessages = FirebaseFirestore.instance;
ScrollController controller = new ScrollController();

class Messenger extends StatefulWidget {
  final String label;
  final String profil;
  final String email;

  const Messenger({this.label, this.email, this.profil});

  @override
  _MessengerState createState() => _MessengerState();
}

class _MessengerState extends State<Messenger> {
  String textMessage = "";
  String uid;

  ScrollController controller = new ScrollController();
  TextEditingController messageController = new TextEditingController();
  @override
/*  Future<void> messageStreams() async {
    var snapshotMessages = await FirebaseFirestore.instance.collection('messages').snapshots();
    await for (var snapshot in FirebaseFirestore.instance.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }*/


  Future<void> getUserData() async {
    String uid;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;

    setState(() {
      this.uid = user.email;
    });
    return uid;
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
    Timer(
      Duration(seconds: 1),
      () => controller.jumpTo(controller.position.maxScrollExtent),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 60,
                  color: Color(0xffEAEDEF),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => buildMessages()));
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor:  Colors.green,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "${widget.profil}"),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        "${widget.label}",
                        style: TextStyle(
                            fontSize: size.height * 0.028,
                            fontFamily: "NewsCycle-Bold"),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 10,
                child: Container(
                  child: Column(
                    children: [
                      MessageStreamBuilder(
                        email: widget.email,
                      )
                    ],
                  ),
                )),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  onChanged: (value) {
                    textMessage = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: messageController,

                  decoration: InputDecoration(

                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          if (messageController.text.endsWith(" ")  ) {
                            InfoMessage(
                              press: (){
                                Navigator.pop(context);
                              },
                              message: "Message ne doit pas contenir espace seulement",

                            ).show(context);
                          }else  if (messageController.text.isEmpty) {
                            InfoMessage(
                                press: (){
                              Navigator.pop(context);
                            },
                          message: "Message ne peut pas etre vide",
                            ).show(context);

                          }
                          else {
                            messageController.clear();
                            snapshotMessages.collection('messages').add({
                              'text': "$textMessage",
                              'destination': "${widget.email}",
                              'sender': "$uid",
                              'time': FieldValue.serverTimestamp(),
                            });
                          }
                        },
                        color: Colors.blueAccent,
                      ),
                      hintText: "Ecrire un message",
                      hintStyle: TextStyle(
                        color: Colors.blueAccent,
                      ),
                      fillColor:
                          Colors.white10, // the color of the inside box field
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), //borderradius
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}








class MessageLine extends StatefulWidget {
  final String getText;
  final String getSender;
  final String getDestination;
  final String getTime;
  final bool check;

  const MessageLine({
    Key key,
    @required this.getText,
    this.getSender,
    this.getDestination,
    this.check,
    this.getTime,
  }) : super(key: key);

  @override
  _MessageLineState createState() => _MessageLineState();
}

class _MessageLineState extends State<MessageLine> {
  Future<void> getUserData() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;

    return user.email;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            widget.check ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: widget.check
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
            color: widget.check
                ? Colors.blueAccent
                : Colors.black87.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "${widget.getText}",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*class MessageLine extends StatelessWidget {
  final String getText;
  final String getSender;
  final String getDestination;
  final String getTime;
  final bool check;
  const MessageLine({
    Key key,
    @required this.getText, this.getSender, this.getDestination, this.check, this.getTime,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: check ? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: check ?BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)):
            BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
            color: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10 ,horizontal: 20),
              child: Text(
                "$getSender $getDestination",
                style: TextStyle(fontSize: 20,color: check ?Colors.white:Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
class MessageStreamBuilder extends StatefulWidget {
  final String email;
  const MessageStreamBuilder({
    Key key,
    @required this.email,
  }) : super(key: key);
  @override
  _MessageStreamBuilderState createState() => _MessageStreamBuilderState();
}

class _MessageStreamBuilderState extends State<MessageStreamBuilder> {
  String uid;
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
    Timer(
      Duration(seconds: 1),
      () => controller.jumpTo(controller.position.maxScrollExtent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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
    );
  }
}
