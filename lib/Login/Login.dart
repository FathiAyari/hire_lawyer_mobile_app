import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CreateAccount.dart';
import '../ForgotPassword.dart';
import '../Strings.dart';
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
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset:false,

      body: Container(
        
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
            DividerBox(size: size,height: 0.06,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset('assets/images/agence.png')),
            ),
            Column(


              children: [
                DividerBox(size: size,height: 0.08,),



                emailFormField(size: size, controller: email,preixIcon: Icons.email_outlined,),

                FormFieldPassword(size: size, controller: password,preixIcon:Icons.lock_outline,obscuretext: obscureText,suffixIcon: IconButton(
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
              padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 10),
              child: Container(

                alignment: Alignment.centerRight,
                child: GestureDetector(child:Text("Mot de pass oublié ?",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,

                    )),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPassword()));
                  },
                ),
              ),
            ),
            BuildLoginButton(size,ConstStrings.Login),

            Container(
              padding:  EdgeInsets.only(top:50, bottom: 30),
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

              ),),
              ),
            )
          ],
        ),),
    );
  }


}









