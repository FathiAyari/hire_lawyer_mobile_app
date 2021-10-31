import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/ClientsModules/HomePage/HomePage.dart';
import 'package:hire_lawyer/ClientsModules/Register/CreateAccount.dart';
import 'package:hire_lawyer/ClientsModules/Register/infoMessage.dart';
import 'package:hire_lawyer/Real_time_internet_connection_check/Connectivity_provider.dart';
import 'package:hire_lawyer/Real_time_internet_connection_check/NoInternetConnection.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../LawyersModules/LawyerHomePage.dart';
import '../ForgotPassword/ForgotPassword.dart';
import '../Values/Strings.dart';
import 'ActionButton.dart';
import 'DividerBox.dart';
import 'FormFieldPassword.dart';
import 'LoginFinal.dart';
import 'emailFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
class LoginTest extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginTest> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ConnectivityProvider>(context,listen: false).  startListening();
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   return Scaffold(
     body: PageUi(),
   );
  }


}
Widget PageUi(){
  return Consumer<ConnectivityProvider>(
      builder: (context,model,child){
        if(model.isOnline !=null){
          return model.isOnline?Login():NoInternetConnection();
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
  );

}