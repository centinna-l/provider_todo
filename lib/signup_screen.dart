


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUP extends StatefulWidget {
  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child:Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: emailController,),
              TextField(controller: phoneController,),
              TextField(controller: passwordController,),
              TextButton( child: Text("Signup"))
            ],
          )
      ),
    );
  }
}
