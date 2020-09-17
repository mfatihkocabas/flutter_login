import 'package:flutter/material.dart';



class Homepage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Homepage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
              child: Column(
                children:<Widget> [
                  Text('Hoşgeldiniz'),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
