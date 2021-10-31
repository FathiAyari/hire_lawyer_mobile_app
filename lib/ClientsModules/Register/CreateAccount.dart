import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/ClientsModules/HomePage/HomePage.dart';
import 'package:hire_lawyer/Login/ActionButton.dart';
import 'package:hire_lawyer/Login/DividerBox.dart';
import 'package:hire_lawyer/Login/FormFieldPassword.dart';
import 'package:hire_lawyer/Login/Login.dart';
import 'package:hire_lawyer/Login/emailFormField.dart';
import 'package:hire_lawyer/Values/Strings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'infoMessage.dart';
import 'nameFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
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
  bool loading =false;
  File _image;
  bool hasConnection=false;
Future<void> insertUserFireStore()async{
  final FirebaseAuth auth = await FirebaseAuth.instance;
  final User user = auth.currentUser;
  final uid = user.uid;
 await FirebaseFirestore.instance
      .collection('users').doc(uid).set({"email":user.email,"nom":usernameController.text,"role":"User"});

}
  Future<void> SignUp() async{
   try{
     await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
     insertUserFireStore();

   }catch(e){
    if(hasConnection==false){
      print("error here ${e.message}");
    }
   }
  }
  Future getProfileImage()async{
    final image=await ImagePicker().pickImage(
      source: ImageSource.gallery ,
    );
    final imageTemporary=File(image.path);
    setState(() {
      _image=imageTemporary;
    });
  }
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
  registerUserVerification(BuildContext context) async {

    setState(() {
      loading=true;
    });
    String str=verifyInput();
    hasConnection=await InternetConnectionChecker().hasConnection;
    if (str.isNotEmpty) {
      InfoMessage(message: str,press:() {
        Navigator.pop(context);

        setState(() {
          loading=!loading;
        });
      },).show(context);
    }else if(hasConnection==true) {
      SignUp();
       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
       setState(() {
         loading=true;
       });
    }else return  InfoMessage(
      message:"Verfiez votre connexion internet",
      press: () {
        setState(() {
          loading=false;
        });
        Navigator.pop(context);
      },
    ).show(context);
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
                 backgroundColor: Colors.white38,
                 radius: 80,
                backgroundImage: _image==null? AssetImage('assets/images/user.png'):FileImage(_image) ,
               ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 10,end: 2),
                    child: CircleAvatar(
                    backgroundColor:Colors.transparent,
                      child:IconButton(
                        onPressed: (){
                          getProfileImage();
                        },
                          icon:Icon(Icons.add_photo_alternate_sharp,
                            color: Colors.blueAccent,
                            size: 40,)
                      ),
                    ),
                  ),

                ],
              ),
              DividerBox(size: size,height: 0.01,),
              nameFormField(size: size, controller: usernameController,preixIcon: Icons.account_circle_sharp,),
              emailFormField(size: size, controller: emailController,prefixIcon: Icons.email_outlined,),
              FormFieldPassword(size: size, controller: passwordController,preixIcon:Icons.lock_outline,obscuretext: obscureText,suffixIcon: IconButton(
                icon: obscureText ?SuffixPassword:Icon(Icons.visibility_off),
                color: obscureText ? Colors.blueAccent:Colors.white,
                onPressed: (){
                  setState(() {
                    this.obscureText=!obscureText;

                  });
                },
              ),),
              !loading?BuildLoginButton(size,ConstStrings.CreateAccount,(){

                registerUserVerification(context);
              }):CircularProgressIndicator.adaptive(),
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
RegExp regex =  RegExp(pattern);
return (!regex.hasMatch(value)) ? false : true;
}