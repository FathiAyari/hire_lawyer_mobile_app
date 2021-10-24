import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/Register/registerController.dart';
import 'package:hire_lawyer/Values/Strings.dart';

import '../Login/ActionButton.dart';
import '../Login/DividerBox.dart';
import '../Login/FormFieldPassword.dart';
import '../Login/Login.dart';
import '../Login/emailFormField.dart';
import 'infoMessage.dart';
import 'nameFormField.dart';

class CreateAccount extends StatefulWidget {


  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController usernameController=TextEditingController();
  Widget SuffixPassword=Icon(Icons.visibility);
  bool obscureText=true;
  String verifyInput() {
    String result ="";
    if(usernameController.text.isEmpty ){
      result+="Veuillez verifier le nom de l'utilisateur";
    }
    else if(emailController.text.isEmpty || ! validateEmail(emailController.text)){

      result+="Veuillez verifier l'email";
    }
    else if(passwordController.text.isEmpty){
      result+= "Veuillez verifier le mot de passe ";
    }
    return result;
  }
  registerUser(BuildContext context){
    String str=verifyInput();
    if (str.isNotEmpty) {
      InfoMessage(message: str).show(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
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
              Align(
                  alignment: Alignment.topCenter,
                  child:Row(

                    children: [
                      IconButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
                      }, icon: Icon(Icons.arrow_back_ios)),
                      SizedBox(width: size.width * 0.15,),
                      Text(ConstStrings.CreateAccountLabel,
                        style: TextStyle(
                            fontSize: size.height * 0.028,
                            fontFamily: "NewsCycle-Bold"
                        ),
                        textAlign: TextAlign.center,)
                    ],
                  )
              ),

              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [

               CircleAvatar(
                 backgroundColor: Colors.white54,
                 radius: 80,
                 child: Icon(Icons.account_circle_outlined,
                 color: Colors.black26,
                 size: 40,),
               ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 10,end: 2),
                    child: CircleAvatar(
                    backgroundColor:Colors.transparent,
                      child: Icon(Icons.add_photo_alternate_sharp,
                      color: Colors.blueAccent,
                      size: 40,),
                    ),
                  ),

                ],
              ),
              DividerBox(size: size,height: 0.01,),
              nameFormField(size: size, controller: usernameController,preixIcon: Icons.account_circle_sharp,),
              emailFormField(size: size, controller: emailController,preixIcon: Icons.email_outlined,),
              FormFieldPassword(size: size, controller: passwordController,preixIcon:Icons.lock_outline,obscuretext: obscureText,suffixIcon: IconButton(
                icon: obscureText ?SuffixPassword:Icon(Icons.visibility_off),
                color: obscureText ? Colors.blueAccent:Colors.white,
                onPressed: (){
                  setState(() {
                    this.obscureText=!obscureText;

                  });
                },
              ),),
              BuildLoginButton(size,ConstStrings.CreateAccount,(){
                print("yy");
                registerUser(context);
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
                }, child:Text("Vous avez déjà un compte ?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20

                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}






 bool validateEmail(String value) {
Pattern pattern =
r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regex = new RegExp(pattern);
return (!regex.hasMatch(value)) ? false : true;
}