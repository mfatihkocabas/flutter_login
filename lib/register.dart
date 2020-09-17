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

 final _fKey = GlobalKey<FormState>();
 void _sbt() {
    final isValid = _fKey.currentState.validate();
    if (!isValid) {
      return _sbt();
    }
    _fKey.currentState.save();
  }

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

                  child: Form(
                    key:_fKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Name:",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            onFieldSubmitted: (value) {
                              //Validator
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter a valid Name!';
                              }
                              return null;
                            },
                            controller: nameController,
                            obscureText: false,
                            decoration: InputDecoration(
                                border: InputBorder.none, filled: true),),
                        Text(
                          "Password :",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            onFieldSubmitted: (value) {
                              //Validator
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter a valid password!';
                              }
                              return null;
                            },

                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none, filled: true),),
                        Text(
                          "Email:",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            onFieldSubmitted: (value) {
                              //Validator
                            },
                            validator:(String value) {
                              if(value.isEmpty){
                                return 'Email is required';
                              }
                              if(!RegExp("^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*").hasMatch(value)){
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                            controller: emailController,
                            obscureText: false,
                            decoration: InputDecoration(
                                border: InputBorder.none, filled: true),),
                        Text(

                          "Surname",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            onFieldSubmitted: (value) {
                              //Validator
                            },

                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter a valid Surname!';
                              }
                              return null;
                            },
                            controller: surnameController,

                            obscureText: false,
                            decoration: InputDecoration(
                                border: InputBorder.none, filled: true))

                      ],
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.red,
                  child: Text('Register'),
                  onPressed: () { _sbt();
                   SharedPrefs.saveMail(emailController.text);
                   SharedPrefs.savePassword(passwordController.text);
                  SharedPrefs.saveName(nameController.text);
                   SharedPrefs.saveSurName(surnameController.text);
                   Navigator.push(
                     context, MaterialPageRoute(builder: (context) {
                     return Login();
                   },),);

                  } ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

