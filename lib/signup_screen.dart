


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'item_list_provider.dart';
import 'main.dart';

class SignUP extends StatefulWidget {
  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool _loading = false;
  GlobalKey<FormState> validatingKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: validatingKey,
        child: Container(
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
                SizedBox(height: 30,),
                Container(color: Colors.blue,child: TextButton( child: Text("Sign UP"),onPressed: onSubmit)),
                SizedBox(height: 80,),
              ],
            )
        ),
      ),
    );
  }
  Future<void>onSubmit()async {
    String _error="noerror";
    if(validatingKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });
      try {
        await Provider.of<StateProvider>(context, listen: false).signup(
          emailController.text.toString(),
          passwordController.text.toString(),
        );
      } on HttpException catch(error){
        print(error);
        Fluttertoast.showToast(msg: error.toString(),toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM);
        _error="error";
      }
      if(_error.contains('noerror')){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
      setState(() {
        _loading = false;
      });
    }

  }
}
