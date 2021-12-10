


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_management/item_list_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool _loading = false;
  GlobalKey<FormState> validatingKey = GlobalKey();

  @override
  void initState() async{

    await Provider.of<StateProvider>(context, listen: false).tryAutoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form( key: validatingKey,
      child: Scaffold(
        body: Container(
          child:Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },controller: emailController,decoration: InputDecoration(fillColor: Colors.grey, hintText: "email", enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),),
              TextFormField(validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },controller: passwordController,decoration: InputDecoration( fillColor: Colors.grey,hintText: "password", enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),),
              Container(color: Colors.blue,child: TextButton( child: Text("Submit"),onPressed: onSubmit))
            ],
          )
        ),
      ),
    );
  }
  Future<void>onSubmit()async {
    if(validatingKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });
      try {
        await Provider.of<StateProvider>(context, listen: false).login(
          emailController.text.toString(),
          passwordController.text.toString(),
        );
      } on HttpException catch(error){
        print(error);
      }
      print( Provider.of<StateProvider>(context, listen:false).token);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );


      setState(() {
        _loading = false;
      });
    }

  }
}
