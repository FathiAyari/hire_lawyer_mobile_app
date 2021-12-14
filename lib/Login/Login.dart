import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/Real_time_internet_connection_check/Connectivity_provider.dart';
import 'package:hire_lawyer/Real_time_internet_connection_check/NoInternetConnection.dart';
import 'package:provider/provider.dart';

import 'LoginFinal.dart';
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
     resizeToAvoidBottomInset: false,
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