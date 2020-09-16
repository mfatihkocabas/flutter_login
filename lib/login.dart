import 'package:flutter/material.dart';
import 'package:pathp1/register.dart';
import 'homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SharedPre.dart';
import 'register.dart';

var mailController = TextEditingController();
var passController = TextEditingController();

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Login screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Email:",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        controller: mailController,
                        obscureText: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true))
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
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                        controller: passController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true))
                  ],
                ),
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text('Login'),
                onPressed: (){
                  SharedPrefs.saveMail(mailController.text);
                  SharedPrefs.savePassword(passController.text);
                  if(emailController.text==mailController.text && passwordController.text==passController.text) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage()));
                  }

                  // Navigator.push(context, MaterialPageRoute(builder: (context){
                  //  return Homepage();
                  //},),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}