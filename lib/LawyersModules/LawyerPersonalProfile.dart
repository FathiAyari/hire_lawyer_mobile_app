import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/ClientsModules/Register/infoMessage.dart';
import 'package:hire_lawyer/Login/ActionButton.dart';
import 'package:hire_lawyer/Login/DividerBox.dart';
import 'package:hire_lawyer/Login/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hire_lawyer/Values/Strings.dart';
class LawyerPersonalProfile extends StatefulWidget {

  @override
  _buildProfileState createState() => _buildProfileState();
}

class _buildProfileState extends State<LawyerPersonalProfile> {
  TextEditingController emailController=TextEditingController();

  Future<void> getUserData()async{
    final FirebaseAuth auth = await FirebaseAuth.instance;
    final User user = await auth.currentUser;
    final uid = user.uid;
    var snapshotName = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    setState(() {
      emailController.text=snapshotName["email"];

    });

  }
  @override
  void initState() {

    super.initState();
    getUserData();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor:Color(0xffEAEDEF),
      body: Column(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Text(
                ConstStrings.Profile,
                style: TextStyle(
                    fontSize: size.height * 0.028,
                    fontFamily: "NewsCycle-Bold"),
                textAlign: TextAlign.center,
              )),
          DividerBox(size: size,height: 0.02,),
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80"),
          ),
          DividerBox(size: size,height: 0.02,),
          Text("Fathi Ayari",
            style: TextStyle(
                color: Color(0xff5154b5),
                fontSize: 20
            ),),
          DividerBox(size: size,height: 0.02,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Container(
              height: size.height * 0.1,

              child: TextFormField(
                keyboardType: TextInputType.emailAddress,


                controller:  emailController,

                decoration: InputDecoration(

                    hintText: "${emailController.text}",

                    hintStyle:TextStyle(
                      color: Colors.blueAccent,
                    ),
                    suffixIcon: Icon(Icons.email_outlined),

                    fillColor: Colors.white10,// the color of the inside box field
                    filled: true,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10) , //borderradius
                    )
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:20),
            child: Container(
              child: BuildLoginButton(size,ConstStrings.Confirm,(){
                InfoMessage(message: "êtes-vous sûr de mettre à jour vos données ?",press:() {
                  Navigator.pop(context);
                },).show(context);

              }),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: BuildLoginButton(size,ConstStrings.Logout,(){

                InfoMessage(message: "êtes-vous sûr de se déconnecter ?",press:()async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
                },).show(context);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
