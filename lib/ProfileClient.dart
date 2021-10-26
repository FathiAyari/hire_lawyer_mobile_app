import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/Login/DividerBox.dart';
import 'package:hire_lawyer/Login/emailFormField.dart';

import 'HomePage/HomePage.dart';
import 'Login/ActionButton.dart';
import 'Login/Login.dart';
import 'Register/infoMessage.dart';
import 'Values/Strings.dart';

Widget buildProfile(BuildContext context){
  Size size = MediaQuery.of(context).size;
  TextEditingController emailController=TextEditingController();
  emailController.text="Fathi3ayari333@gmail.com";
  return Scaffold(
    resizeToAvoidBottomInset:false,
    backgroundColor:Color(0xffEAEDEF),
    body: Column(
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
                  ConstStrings.Profile,
                  style: TextStyle(
                      fontSize: size.height * 0.028,
                      fontFamily: "NewsCycle-Bold"),
                  textAlign: TextAlign.center,
                )
              ],
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

                  hintText: "Fathi3ayari333@gmail.com",

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


            }),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: BuildLoginButton(size,ConstStrings.Logout,(){

              InfoMessage(message: "Vous etes sure de deconnecter ?",press:() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
              },).show(context);
            }),
          ),
        ),
      ],
    ),
  );
}