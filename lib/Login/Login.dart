import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/HomePage/HomePage.dart';
import 'package:hire_lawyer/Register/infoMessage.dart';

import '../Register/CreateAccount.dart';
import '../ForgotPassword/ForgotPassword.dart';
import '../Values/Strings.dart';
import 'ActionButton.dart';
import 'DividerBox.dart';
import 'FormFieldPassword.dart';
import 'emailFormField.dart';

class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscureText=true;
   Widget SuffixPassword=Icon(Icons.visibility);
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  String verifyInput() {
    String result ="";

     if(emailController.text.isEmpty || ! validateEmail(emailController.text)){

      result+="Veuillez verifier l'email";
    }
    else if(passwordController.text.isEmpty){
      result+= "Veuillez verifier le mot de passe ";
    }
    return result;
  }
  loginerUser(BuildContext context){
    String str=verifyInput();
    if (str.isNotEmpty) {
      InfoMessage(message: str,press:() {
        Navigator.pop(context);
      },).show(context);
    }else Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset:false,

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
                  child: Image.asset('assets/images/hire_lawyer.png',
                  )),
              Column(


                children: [
                  DividerBox(size: size,height: 0.08,),



                  Form(child: emailFormField(size: size, controller: emailController,prefixIcon: Icons.email_outlined,),
                  key: _formKey,
                  ),

                  FormFieldPassword(size: size, controller: passwordController,preixIcon:Icons.lock_outline,obscuretext: obscureText,suffixIcon: IconButton(
                    icon: obscureText ?SuffixPassword:Icon(Icons.visibility_off),
                    color: obscureText ? Colors.blueAccent:Colors.white,
                    onPressed: (){
                      setState(() {
                        this.obscureText=!obscureText;

                      });
                    },
                  ),),


                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 45),
                child: Container(

                  alignment: Alignment.centerRight,
                  child: GestureDetector(child:Text("Mot de passe oublié ?",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,

                      )),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPassword()));
                    },
                  ),
                ),
              ),
              BuildLoginButton(size,ConstStrings.Login,(){

                loginerUser(context);
              }),

              Container(
                padding:  EdgeInsets.only(top:200, bottom: 10),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(
                      color: Colors.white,  // Text colour here
                      width: 1.0, // Underline width
                    ))
                ),
                child: GestureDetector(onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CreateAccount()));
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateAccount()));
                }, child:Text("Créer un compte ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20

                ),),
                ),
              )
            ],
          ),),
      ),
    );
  }


}









