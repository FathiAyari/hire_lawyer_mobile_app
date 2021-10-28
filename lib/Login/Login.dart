import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/HomePage/HomePage.dart';
import 'package:hire_lawyer/Register/infoMessage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../Register/CreateAccount.dart';
import '../ForgotPassword/ForgotPassword.dart';
import '../Values/Strings.dart';
import 'ActionButton.dart';
import 'DividerBox.dart';
import 'FormFieldPassword.dart';
import 'emailFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hasConnection=false;
  bool loading =false;
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

  loginerUserVerif(BuildContext context) {
    String str = verifyInput();
    if (str.isNotEmpty) {
      InfoMessage(
        message: str,
        press: () {
          Navigator.pop(context);
        },
      ).show(context);
    } else
      SignIn();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                  Form(
                    child: emailFormField(
                      size: size,
                      controller: emailController,
                      prefixIcon: Icons.email_outlined,
                    ),
                    key: _formKey,
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
             !loading?BuildLoginButton(size, ConstStrings.Login, () {
                loginerUserVerif(context);
              }):CircularProgressIndicator.adaptive(),
              Container(
                padding: EdgeInsets.only(top: 200, bottom: 10),
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
                    Navigator.of(context).push(MaterialPageRoute(
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
    );
  }
  void showcustomSnackBar(BuildContext context,String content) {
    final snackbar = SnackBar(
      content: Text('$content'),
      backgroundColor: Colors.green,
      shape: StadiumBorder(),
      elevation: 0,
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackbar);
    setState(() {
      loading=false;
    });
  }
  Future<void> SignIn() async {
   try{ Future.delayed(Duration(milliseconds: 100), () {
     setState(() {
       loading=true;
     });
   });
     await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

     Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
   }catch(e) {
     hasConnection=await InternetConnectionChecker().hasConnection;
     if(hasConnection==false){
       setState(() {
         loading=!loading;
       });

       return  InfoMessage(
         message:"Verfiez votre connexion internet ",
         press: () {
           setState(() {
             loading=!loading;
           });
           Navigator.pop(context);
         },
       ).show(context);

     }else   {
       setState(() {
         loading=!loading;
       });
       return  InfoMessage(
         message:"Votre email ou bien mot de passe est incorrect",
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
}
