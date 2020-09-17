import 'package:flutter/material.dart';
import 'package:pathp1/register.dart';
import 'homepage.dart';
import 'SharedPre.dart';
import 'register.dart';


var mailController = TextEditingController();
var passController = TextEditingController();



class Login extends StatelessWidget{

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
                child: Form(
                  key: _fKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Email:",
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                          validator:( value) {
                        if(value.isEmpty){
                          return 'Email is required';
                        }
                        if(!RegExp("^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*").hasMatch(value)){
                          return 'Enter a valid email address';
                        }
                        return null;
                        },
                          controller: mailController,
                          obscureText: false,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true),),
                      Text(
                        "Password :",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a valid password!';
                        }
                        return null;
                      },
                          controller: passController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true))
                    ],
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text('Login'),
                onPressed: (){
                  _sbt();
                  SharedPrefs.saveMail(mailController.text);
                  SharedPrefs.savePassword(passController.text);
                  if(emailController.text==mailController.text && passwordController.text==passController.text) {
                    if (SharedPrefs.saveMail(mailController.text) != null && SharedPrefs.savePassword(passController.text) != null){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage()));
                  }}

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