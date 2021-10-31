import 'package:flutter/cupertino.dart';

class NoInternetConnection extends StatefulWidget {


  @override
  _NoInternetConnectionState createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text("no internet connection")
      ,));
  }
}
