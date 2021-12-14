
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hire_lawyer/Models/Users.dart';
import 'package:hire_lawyer/Services/DbServices.dart';

class AuthServices{
  final FirebaseAuth auth =  FirebaseAuth.instance;


  Future<bool> signIn(String emailController,String passwordController) async {
    try {
       await auth.signInWithEmailAndPassword(email: emailController, password: passwordController);

        return true;
    }on FirebaseException catch (e) {

     return false;
    }
  }





 Future<bool> signUp(String emailController,String passwordController ,String Name,String LastName)async{
    try{
     await auth.createUserWithEmailAndPassword(email: emailController, password: passwordController);
     await DbServices().saveUser(Cusers(
       uid: user.uid,
       Name: Name,
       LastName: LastName,
       Email: emailController,
       Role: "User",
       Url: "https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455__480.jpg"
     ));
      return true;
    }on FirebaseException catch(e){
      print("not ");
      return false ;
    }

 }


 Future<bool> resetPassword(String emailController) async {
   try{
     await auth.sendPasswordResetEmail(email: emailController);
     return true;
   }on FirebaseException catch(e){
     print(e.message);
      return false;
   }
  }



 User get user=>FirebaseAuth.instance.currentUser;
}