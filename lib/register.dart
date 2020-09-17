import 'package:flutter/material.dart';
import 'package:pathp1/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SharedPre.dart';

SharedPreferences localStorage;

var emailController = TextEditingController();
var passwordController = TextEditingController();
var nameController = TextEditingController();
var surnameController = TextEditingController();

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Register Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Name:",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          controller: nameController,
                          obscureText: false,
                          decoration: InputDecoration(
                              border: InputBorder.none, filled: true))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Surname",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          controller: surnameController,
                          obscureText: false,
                          decoration: InputDecoration(
                              border: InputBorder.none, filled: true))
                    ],
                  ),
                ),
                Container(

                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Email:",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          controller: emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                              border: InputBorder.none, filled: true))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Password :",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(

                          controller: passwordController,
                          obscureText: true,  
                          decoration: InputDecoration(
                              border: InputBorder.none, filled: true))
                    ],
                  ),
                ),
                RaisedButton(
                  color: Colors.red,
                  child: Text('Register'),
                  onPressed: () {

                    if (SharedPrefs.saveMail(emailController.text) == null){

                   return MaterialPageRoute(builder: (context){return Register();});
                    }
                    else {
                      SharedPrefs.saveMail(emailController.text);
                      SharedPrefs.savePassword(passwordController.text);
                      SharedPrefs.saveName(nameController.text);
                      SharedPrefs.saveSurName(surnameController.text);
                      SharedPrefs.login();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Login();
                          },
                        ),
                      );
                    }
                    ;
                  } ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
