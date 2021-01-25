import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/LoginPage.dart';
import 'Flutkart.dart';

class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.white;

  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  final splashDelay = 5;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage(title: 'Flutter Demo Home Page')));
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text(
                        Flutkart.name,
                        style: TextStyle(
                            color: Flutkart.color1,
                            fontWeight: FontWeight.bold,
                            fontSize: 34.0),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50.0),
                      ),
                      Text(
                        Flutkart.namebody,

                        style: TextStyle(

                            color: Flutkart.color1,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 50.0),
                    ),
                    Text(
                      "Loading...",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Flutkart.color1),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );

  }


}

