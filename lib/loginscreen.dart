import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child:Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: emailController,decoration: InputDecoration(fillColor: Colors.grey, hintText: "email", enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),),
              TextField(controller: passwordController,decoration: InputDecoration( fillColor: Colors.grey,hintText: "password", enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),),
              Container(color: Colors.blue,child: TextButton( child: Text("Submit")))
            ],
          )
      ),
    );
  }
}