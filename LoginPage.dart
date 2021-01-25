import 'dart:convert';
import 'package:flutter_app/ForgetPassword.dart';
import 'Flutkart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/LoginResponse.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/HomePage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:flutter_app/Signuppage.dart';
import 'package:flutter_app/flutter_recaptcha_v2.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

Future<LoginResponse> createUser(String name, String password) async{
  final String apiUrl = "https://tts.nambakada.com/authenticate";
  final body=jsonEncode({'username':name,'password':password});
  print(body);
  final response = await http.post(apiUrl,headers: {"Content-Type":"application/json"}, body:body);
  if(response.statusCode == 200){
    final String responseString = response.body;
    return userModelFromJson(responseString);
  }else{
    return null;
  }
}

Future<LoginResponse> userModelFromJson(String responseString) {
  print(responseString);
}
class _LoginPageState extends State<LoginPage> {
  LoginResponse _user;
  String verifyResult = "";
  RecaptchaV2Controller recaptchaV2Controller = RecaptchaV2Controller();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: Padding(
            padding: EdgeInsets.all(10),

            child: ListView(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 100.0),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'TTS',
                      style: TextStyle(
                          color: Flutkart.color1,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Login',
                      style: TextStyle(color : Colors.black ,fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Flutkart.color1,
                      child: Text('Login'),
                      onPressed: () async {
                        print(nameController.text);
                        print(passwordController.text);
                        final String name = nameController.text;
                               final String jobTitle = passwordController.text;
                               final LoginResponse user = await createUser(name, jobTitle);
                        _navigateToNextScreen(context);
                               setState(() {
                                 _user = user;
                               });
                      },
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('New User?'),
                        FlatButton(
                          textColor: Flutkart.color1,
                          child: Text(
                            'SignUp',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            //signup screen
                            _signupnavigation(context);
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),


                FlatButton(
                  onPressed: (){
                    //forgot password screen
                    _forgetpasswordnavigation(context);
                  },
                  textColor: Flutkart.color1,
                  child: Text('Forgot Password'),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Copyright @ Bhumaha -2020',
                      style: TextStyle(color : Colors.black ,fontSize: 10),
                    ))
              ],
            )));

  }
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(title: 'Flutter Demo Home Page')));
  }

  void _signupnavigation(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signuppage(title: 'Flutter Demo Home Page')));

  }

  void _forgetpasswordnavigation(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPassword(title: 'Flutter Demo Home Page')));

  }
}
