import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/Login/Login.dart';
import 'package:hire_lawyer/onboardingPage/Onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplasScreen extends StatefulWidget {


  @override
  _SplasScreenState createState() => _SplasScreenState();
}


class _SplasScreenState extends State<SplasScreen> {
  int isViewed;
  getViewed() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences test = await SharedPreferences.getInstance();
    isViewed= await test.getInt('Onboard');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getViewed();
    Timer(Duration(seconds: 2), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> isViewed!=0? Onboarding():Login())));
  }
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(


              children:  [

                SizedBox(
                  height: size.height * 0.2,
                ),
                Container(
                  alignment: Alignment.center,
                  child:  Image.asset('assets/images/logo.png',
                    width: size.width * 0.9,),
                ),
                Container(

                  child: const Text("Hire Lawyer ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,

                      fontFamily:'Teko-Medium',
                    ),),
                ),
                CircularProgressIndicator(),
              ],
            ),
          ),
        )
    );
  }
}
