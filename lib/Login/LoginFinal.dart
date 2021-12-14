import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/ClientsModules/HomePage/HomePage.dart';
import 'package:hire_lawyer/ClientsModules/Register/CreateAccount.dart';
import 'package:hire_lawyer/ClientsModules/Register/infoMessage.dart';
import 'package:hire_lawyer/Real_time_internet_connection_check/Connectivity_provider.dart';
import 'package:hire_lawyer/Real_time_internet_connection_check/NoInternetConnection.dart';
import 'package:hire_lawyer/Services/AuthServices.dart';
import 'package:hire_lawyer/Services/DbServices.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../LawyersModules/LawyerHomePage.dart';
import '../ForgotPassword/ForgotPassword.dart';
import '../Values/Strings.dart';
import 'ActionButton.dart';
import 'DividerBox.dart';
import 'FormFieldPassword.dart';
import 'emailFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget Positive() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueAccent
      ),
      child: TextButton(
          onPressed: () {
            exit(0);
          },
          child: Text(" Oui",
            style: TextStyle(
              color:Color(0xffEAEDEF),
            ),)),
    );
  }
  Widget Negative(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(" Non"));
  }
  bool hasConnection = false;
  bool loading = false;
  bool obscureText = true;
  Widget SuffixPassword = Icon(Icons.visibility);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String verifyInput() {
    String result = "";

    if (emailController.text.isEmpty || !validateEmail(emailController.text)) {
      result += "Veuillez verifier l'email";
    } else if (passwordController.text.isEmpty) {
      result += "Veuillez verifier le mot de passe ";
    }
    return result;
  }
  loginerUserVerif(BuildContext context) async {
setState(() {
  loading=true;
});
    bool check;
      String str = verifyInput();
    if (str.isNotEmpty) {
      InfoMessage(
        message: str,
        press: () {
          Navigator.pop(context);
          setState(() {
            loading=false;
          });
        },
      ).show(context);
    } else{
      try{
        check= await AuthServices().signIn(emailController.text,passwordController.text);
        final FirebaseAuth auth = await FirebaseAuth.instance;
        final User user = await auth.currentUser;
        final uid = user.uid;
        var snapshotName =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
        if(check){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => snapshotName["role"] == "Admin"
                      ? HomePageLawyer()
                      : HomePage()));
        }
      } catch (e){
        setState(() {
          loading=false;
        });
        return InfoMessage(
          message:"Verfiez votre connexion internet",
          press: () {
            setState(() {
              loading=false;
            });
            Navigator.pop(context);
          },
        ).show(context);
      }
    }


  }
  @override


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                content: Text(" êtes-vous sûr de sortir ?"),
                actions: [Negative(context), Positive()],
              );
            });
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white24,
                  Colors.blueGrey,
                ],
              ),
            ),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/images/hire_lawyer.png',
                    )),
                Column(
                  children: [
                    DividerBox(
                      size: size,
                      height: 0.08,
                    ),
                    emailFormField(
                      size: size,
                      controller: emailController,
                      prefixIcon: Icons.email_outlined,
                    ),
                    FormFieldPassword(
                      size: size,
                      controller: passwordController,
                      preixIcon: Icons.lock_outline,
                      obscuretext: obscureText,
                      suffixIcon: IconButton(
                        icon: obscureText
                            ? SuffixPassword
                            : Icon(Icons.visibility_off),
                        color: obscureText ? Colors.blueAccent : Colors.white,
                        onPressed: () {
                          setState(() {
                            this.obscureText = !obscureText;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 60, vertical: 45),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: Text("Mot de passe oublié ?",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                          )),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                      },
                    ),
                  ),
                ),
                !loading
                    ? BuildLoginButton(size, ConstStrings.Login, () {
                  loginerUserVerif(context);
                })
                    : CircularProgressIndicator.adaptive(),
                SizedBox(
                  height: size.height * 0.25,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: Colors.white, // Text colour here
                            width: 1.0, // Underline width
                          ))),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccount()));
                    },
                    child: Text(
                      "Créer un compte ",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}