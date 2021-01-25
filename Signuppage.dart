import 'dart:convert';
import 'Flutkart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/LoginResponse.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/HomePage.dart';
import 'package:flutter_app/LoginPage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter/src/widgets/text.dart';
class Signuppage extends StatefulWidget {
  Signuppage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SignuppageState createState() => _SignuppageState();
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
class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'Retail'),
      Company(2, 'Wholesale'),
    ];
  }
}
class _SignuppageState extends State<Signuppage> {

  LoginResponse _user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobilenumcontroller = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: Padding(
            padding: EdgeInsets.all(10),

            child: ListView(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 60.0),
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
                      'SignUp',
                      style: TextStyle(color : Colors.black ,fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: mobilenumcontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mobile Number',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: firstname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'FirstName',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: lastname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'LastName',
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                      children: <Widget>[
                        Text('Select Role :       ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                        SizedBox(

                          height: 20.0,
                        ),
                        DropdownButton(

                          value: _selectedCompany,
                          items: _dropdownMenuItems,
                          onChanged: onChangeDropdownItem,

                        ),
                        SizedBox(
                          height: 20.0,
                        ),

                      ],

                    )),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Flutkart.color1,
                      child: Text('Signup'),
                      onPressed: () async {
                        print(nameController.text);
                        print(mobilenumcontroller.text);
                        print(firstname.text);
                        print(lastname.text);
                        final String name = nameController.text;
                        final String mobile = mobilenumcontroller.text;
                        final String firstnam = firstname.text;
                        final String lastnam = lastname.text;
                        final LoginResponse user = await createUser(name, mobile);
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
