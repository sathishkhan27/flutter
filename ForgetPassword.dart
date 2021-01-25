import 'dart:convert';
import 'Flutkart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/LoginPage.dart';
import 'package:flutter_app/LoginResponse.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/HomePage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:f_grecaptcha/f_grecaptcha.dart';
import 'package:flutter/src/widgets/text.dart';
class ForgetPassword extends StatefulWidget {
  ForgetPassword({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

Future<LoginResponse> createUser(String name, String jobTitle) async{
  final String apiUrl = "https://myshop.bhumaha.com/mobauthenticate";
  final body=jsonEncode({'username':name,'password':jobTitle});
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
const String SITE_KEY = "6LdE10UUAAAAAD5Mw7XeDU2VUgMchgAI_qk3sos8";
enum _VerificationStep {
  SHOWING_BUTTON, WORKING, ERROR, VERIFIED
}
class _ForgetPasswordState extends State<ForgetPassword> {

  LoginResponse _user;

  final TextEditingController nameController = TextEditingController();
  bool valuefirst = false;
  bool valuesecond = false;
// Start by showing the button inviting the user to use the example
  _VerificationStep _step = _VerificationStep.SHOWING_BUTTON;

  void _startVerification() {
    setState(() => _step = _VerificationStep.WORKING);

    FGrecaptcha.verifyWithRecaptcha(SITE_KEY).then((result) {
      /* When using reCaptcha in a production app, you would now send the $result
         to your backend server, so that it can verify it as well. In most
         cases, an ideal way to do this is sending it together with some form
         fields, for instance when creating a new account. Your backend server
         would then take the result field and make a request to the reCaptcha
         API to verify that the user of the device where the registration
         request is from is a human. It could then continue processing the
         request and complete the registration. */
      setState(() => _step = _VerificationStep.VERIFIED);
    }, onError: (e, s) {
      print("Could not verify:\n$e at $s");
      setState(() => _step = _VerificationStep.ERROR);
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget content;
    switch (_step) {
      case _VerificationStep.SHOWING_BUTTON:

        content = new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Flutkart.color1,
                    value: this.valuefirst,
                    onChanged: (bool value) {
                      setState(() {
                        this.valuefirst = value;
                        if(value){
                          _startVerification;
                        }
                      });
                    },
                  ),
                  Text('I"m not Robot ',style: TextStyle(fontSize: 15.0), ),
                ],
              ),
              new RaisedButton(
                  onPressed: _startVerification,
                  child: const Text("VERIFY"),
                )

            ]
        );
        break;
      case _VerificationStep.WORKING:
        content = new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new CircularProgressIndicator(),
              new Text("Trying to figure out whether you're human"),
            ]
        );
        break;
      case _VerificationStep.VERIFIED:
        content = new Text(
            "The reCaptcha API returned a token, indicating that you're a human. "
                "In real world use case, you would send use the token returned to "
                "your backend-server so that it can verify it as well."
        );
        break;
      case _VerificationStep.ERROR:
        content = new Text(
            "We could not verify that you're a human :( This can occur if you "
                "have no internet connection (or if you really are a a bot)."
        );
    }

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
                      'ForgetPassword',
                      style: TextStyle(color : Colors.black ,fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Id',
                    ),
                  ),
                ),
                Positioned(
                    width: MediaQuery.of(context).size.width,
                    top: MediaQuery.of(context).size.width * 0.30,//TRY TO CHANGE THIS **0.30** value to achieve your goal
                    child: Container(
                      margin: EdgeInsets.all(16.0),
                      child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/recaptcha.png', width: 80, height: 80, fit: BoxFit.fill,),
                            SizedBox(height: 20,),
                          ]
                      ),
                    )),

            Container(
                    child: content,
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
                      child: Text('Get Password'),
                      onPressed: () async {
                        print(nameController.text);

                        final String name = nameController.text;

                        final LoginResponse user = await createUser(name, name);
                        _navigateToNextScreen(context);
                        setState(() {
                          _user = user;
                        });
                      },
                    )),
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
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(title: 'Flutter Demo Home Page')));
  }
}
