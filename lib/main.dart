import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hire_lawyer/Login/Login.dart';
import 'package:hire_lawyer/onboardingPage/Onboarding.dart';
import 'package:hire_lawyer/splashScreen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Lawyers/Lawyers.dart';
int isViewed;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.blue,



      ),

  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);



  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      routes: {
        '/lawyers': (context) => Lawyers(),
      },
      home: Scaffold(

        body: SplasScreen(),
      ),
    );
  }
}
