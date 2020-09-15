import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SharedPre.dart';


var emailController = TextEditingController();
var pwdController = TextEditingController();

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
                        controller: emailController,
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
                        controller: pwdController,
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          Homepage()));


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