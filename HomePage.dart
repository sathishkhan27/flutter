import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Flutkart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/LoginResponse.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';
import 'package:flutter/src/widgets/text.dart';
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
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


class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar( actions: <Widget>[

        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
        ),
        IconButton(
          icon: Icon(
            Icons.notifications_active_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
        ),
        IconButton(
          icon: Icon(
            Icons.logout,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
        )
      ],backgroundColor:Flutkart.color1,title: Text('TTS')),
      body: Center(child: Text('Home')),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[

            DrawerHeader(
              child:Row(children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.asset("assets/images/account.png", width: 80, height: 80, fit: BoxFit.fill,),
                ),
                SizedBox(width: 8,),
                RichText(text: TextSpan(children: [
                  TextSpan(text: "Sathish Sivakumar\n", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Bhumaha', color: Colors.white)),
                  TextSpan(text: "btm@bumaha.com", style: TextStyle(fontFamily: 'Bhumaha', color: Colors.white)),
                ]),),
              ],),

              decoration: BoxDecoration(
                color: Flutkart.color1,

              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home,color: Flutkart.color1,),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/Home');
              },
            ),
            ListTile(
              title: Text('Add Product'),
              leading: Icon(Icons.queue_play_next_rounded,color: Flutkart.color1),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/AddProduct');
              },
            ),
            ListTile(
              title: Text('Customers'),
              leading: Icon(Icons.account_circle_rounded,color: Flutkart.color1),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/Customers');
              },
            ),
            ListTile(
              title: Text('Change Password'),
              leading: Icon(Icons.lock_open_sharp,color: Flutkart.color1),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/ChangePassword');
              },
            ),
            ListTile(
              title: Text('Delivery Update'),
              leading: Icon(Icons.agriculture,color: Flutkart.color1),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/Delivery');
              },
            ),
            ListTile(
              title: Text('Add Category'),
              leading: Icon(Icons.category,color: Flutkart.color1),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/AddCategory');
              },
            ),
            ListTile(
              title: Text('Publish'),
              leading: Icon(Icons.publish,color: Flutkart.color1),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/Publish');
              },
            ),
            ListTile(
              title: Text('Shopping List'),
              leading: Icon(Icons.library_books_rounded,color: Flutkart.color1),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/Shopping');
              },
            ),
            ListTile(
              title: Text('MyOrders'),
              leading: Icon(Icons.shopping_cart,color: Flutkart.color1),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/MyOrders');
              },
            ),
          ],
        ),
      ),


    );
  }
}
