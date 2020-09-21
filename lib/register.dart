import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SharedPre.dart';
import 'postmodel.dart';

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
        backgroundColor: Colors.black12,
        title: Text('Register Screen'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/20.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _fKey,
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
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Password :",
                            ),
                            SizedBox(
                              height: 5,
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
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                  ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "Email:",
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              onFieldSubmitted: (value) {
                                //Validator
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Email is required';
                                }
                                if (!RegExp(
                                        "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                                    .hasMatch(value)) {
                                  return 'Enter a valid email address';
                                }
                                return null;
                              },
                              controller: emailController,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
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
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  RaisedButton(
                      color: Colors.deepPurple,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('Register'),
                          ],
                        ),
                      ),
                      onPressed: () async{

                          Post post = Post(
                              email: emailController.text,
                              nameSurname: nameController.text,
                              password: passwordController.text,
                          );
                          createPost(post).then((response){
                            if(response.statusCode > 200)
                              print(response.body);
                            else
                              print(response.statusCode);
                          }).catchError((error){
                            print('error : $error');
                          });







                        /*
                        if(_fKey.currentState.validate()) {
                          var email = emailController.text;
                          var password = passwordController.text;
                          var nameSurname = nameController.text ;

                          var response = await register(nameSurname, email,
                              password);
                          print(response);
                        }
                       // _sbt();
                       // SharedPrefs.saveMail(emailController.text);
                        //SharedPrefs.savePassword(passwordController.text);
                        //SharedPrefs.saveName(nameController.text);
                        //SharedPrefs.saveSurName(surnameController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Login();
                            },
                          ),
                        );*/
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
