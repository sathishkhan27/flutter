import 'dart:convert';
import 'package:flutter_app/Flutkart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/LoginResponse.dart';
import 'package:flutter_app/SplashScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TTS',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:SplashScreen(),
    );
  }
}

